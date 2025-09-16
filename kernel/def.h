void uart_putc(char c);
void uart_puts(char *s);

void console_putc(char c);
void console_puts(const char *s);

void print_number(int num, int base, int sign);
int printf(const char *fmt, ...);