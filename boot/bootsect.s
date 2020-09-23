    .code16
    .global _start
    .global begtext, begdata, begbss, endtext, enddata, endbss
    .text
    begtext:
    .data
    begdata:
    .bss
    begbss:
    .text
    .equ BOOTSEG,0x07c0
    .equ INITSEG,0x9000
    .equ SETUPSEG,0x9020
    .equ SYSSEG,0x1000
    ljmp $BOOTSEG,$_start
_start:
    mov $BOOTSEG,%ax
    mov %ax,%ds
    mov $INITSEG,%ax
    mov %ax,%es
    sub %si,%si
    sub %di,%di
    mov $256,%cx
    rep movsw
show_os_banner:
    mov $INITSEG,%ax
    mov %ax,%es
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10

    mov $13,%cx
    mov $msg,%bp
    mov $0x1301,%ax
    mov $0x000f,%bx
    int $0x10

load_setup:
    mov $0x0000, %dx
    mov $0x0002,%cx
    mov $SETUPSEG,%ax
    mov %ax,%es
    mov $4,%al
    mov $0x02,%ah
    mov $0,%bx
    int $0x13
    jnc setup_load_success
    jmp show_os_banner2
setup_load_success:
    mov $INITSEG,%ax
    mov %ax ,%ds
    ljmp $SETUPSEG,$0
show_os_banner2:
    mov $INITSEG,%ax
    mov %ax,%es
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10

    mov $15,%cx
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
    .byte 13,10,13,10

    .org 510
boot_flag:
    .word 0xaa55
