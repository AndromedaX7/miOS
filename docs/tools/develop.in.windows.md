## 在windows上运行，适用64位操作系统
1. 首先需要[下载cygwin]( https://www.cygwin.com/setup-x86_64.exe )
2. 配置cygwin,其中要包含`gcc` `make` `gdb` `g++`
3. [下载qemu x64](https://qemu.weilnetz.de/w64/qemu-w64-setup-20200201.exe)
4. 安装qemu 
5. [下载](https://github.com/git-for-windows/git/releases/download/v2.26.2.windows.1/Git-2.26.2-64-bit.exe )并安装git
6. 从github clone此项目到你的计算机
    ``` 
   mkdir your/project/root-path && cd  your/project/root-path
   git clone https://github.com/AndromedaX7/miOS.git
   ```
7. 设置qemu-system-x86_64.exe的绝对路径到[Makefile.head](../../Makefile.head)的如下位置
    ``` 
   ifeq ($(OS),CYGWIN_NT-10.0)
   	AS		= as.exe
   	AFLAGS 	= -g --64
   	LD		= ld.exe
   	LDFLAGS	= -m elf_x86_64
   	OBJCOPY      = objcopy.exe
   	QEMU 	= qemu-system-x86_64.exe的绝对路径
   endif
    ```
8. 打开`powershell`输入如下内容,$Cygwin64是cygwin的安装目录
    
    ```
   $Cygwin64/bin/mintty.exe
   ```
9. 在cygwin terminal(即powershell打开的终端窗口) 中定位到此项目
    ```
   cd your/project/path/miOS
   cd boot && make run
   ```