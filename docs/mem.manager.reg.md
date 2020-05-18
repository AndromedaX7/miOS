## 内存管理寄存器
GDTR
LDTR
IDTR
TR

GDTR、LDTR、IDTR、TR都是段基址寄存器。这些段中含有分段机制的重要信息表
GDTR、LDTR、IDTR用于寻址存放描述符表的段，TR用于寻址一个特殊的任务状态段TSS。TSS段中包含着当前执行任务的重要信息。

1. GDTR 全局描述符表寄存器
    * 存放GDT的32位线性基地址和16位表长度值
2. IDTR 中断描述符表寄存器
3. LDTR 局部描述符表寄存器
4. TR 任务寄存器

[回到目录](index.md)