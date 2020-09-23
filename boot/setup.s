    .code16
    .global _start
    .equ SETUPSEG,0x9020
    .equ SYSSEG,0x1000
    .equ INITSEG,0x9000
    .text

load_setup_result:
    mov $SETUPSEG,%ax
    mov %ax,%ds
    mov %ax,%es
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10
    mov $0xf,%bl
    mov $msg,%bp
    mov $18,%cx
    mov $0x1301,%ax
    int $0x10
 ljmp $SETUPSEG,$_start
_start:
# 保存光标位置
    mov $INITSEG,%ax
    mov %ax,%ds
    mov $0x03,%ah
    xor %bh ,%bh
    int $0x10
    mov %dx,%ds:0
# 取扩展内存大小的值
    mov $0x88 ,%ah
    int $0x15
    mov %ax,%ds:2

# 取显卡显示模式
    mov $0x0f, %ah
	int $0x10
	mov %bx, %ds:4
	mov %ax, %ds:6

    mov $0x12, %ah
	mov $0x10, %bl
	int $0x10
	mov %ax, %ds:8
	mov %bx, %ds:10
	mov %cx, %ds:12
# 第一块硬盘参数表
	mov $0x0000, %ax
	mov %ax, %ds
	lds %ds:4*0x41, %si
	mov $INITSEG, %ax
	mov %ax, %es
	mov $0x0080, %di
	mov $0x10, %cx
	rep movsb

    mov $0x0000, %ax
    mov %ax, %ds
    lds %ds:4*0x46, %si
    mov $INITSEG, %ax
    mov %ax, %es
    mov $0x0090, %di
    mov $0x10, %cx
    rep movsb
load_setup_result2:
    mov $SETUPSEG,%ax
    mov %ax,%ds
    mov %ax,%es
    mov $0x03,%ah
    xor %bh,%bh
    int $0x10
    mov $0xa,%bl
    mov $msg,%bp
    mov $18,%cx
    mov $0x1301,%ax
    int $0x10
loop_forever:
    jmp  loop_forever


msg:
    .ascii "setup loading..."
    .byte 13,10
