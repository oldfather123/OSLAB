#include "riscv.h"
#include "def.h"

#define PGSIZE 4096
// 物理内存上限
#define PHYSTOP (0x80000000L + 128 * 1024 * 1024)
#define NULL ((void *)0)

// kernel.ld定义的内核代码结束地址
extern char end[];

struct run {
	struct run *next;
};

struct {
	struct spinlock lock;
	struct run *freelist;
} pmm;

void pmm_init(void) {
	initlock(&pmm.lock, "pmm");
    freerange(end, (void *)PHYSTOP);
}

void freerange(void *pa_start, void *pa_end) {
    // 对齐起始地址
	char *p = (char *)PGROUNDUP((unsigned long)pa_start);
	for (; p + PGSIZE <= (char *)pa_end; p += PGSIZE)
		free_page(p);
}

void *alloc_page(void) {
	struct run *r;

    // 维护空闲链表
	acquire(&pmm.lock);
	r = pmm.freelist;
	if (r) 
		pmm.freelist = r->next;
	release(&pmm.lock);

	if (r)
        // 填充垃圾数据
		memset((char *)r, 5, PGSIZE);
	return (void *)r;
}

void free_page(void *page) {
	struct run *r;

    // 检查地址合法性
	if (((unsigned long)page % PGSIZE) != 0 || (char *)page < end || (unsigned long)page >= PHYSTOP)
		panic("free_page: invalid page");

    // 填充垃圾数据 
	memset(page, 1, PGSIZE);

    // 头插法加入空闲页面
	r = (struct run *)page;
	acquire(&pmm.lock);
	r->next = pmm.freelist;
	pmm.freelist = r;
	release(&pmm.lock);
}

// TODO
void *alloc_pages(int n) {
    struct run *r;
    void *start;
    
    acquire(&pmm.lock);
    
    // 检查是否有足够的页面
    r = pmm.freelist;
    int available = 0;
    struct run *temp = r;
    while (temp) {
        available++;
        temp = temp->next;
        if (available >= n) break;
    }
    if (available < n) {
        // 空闲页不足
        release(&pmm.lock);
        panic("alloc_pages: not enough pages");
        return NULL;
    }

    // 记录连续页面初始地址
    start = (void*)r;
    
    // 提取n个空闲页面，加入新的链表
    struct run *store = NULL;
    struct run *temp1 = NULL;
    temp = r;
    for (int i = 0; i < n; i++) {
        struct run *new_node = temp;
        if (store == NULL) {
            store = new_node;
            temp1 = new_node; 
        } 
        else {
            temp1->next = new_node;
            temp1 = temp1->next;
        }
        temp = temp->next;
    }
    pmm.freelist = temp->next;
    temp1->next = NULL;
    
    release(&pmm.lock);

    int index = 1;
    temp1 = store;
    printf("Traversing store list:\n");
    while (temp1) {
        printf("Node %d\n", index);
        temp1 = temp1->next;
        index++;
    }
    
    // 填充垃圾数据
    temp = store;
    index = 1;
    while (temp) {
        memset((void*)temp, 5, PGSIZE);
        printf("alloc_pages: page %d filled with garbage data\n", index);
        temp = temp->next;
        index++;
        printf(temp?"next node available\n":"no next node\n");
    }
    
    return start;
}