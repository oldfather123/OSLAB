#include "def.h"
#include "assert.h"
#include "riscv.h"

__attribute__ ((aligned (16))) char stack_top[4096];

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

    // 测试数据写入
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
    kvminit();
    kvminithart();
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

void main() {
    // Lab1
    // uart_puts("Hello OS");

    // Lab2
    // test_printf_basic();
    // test_printf_edge_cases();

    // Lab3
    pmm_init();
    test_physical_memory();
    test_pagetable();
    test_virtual_memory();
}