#include "riscv.h"
#include "def.h"

#define MAX_INTERRUPTS 128  // 最大支持的中断数

// 中断向量表
interrupt_handler_t interrupt_vector[MAX_INTERRUPTS];

void kernelvec();

void trap_init(void) {
    // 设置S模式陷阱向量，发生中断时跳转到kernelvec
    w_stvec((unsigned long)kernelvec);
    
    // 开启全局中断
    intr_on(); 

    // 初始化中断向量表
    for (int i = 0; i < MAX_INTERRUPTS; i++) {
        interrupt_vector[i] = 0;
    }
}

void kerneltrap(void) {
    // 保存中断发生时的CSR寄存器值
    unsigned long sepc = r_sepc();       
    unsigned long sstatus = r_sstatus(); 
    unsigned long scause = r_scause(); 

    // 检查中断来自S模式
    if ((sstatus & SSTATUS_SPP) == 0) {
        panic("kerneltrap: not from supervisor mode");
    }

    // 检查全局中断是否关闭，避免中断嵌套
    if (intr_get() != 0) {
        panic("kerneltrap: interrupts enabled");
    }

    // 调用中断分发函数
    interrupt_dispatch(scause);

    // 恢复中断前的CSR寄存器值
    w_sepc(sepc);
    w_sstatus(sstatus);
}

void register_interrupt(int irq, interrupt_handler_t handler) {
    if (irq < 0 || irq >= MAX_INTERRUPTS) {
        panic("Invalid IRQ number");
    }

    // 将中断向量表中的处理函数设为handler
    interrupt_vector[irq] = handler;
}

void unregister_interrupt(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPTS) {
        panic("Invalid IRQ number");
    }

    // 清空中断向量表的处理函数
    interrupt_vector[irq] = 0;
}

void enable_interrupt(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPTS) {
        panic("Invalid IRQ number");
    }

    if (irq == IRQ_TIMER) {
        // 开启时钟中断
        w_sie(r_sie() | SIE_STIE); 
    } 
}

void disable_interrupt(int irq) {
    if (irq < 0 || irq >= MAX_INTERRUPTS) {
        panic("Invalid IRQ number");
    }

    if (irq == IRQ_TIMER){
        // 关闭时钟中断
        w_sie(r_sie() & ~SIE_STIE);  
    }
}

// 中断分发函数
void interrupt_dispatch(unsigned long scause) {
    if (scause == 0x8000000000000005L) {
        // 调用时钟中断处理函数
        if (interrupt_vector[IRQ_TIMER]) {
            interrupt_vector[IRQ_TIMER]();
        }
        else {
            panic("Unregistered timer interrupt\n");
        }
    } 
    else {
        panic("Unexpected interrupt\n");
    }
}