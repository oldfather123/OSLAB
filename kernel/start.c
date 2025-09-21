#include "def.h"
#include "assert.h"

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
    void *page1 = alloc_page(); 
    void *page2 = alloc_page(); 
    assert(page1 != page2); 
    assert(((unsigned long)page1 & 0xFFF) == 0);  // 页对齐检查

    *(int*)page1 = 0x12345678; 
    assert(*(int*)page1 == 0x12345678); 

    free_page(page1); 
    void *page3 = alloc_page(); 
    free_page(page2); 
    free_page(page2);
    free_page(page3); 
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
}