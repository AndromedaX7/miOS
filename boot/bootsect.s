.code16
.global _start,begtext,begdata,begbss,endtext,enddata,endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text
.equ BOOTSEG,0x07c0

_start:
    ljmp $BOOTSEG,$go
go:
    mov %cs,%ax
    mov %ax,%ds
    mov %ax,%es
    mov %ax,%ss
    mov $0xffff,%sp

    mov $20,%cx
    mov $0x1004,%dx
    mov $0x000c,%bx
    mov $msg1,%bp
    mov $0x1301,%ax
    int $0x10

output:
    mov $15,%cx
    mov $0x1100,%dx
    mov $0x000f,%bx
    mov $msg2,%bp
    mov $0x1301,%ax
    int $0x10

loop1:jmp loop1
msg1:
    .ascii "loading system... "
    .byte 13,10

msg2:
    .ascii "hello bootimg"
    .byte 13,10
.org 510
    .word 0xAA55
.text
endtext:
.data
enddata:
.bss
endbss:

