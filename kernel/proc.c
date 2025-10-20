#include "def.h"

struct proc proc_table[NPROC];
struct spinlock table_lock;
struct spinlock pid_lock;
int next_pid = 1;

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
    acquire(&p->lock);
    p->state = UNUSED;
    p->pid = 0;
    release(&p->lock);
}

int create_process(void (*entry)(void)) {
    struct proc *p = alloc_process();
    // 没有可用进程表项
    if (!p) 
        return -1;

    // 将进程状态设置为可运行
    p->state = RUNNABLE;
    release(&p->lock);
    return p->pid;
}

void exit_process(struct proc *p, int status) {
    acquire(&p->lock);
    p->xstate = status;
    release(&p->lock);

    // 直接释放进程资源
    free_process(p);

    panic("exit_process: should not return");
}

int wait_process(int *status) {
    acquire(&table_lock);

    for (int i = 0; i < NPROC; i++) {
        struct proc *p = &proc_table[i];
        acquire(&p->lock);

        // 找到一个已分配的进程
        if (p->state == USED) {
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