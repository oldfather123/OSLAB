#include "def.h"

unsigned long sys_exit(int status) {
    exit_process(current_proc, status);
    return 0;
}

unsigned long sys_getpid(void) {
    return current_proc->pid;
}

// unsigned long sys_fork(void) {
//     return fork();
// }

unsigned long sys_wait(int *status) {
    return wait_process(status);
}