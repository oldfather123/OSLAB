// global definitions
#define NULL ((void *)0)
#define PGSIZE 4096
#define UART0 0x10000000L
#define KERNBASE 0x80000000L
#define PHYSTOP (0x80000000L + 128 * 1024 * 1024)
#define IRQ_TIMER 127

// uart.c
void uart_putc(char c);
void uart_puts(char *s);

// console.c
void console_putc(char c);
void console_puts(const char *s);

// printf.c
void print_number(int num, int base, int sign);
void print_ptr(unsigned long x);
int printf(const char *fmt, ...);
void panic(char*) __attribute__((noreturn));
void clear_screen(void);

// spinlock.c
struct spinlock {
    unsigned int locked;
    char *name;          
};
void initlock(struct spinlock *lk, char *name);
void acquire(struct spinlock *lk);
void release(struct spinlock *lk);

// kalloc.c
void pmm_init(void);
void freerange(void *pa_start, void *pa_end);
void *alloc_page(void);
void free_page(void *page);
void free_page_to_freelist(void *page);
void *alloc_pages(int n);

// string.c
void *memset(void *dst, int c, unsigned int n);

// vm.c
typedef unsigned long pte_t;
typedef unsigned long* pagetable_t;
pagetable_t create_pagetable(void);
int map_page(pagetable_t pt, unsigned long va, unsigned long pa, unsigned long size, int perm);
void destroy_pagetable(pagetable_t pt);
pte_t* walk_create(pagetable_t pt, unsigned long va);
pte_t* walk_lookup(pagetable_t pt, unsigned long va);
void kvminit(void);
void kvminithart(void);
void map_region(pagetable_t kpgtbl, unsigned long va, unsigned long pa, unsigned long sz, int perm);

// trap.c
typedef void (*interrupt_handler_t)(void);
struct trapframe {
    unsigned long sepc;
    unsigned long sstatus;
    unsigned long stval;
    unsigned long scause;
};
void trap_init(void);
void kerneltrap(void);
void register_interrupt(int irq, interrupt_handler_t handler);
void unregister_interrupt(int irq);
void enable_interrupt(int irq);
void disable_interrupt(int irq);
void interrupt_dispatch(unsigned long scause);
void handle_division_by_zero(struct trapframe *tf);
void handle_syscall(struct trapframe *tf);
void handle_instruction_page_fault(struct trapframe *tf);
void handle_load_page_fault(struct trapframe *tf);
void handle_store_page_fault(struct trapframe *tf);
void handle_exception(struct trapframe *tf);

// sbi.c
void sbi_set_timer(unsigned long time);
unsigned long get_time(void);