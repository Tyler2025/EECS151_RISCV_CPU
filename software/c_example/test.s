.section    .start
.global     _start

_start:
    lui     x5, 1234
    auipc   x6, 1235
    jal     x7, 1236
    jalr    x8, x1, 1237
    beq     x9, x2, main
    bne     x10,x3, main
    blt     x11,x4, main
    bge     x12,x5, main
    bltu    x13,x6, main
    bgeu    x14,x7, main
    lb      x15, 8(x8)
    lh      x16, 8(x9)
    lw      x17, 8(x10)
    lbu     x18, 8(x11)
    lhu     x19, 8(x12)
    sb      x20, 8(x13)
    sh      x21, 8(x14)
    sw      x22, 8(x15)
    addi    x23, x16, -50  
    slti    x24, x17, -51
    sltiu   x25, x18, 1238
    xori    x26, x19, 1239
    ori     x27, x20, 1240
    andi    x28, x21, 1241
    slli    x29, x22, 14
    srli    x30, x23, 15
    srai    x31, x24, 16
    add     x0, x25, x1
    sub     x1,  x26, x2
    sll     x2,  x27, x3
    slt     x3,  x28, x4
    sltu    x4,  x29, x5
    xor     x5,  x30, x6
    srl     x6,  x31, x7
    sra     x7,  x0, x8
    or      x8,  x1 , x9
    and     x9,  x2 , x10
    csrrw   x0, 0x51E,  x10
    csrrwi  x0, 0x51E,  1
main:
    sub     x2, x1, x3 #ALU - ALU
    and     x12,x2, x5
    nop
    sub     x2,x1,x3
    and     x12,x5,x2
    nop
    lw      x2,5(x1)  #MEM - ALU
    and     x12,x2,x5
    nop
    lw      x2,5(x1)
    and     x12,x5,x2
    nop
    addi    x1,x2,100 #ALU - MEM
    sw      x1,0(x3)
    nop
    addi    x1,x2,100
    sw      x3,0(x1)
    nop
    lw      x1,0(x2) #MEM - MEM
    sw      x1,4(x2)
    nop
    lw      x1,0(x2)
    sw      x3,0(x1)
    nop
    addi    x1,x1,100 #branch
    beq     x1,x2,main
    nop
    addi    x1,x1,100
    bne     x2,x1,main
    nop
    addi    x1,x2,100 #2 cycles
    nop
    addi    x1,x1,100
    addi    x1,x2,100
    nop
    add     x2,x2,x1
    addi    x1,x1,100
    nop
    beq     x1,x2,main
    addi    x2,x2,100
    nop
    bne     x1,x2,main




