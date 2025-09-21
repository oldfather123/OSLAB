// global definitions
#define PGSIZE 4096
#define NULL ((void *)0)

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
void *alloc_pages(int n);

// string.c
void *memset(void *dst, int c, unsigned int n);