#include "uart.h"
#include "types.h"

int main(){
    uint8_t a = 16;
    uint8_t b = 17;
    uint8_t c = a + b;
    uwrite_int8(c);
    return 0;
}
