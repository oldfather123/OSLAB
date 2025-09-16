#include <stdarg.h>
#include "def.h"

void print_number(int num, int base, int sign) {
    char buf[20];
    int i = 0;
    unsigned int x;

    // 负数转换为正数
    if (sign && num < 0)
        x = -num;
    else
        x = num;
    
    // 将数字逐位存入 buf
    do {
        int digit = x % base;
        if (digit < 10)
            buf[i++] = '0' + digit;
        else
            buf[i++] = 'a' + (digit - 10);
        x /= base;
    } while (x != 0);

    // 添加负号
    if (sign && num < 0) {
        buf[i++] = '-';
    }

    // 逆序输出
    while (--i >= 0) {
        console_putc(buf[i]);
    }
}

int printf(const char *fmt, ...) {
    va_list ap;
    va_start(ap, fmt);

    for (const char *p = fmt; *p; p++) {
        // 普通字符直接输出
        if (*p != '%') {
            console_putc(*p);
            continue;
        }
        // 遇到 '%'，解析格式符
        p++;
        switch (*p) {
            // 十进制
            case 'd': { 
                print_number(va_arg(ap, int), 10, 1);
                break;
            }
            // 十六进制
            case 'x': { 
                print_number(va_arg(ap, unsigned int), 16, 0);
                break;
            }
            // 字符串
            case 's': { 
                char *str = va_arg(ap, char *);
                if (str == 0) {
                    str = "(null)";
                }
                console_puts(str);
                break;
            }
            // 单个字符
            case 'c': { 
                char c = (char)va_arg(ap, int);
                console_putc(c);
                break;
            }
            // '%'
            case '%': { 
                console_putc('%');
                break;
            }
            // 未知格式符
            default: { 
                console_puts("Unknown code: %");
                console_putc(*p);
                console_putc('\n');
                break;
            }
        }
    }

    va_end(ap);
    return 0;
}