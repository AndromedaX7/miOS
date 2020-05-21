    .code16
    .global _start
    .text
    .equ BOOTSEG,0x07c0
    ljmp $BOOTSEG,$_start
_start:
    mov $BOOTSEG,%ax
    mov %ax,%es
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10

    mov $13,%cx
    mov $msg,%bp
    mov $0x1301,%ax
    mov $0x000f,%bx
    int $0x10

loop_forever:
    jmp loop_forever

sectors:
    .word 0

msg:
    .ascii "hello miOS!"
    .byte 13,10

    .org 510
boot_flag:
    .word 0xaa55
