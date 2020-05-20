## at&t汇编指令
汇编指令|含义
---|---
*.ascii*|"定义字符串"
*.asciz*"|定义字符串并以\0结尾"
*.byte expr*|定义0个或多个用逗号分开的字节值
*.comm symbol,length*|在bss段声明一个命名的公共区域
*.data subsection*|通知as把随后的语句汇编到编号为subsection的data子段中如果省略编号则默认使用编号0
*.desc symbol,abs-expr*|用绝对表达式的值设置符号symbold的描述字段 n_desc的16位值
*.fill repeat,size,value*|产生 repeat个，大小为size字节的重复拷贝 size:0..8 每个重复字节内容取自第一个8字节内容高4个字节为0低4字节为value 。
*.global symbol*|链接器可见的全局符号
*.int expr*|在某个段中设置0个或多个整数值（80386：4个字节）
*.long expr*|同 .int
*.word expr*|0个或多个用逗号分隔的2字节整数值 同.short expr
*.quad expr*|0个或多个用逗号分隔的8字节大数
*.lcomm symbol,length*|在公共区域保留长度为length字节的空间
*.octa bignum*|0个或多个用逗号分隔的16字节大数（ .byte 1 .word 2 .long 4 .quad 8)
*.org new_lc,fill*|把当前段的位置计数器设置为new_lc ,new_lc是一个绝对值，或者是具有相同区作为子区的表达式， 即不能使用.org跨越各区。当位置计数器增长时，所跳过的字节将被填入值fill,默认fill为0
*.space size,fill*|产生size个字节，每个字节填值fill 如果省略逗号和fill 则填入0
*.string "string"*|定义一个或多个字符串，字符串中可以使用转义字符，每个字符串都自动附加一个null字符结尾
*.text subsection*|通知as把随后的语句汇编到编号为subsection的text子段中如果省略编号则默认使用编号0
### 汇编指令:   
[标志位条件跳转](eflags.reg.md/)    
`out %al,$0x20`
`xor`
`lidt`
`lgdt`
### 中断向量表
[中断向量表](int中断.md) 
### 显示字符串:          
```
mov %ax,%es     #es:bp为字符串地址
mov $msg1,%bp   #ax当前段信息，msg1字符串定义
mov $len,%cx    #cx:字符串长度
mov $0x000f,%bx,  #bx:显示属性，颜色
mov $0x0000,%dx   #dx:显示位置
mov $0x1301,%ax  #ax:1301  ah:功能号，al:子功能号
int $0x10       #int:0x10 中断号
```

### 移动内存数据
```
mov $ADDR_FROM,%ax 
mov %ax,%ds
mov $ADDR_TO,%ax
mov %ax,%es
mov $MEM_LEN,%cx
sub %si,%si
sub %di,%di
rep movsw  #移动双字 总大小= MEM_LEN*2
```

### 读磁盘
```
AH=02
AL=要读取的扇区数
CH=磁盘柱面编号低8位
CL=扇区编号1-63（位0-5）
DH=磁头号
DL=驱动器号
ES:BX -> 数据缓冲区

返回值
如果AH = 11h（更正的ECC错误），则
CF设置为错误，AL =突发长度，
如果成功则CF清除
```
[回到目录](index.md)