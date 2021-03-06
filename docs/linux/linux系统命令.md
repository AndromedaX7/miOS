# Linux 系统命令
## etc/passwdo内容格式说明
列数|含义|说明
---|---|---
1|用户名|是UID的字符串标记方式
2|密码|在旧的UNIX系统中，该字段是用户加密后的密码，现在已经不  再使用，而是将密码放在etc/shadow中所以此处都三一个字母x
3|uid|系统用来区分不同用户数据的整数
4|GID|系统用来区分不同用户组的整数
5|说明栏|类似于“注释”，现在已经不再使用
6|家目栏|用户登陆后，所处的目录，即用户目录
7|登录shell|用户登录后，所使用的shell
## /etc/内容格式说明
列数|含义|说明
---|---|---
1|用户名|是UID的；字符串标记方式，方便阅读
2|密码|经过加密的密码
3|密码最近修改日|这个数字是从1970年1月1日至密码修改日的天数
4|密码不可修改的天数|修改密码后，几天内不可修改密码，如果是0，  则可以随时修改
5|密码从新修改天数|考虑到密码使用一段时间后可能会泄漏，可以设  置一个修改时间，在密码到期之前会提醒用户修改密码
6|密码失效前警告的天数|设定密码到期前几天开始提醒用户修改密码
7|密码失效宽限天数|如果密码到期，过了几天后将会失效，无法登录系统
8|账号失效日期|一般为空
9|保留字段|暂时没用作用
## linux账号管理
按照使用方式分为三种：根用户、系统用户、普通用户
### 新增和删除用户
1. 新增用户`useradd 用户名` `-u`指定新创建用户的UID `-g`指定用户所说group `-d`指定用户家目录
2. 修改密码`passwd 用户名` 需要root用户 普通用户运行系统会立即报错
3. 修改用户`usermod 用户名` `-d`修改家目录`-m`如果指定用户家目录存在，就自动创建新目录并自动使用该目录作为新目录（`-d`和`-m`同时使用 `-l`冻结账户 `-u`解锁账户
4. 删除账户`userdel 用户名` `-r`同时删除家目录和该用户邮件 一旦执行该用户的相关文件就会被全部删除
### 新增和删除用户组
在linux中使用`/etc/group`文件来记录用户组
`/etc/group`文件中每一行代表一个用户组 使用三个；隔开  
`用户组名；密码（不使用）；用户组的数字ID；组成员`
1. 增加用户组 `groupadd 用户组名`
2. 删除用户组 `groupdel 用户组名` 如有属于这个组的用户试图删除组操作会失败
### 检查用户信息
1. 查看用户 
`users` 列出用户名 
`who` 列出 `用户名  用户登录的终端  用户登录时间（网络登录同时会显示远程主机名/IP地址`  
`w` 第一行会显示当前时间、系统运行时间、已登录的用户数量、系统负载 下面显示信息为 `登录用户名  用户登录终端  如果用户从网络登录，则显示远程主机的主机名/IP地址  用户登录时间  用户闲置时间  与终端相关的当前所运行所有消耗的CPU时间总量  当前WHAT列所对应的进程所消耗的CPU时间总量  用户当前运行的进程`
2. 切换用户  
`su` 切换到root用户但是用户环境不变（`etc/passwd`中定义的家目录等还是原用户的）  
`su -`切换到root用户并同时更换用户环境  
`sudo` 以root用户身份执行命令（`etc/sudoers`文件用来配置用户是否有sudo权限）  
 `visudo`用来编辑 `etc/sudoers` 文件会执行自动检查语法错误 需要更改内容 `root  ALL=（ALL） ALL`在这行下面增加一行 `用户名  ALL（ALL）  ALL` 如果想要实现不输入密码就能执行命令 `用户名  ALL=（ALL） NOPASSWD：ALL` 最后一个ALL是指用户可以执行的命令，可以替换成准许的命令  
 ### 例行任务管理
 1. 单一时刻执行一次任务 `at`  
 ```
at 时间
 at > 执行操作
 Ctrd+D(键盘快捷键)
```
`atq`  查询任务列表
`atrm 任务编号`
  
 
[回到目录](../index.md)