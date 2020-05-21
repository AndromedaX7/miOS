    .code16
    .equ INITSEG,0x9000
    .equ SETUPSEG,0x9020
    .equ SYSSEG,0x1000
    .global _start ,begtext,begdata,begbss,endtext,enddata,endbss
    .text
    begtext:
    .data
    begdata:
    .bss
    begbss:
    .text

    ljmp $SETUPSEG,$_start
_start:
    mov $INITSEG,%ax
    mov %ax,%ds
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10
    mov %dx,%ds:0 # 保存光标位置 0x90000


 #   mov $0x03,%ah
 #   int $0x10

    mov $0x1000,%dx
    mov %cs,%ax
    mov %ax,%es
    mov $18,%cx
    mov $msg,%bp
    mov $0x000f,%bx
    int $0x10
# GET memory Size
    mov $0x88,%ah
    int $0x15
    mov %ax,%ds:2 # 保存内存大小 0x90002
# GET video card data:
 #   mov $0x0f,%ah
 #   int $0x10
 #   mov %bx,%ds:4 # bh display page 0x90004
 #   mov %ax,%ds:6 # al video mode ,ah window width 0x90006

#check for ega /vga and some config parameters
# 获取ega信息
  #  mov $0x12,%ah
  #  mov $0x10,%bl
  #  int $0x10
  #  mov %ax,%ds:8
  #  mov %bx,%ds:10
  #  mov %cx,%ds:12
msg:
    .ascii "setup loading..."
    .byte 13,10
