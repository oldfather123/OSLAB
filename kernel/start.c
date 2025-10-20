#include "def.h"
#include "assert.h"
#include "riscv.h"

__attribute__ ((aligned (16))) char stack_top[4096];

// unsigned long last_sepc = 0x80200000;

// Lab2
void test_printf_basic() {
    printf("Testing integer: %d\n", 42);
    printf("Testing negative: %d\n", -123);
    printf("Testing zero: %d\n", 0);
    printf("Testing hex: 0x%x\n", 0xABC);
    printf("Testing string: %s\n", "Hello");
    printf("Testing char: %c\n", 'X');
    printf("Testing percent: %%\n");
}
void test_printf_edge_cases() {
    printf("INT_MAX: %d\n", 2147483647);
    printf("INT_MIN: %d\n", -2147483648);
    printf("NULL string: %s\n", (char*)0);
    printf("Empty string: %s\n", "");
}

// Lab3
void test_physical_memory(void) { 
    // 测试基本分配
    void *page1 = alloc_page(); 
    void *page2 = alloc_page(); 
    assert(page1 != page2); 
    assert(((unsigned long)page1 & 0xFFF) == 0);  // 页对齐检查
    printf("Basic allocation test passed.\n");

    // 测试数据读写
    *(int*)page1 = 0x12345678; 
    assert(*(int*)page1 == 0x12345678); 
    printf("Data write&read test passed.\n");

    // 测试释放和重新分配
    free_page(page1); 
    void *page3 = alloc_page(); 
    free_page(page2); 
    free_page(page3); 
    printf("Free and reallocation test passed.\n");
}
void test_pagetable(void) {
    pagetable_t pt = create_pagetable(); 
    
    // 测试基本映射
    unsigned long va = 0x1000000; 
    unsigned long pa = (unsigned long)alloc_page(); 
    assert(map_page(pt, va, pa, PGSIZE, PTE_R | PTE_W) == 0);
    printf("Basic mapping test passed.\n");
    
    // 测试地址转换
    pte_t *pte = walk_lookup(pt, va); 
    assert(pte != 0 && (*pte & PTE_V));
    assert(PTE2PA(*pte) == pa); 
    printf("Address translation test passed.\n");
    
    // 测试权限位
    assert(*pte & PTE_R); 
    assert(*pte & PTE_W); 
    assert(!(*pte & PTE_X)); 
    printf("Permission bits test passed.\n");
}
void test_virtual_memory(void) {
    printf("Before enabling paging...\n");

    // 启用分页
    kvm_init();
    kvm_inithart();
    printf("After enabling paging...\n");
    
    // 测试内核代码仍然可执行
    test_printf_basic();
    printf("Code execution test passed.\n");
    
    // 测试内核数据仍然可访问
    test_physical_memory();
    printf("Data access test passed.\n");
    
    // 测试设备访问仍然正常
    uart_puts("Hello OS\n");
    printf("Device access test passed.\n");
}
void test_alloc_pages(void) {
    // 独立分配3个页面，释放其中2个，使得空闲页链表前两个地址不连续
    void *page1 = alloc_page(); 
    void *page2 = alloc_page();
    void *page3 = alloc_page();
    free_page(page1);
    free_page(page3);
    
    int n = 3;
    // 分配3个连续页面
    void *base = alloc_pages(n);
    
    assert(base != 0);
    assert(((unsigned long)base & 0xFFF) == 0);  // 页对齐检查
    printf("Continuous allocation test passed.\n");

    for (int i = 0; i < n; i++) {
        char *pi = (char*)base + i * PGSIZE;

        // 页面连续性检查
        if (i > 0) {
            char *prev = (char*)base + (i - 1) * PGSIZE;
            assert(pi - prev == PGSIZE);
            printf("Page %d is continuous.\n", i);
        }

        // 页面读写检查
        *(int*)pi = 0x12345678 + i;
        assert(*(int*)pi == 0x12345678 + i);
        printf("Page %d write&read test passed.\n", i);
    }

    // 逐页释放
    for (int i = 0; i < n; i++) {
        free_page((char*)base + i * PGSIZE);
    }

    printf("Continuous page free test passed.\n");
    free_page(page2);
}

// Lab4
volatile int interrupt_count = 0;
void timer_interrupt(void) {
    interrupt_count++;
    printf("Timer interrupt triggered! Count: %d\n", interrupt_count);

    // 设置下一次时钟中断
    sbi_set_timer(get_time() + 1000000);
}
void test_timer_interrupt(void) { 
    printf("Testing timer interrupt...\n"); 

    // 注册时钟中断处理函数
    register_interrupt(IRQ_TIMER, timer_interrupt);

    // 先安排第一次时钟中断
    unsigned long start_time = get_time();
    sbi_set_timer(start_time + 1000000);  // 安排首次触发

    // 开启时钟中断
    enable_interrupt(IRQ_TIMER);

    // 等待5次中断
    while (interrupt_count < 5) { 
        printf("Waiting for interrupt %d...\n", interrupt_count + 1); 
        // 简单延时
        for (volatile int i = 0; i < 10000000; i++);
    } 
 
    // 记录中断后的时间
    unsigned long end_time = get_time();

    // 打印测试结果
    printf("Timer test completed:\n");
    printf("Start time: %x\n", start_time);
    printf("End time: %x\n", end_time);
    printf("Total interrupts: %d\n", interrupt_count);

    // 注销时钟中断处理函数
    unregister_interrupt(IRQ_TIMER);

    // 关闭时钟中断
    disable_interrupt(IRQ_TIMER);
}
void test_exception_handling(void) {
    printf("Testing exception handling...\n");

    // 非法指令异常
    printf("Illegal Instruction Test\n");
    asm volatile(".word 0xFFFFFFFF\n"
                 "nop\n"              
                 "nop\n"
                 "nop\n");

    // 系统调用异常（需要做用户态和内核态切换）
    // printf("System Call Exception\n");
    // asm volatile("ecall\n");
    // asm volatile("nop\nnop\nnop\n");

    // 指令页异常（越界地址跳转有问题）
    // printf("Instruction Page Fault\n");
    // volatile unsigned long *invalid_instr = (unsigned long *)0xFFFFFFFF00000000UL;
    // printf ("Jumping to invalid instruction address: 0x%x\n", (unsigned long)invalid_instr>>32);
    // last_sepc = r_sepc();
    // printf("Current sepc: 0x%x\n", last_sepc);
    // asm volatile(
    //     "mv t0, %0\n\t"
    //     "jalr x0, 0(t0)\n\t"
    //     :
    //     : "r"(invalid_instr)
    //     : "t0", "memory"
    // );
    // asm volatile("nop\nnop\nnop\n");

    // 加载页异常
    printf("Load Page Fault Test\n");
    volatile unsigned long *bad_load = (unsigned long *)0xFFFFFFFF00000000UL;
    unsigned long bad_value = *bad_load;
    (void)bad_value;
    asm volatile("nop\nnop\nnop\n");

    // 存储页异常
    printf("Store Page Fault Test\n");
    volatile unsigned long *bad_store = (unsigned long *)0xFFFFFFFF00000000UL;
    *bad_store = 0x66;
    asm volatile("nop\nnop\nnop\n");

    printf("Exception tests completed\n");
}
void pt_init(void) {
    pmm_init();
    kvm_init();
    kvm_inithart();
}

void main() {
    // Lab1
    // uart_puts("Hello OS");

    // Lab2
    // test_printf_basic();
    // test_printf_edge_cases();
    // clear_screen();

    // Lab3
    // pmm_init();
    // test_alloc_pages();
    // test_physical_memory();
    // test_pagetable();
    // test_virtual_memory();

    // Lab4
    pt_init();
    trap_init();
    test_timer_interrupt();
    test_exception_handling();
}