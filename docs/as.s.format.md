## at&t汇编指令
1. *.ascii*"定义字符串"
2. *.asciz*"定义字符串并以\0结尾"
3. *.byte expr* 定义0个或多个用逗号分开的字节值
4. *.comm symbol,length* 在bss段声明一个命名的公共区域
5. *.data subsection* 通知as把随后的语句汇编到编号为subsection的data子段中如果省略编号则马尔使用编号0
6. *.desc symbol,abs-expr* 用绝对表达式的值设置符号symbold的描述字段 n_desc的16位值
7. *.fill repeat ,size ,value* 产生 repeat个，大小为size字节的重复拷贝 size:0..8 每个重复字节内容取自第一个8字节内容高4个字节为0低4字节为value ,
8. *.global symbol* 链接器可见的全局符号
9. *.int expr 在某个段中设置0个或多个整数值（80386：4个字节）*
10. *.long expr 同 .int*
11. *.word expr 同.short expr*
12. *.quad expr*
13. *.lcomm symbol ,length* 在公共区域保留长度为length字节的空间
14. *.octa bignum* 0个或多个用逗号分隔的16字节大数（ .byte 1 .word 2 .long 4 .quad 8)
15. *.org new_lc,fill* 把当前段的位置计数器设置为new_lc ,new_lc是一个绝对值，或者是具有相同区作为子区的表达式， 即不能使用.org跨越各区。当位置计数器增长时，所跳过的字节将被填入值fill,默认fill为0
16. *.space size,fill* 产生size个字节，每个字节填值fill 如果省略逗号和fill 则填入0
17. *.string* “string” 定义一个或多个字符串，字符串中可以使用转义字符，每个字符串都自动附加一个null字符结尾
18. *.text* subsection
            
###显示字符串:          
```
mov %ax,%es     #es:bp为字符串地址
mov %cx,$len    #cx:字符串长度
mov %bx,0x000f  #bx:显示属性，颜色
mov %dx,0x0000  #dx:显示位置
mov %ax,0x1301  #ax:1301  ah:功能号，al:子功能号
int $0x10       #int:0x10 中断号
```

[回到目录](index.md)