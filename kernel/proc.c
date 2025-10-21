#include "def.h"
#include "riscv.h"

struct spinlock table_lock;
struct spinlock pid_lock;
int next_pid = 1;
// 调度器上下文
struct context sched_ctx; 

int alloc_pid(void) {
    int pid;

    // 简单递增，使用原子操作避免重复pid
    acquire(&pid_lock);
    pid = next_pid;
    next_pid = next_pid + 1;
    release(&pid_lock);

    return pid;
}

void proc_init(void) {
    // 创建进程表自旋锁
    initlock(&table_lock, "proc_table");
  
    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &proc_table[i];
        // 初始化进程表项
        initlock(&p->lock, "proc");
        p->state = UNUSED;
        p->kstack = 0;
        p->priority = 0;
    }
}

struct proc* alloc_process(void) {
    acquire(&table_lock);

    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &proc_table[i];
        acquire(&p->lock);
    
        // 寻找未分配的进程表项
        if (p->state == UNUSED) {
        p->state = USED;
        p->pid = alloc_pid();

        p->kstack = alloc_page();
        if (!p->kstack) {
            // 无法分配内核栈，释放资源并返回
            p->state = UNUSED;
            p->pid = 0;
            release(&p->lock);
            release(&table_lock);
            return 0;
        }

        // 设置上下文
        unsigned long sp = (unsigned long)p->kstack + PGSIZE;
        p->context.sp = sp;
        p->context.ra = 0;
        release(&table_lock);

        // 返回时保持p->lock
        return p; 
        }

        release(&p->lock);
    }

    release(&table_lock);
    return 0;
}

void free_process(struct proc *p) {
    if (p->kstack) {
        free_page(p->kstack);
        p->kstack = 0;
    }
    p->state = UNUSED;
    p->pid = 0;
    p->priority = 0;
}

int create_process(void (*entry)(void)) {
    struct proc *p = alloc_process();
    // 没有可用进程表项
    if (!p) 
        return -1;

    // 设置进程入口
    p->context.ra = (unsigned long)entry;
    
    // 将进程状态设置为可运行
    p->state = RUNNABLE;
    release(&p->lock);
    return p->pid;
}

int exit_count = 0;
void exit_process(struct proc *p, int status) {
    acquire(&p->lock);
    p->xstate = status;
    p->state = ZOMBIE;
    release(&p->lock);

    if (current_proc == p) {
        current_proc = 0;
    }
    exit_count++;

    // 切换回调度器
    swtch(&p->context, &sched_ctx);
}

int wait_process(int *status) {
    acquire(&table_lock);
    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &proc_table[i];
        acquire(&p->lock);

        // 找到一个已分配的进程
        if (p->state == RUNNABLE) {
            int pid = p->pid;
            if (status) {
                // 获取退出状态
                *status = p->xstate;
            }
            // 直接释放进程资源
            free_process(p); 
            release(&p->lock);
            release(&table_lock);
            
            // 返回进程pid
            return pid;
        }

        release(&p->lock);
    }

    release(&table_lock);
    return -1;
}

void set_proc_priority(int pid, int pri) {
    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &proc_table[i];
        acquire(&p->lock);
        if (p->pid == pid) {
            p->priority = pri;
            release(&p->lock);
            return;
        }
        release(&p->lock);
    }
}

void scheduler(void) {
    struct proc *p;
    struct proc *chosen;
    int highest_priority;

    for (;;) {
        if (exit_count == 3) 
            return;
        intr_on();
        chosen = 0;
        highest_priority = -1;

        // 选择优先级最高的可运行进程
        for (p = proc_table; p < &proc_table[NPROC]; p++) {
            acquire(&p->lock);
            if (p->state == RUNNABLE) {
                int pr = p->priority;
                if (pr > highest_priority) {
                    highest_priority = pr;
                    chosen = p;
                }
            }
            release(&p->lock);
        }

        if (chosen) {
            acquire(&chosen->lock);
            if (chosen->state == RUNNABLE) {
                // 将进程状态设置为运行中
                chosen->state = RUNNING;
                current_proc = chosen;
                
                // 降低优先级以循环调用进程
                chosen->priority -= 3;
                release(&chosen->lock);

                // 保存调度器上下文，恢复进程上下文，运行进程内容
                swtch(&sched_ctx, &chosen->context);

                // 清除当前进程
                current_proc = 0;
            }
            else
                release(&chosen->lock);
        }
    }
}

void yield(void) {
    struct proc *p = current_proc;
    acquire(&p->lock);
    p->state = RUNNABLE;
    release(&p->lock);

    // 保存进程上下文，回到调度器
    swtch(&p->context, &sched_ctx);   
}