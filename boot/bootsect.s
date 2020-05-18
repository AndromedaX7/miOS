    .code16
    .global _start,begtext,begdata,begbss,endtext,enddata,endbss
    .text
    begtext:
    .data
    begdata:
    .bss
    begbss:
    .text
    .equ SETUPLEN,4
    .equ BOOTSEG,0x07c0
    .equ INITSEG,0x9000
    .equ SETUPSEG,0x9020
    ljmp $BOOTSEG,$_start
_start:
    mov $BOOTSEG,%ax
    mov %ax,%ds
    mov $INITSEG,%ax
    mov %ax,%es
    mov $256,%cx
    sub %si,%si
    sub %di,%di
    rep
    movsw
    ljmp $INITSEG,$go
go:
    mov %cs,%ax
    mov %ax,%ds
    mov %ax,%es
    mov %ax,%ss
    mov $0xff00,%sp
load_setup:
    mov $0x0000,%dx
    mov $0x0002,%cx
    mov $0x0200,%bx
    .equ AX,0x0200+SETUPLEN
    mov $AX,%ax
    int $0x13
    jnc ok_load_setup
    mov $0x0000,%dx
    mov $0x0000,%ax
    int $0x13
output:
    mov $27,%cx
    mov $0x000c,%bx
    mov $msg,%bp
    mov $0x1000,%dx
    mov $0x1301,%ax
    int $0x10
    jmp load_setup

ok_load_setup:

msg:
    .ascii "[error]:dont have setup.s"
    .byte 13,10

.org 510
    .word 0xAA55
.text
endtext:
.data
enddata:
.bss
endbss:
