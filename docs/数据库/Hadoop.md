[Hadoop官网](http://hadoop.apache.org/)  
Hadoop是一个由Apache基金会所开发的分布式系统基础架构。用户可以在不了解分布式底层细节的情况下，开发分布式程序。充分利用集群的威力进行高速运算和存储。Hadoop实现了一个分布式文件系统（Hadoop Distributed File System)，简称**HDFS**。HDFS有高容错性的特点，并且设计用来部署在低廉的（low-cost）硬件上；而且它提供高吞吐量（high throughput）来访问应用程序的数据，适合那些有着超大数据集（large data set）的应用程序。HDFS放宽了（relax）POSIX的要求，可以以流的形式访问（streaming access）文件系统中的数据。Hadoop的框架最核心的设计就是：HDFS和MapReduce。HDFS为海量的数据提供了存储，而MapReduce则为海量的数据提供了计算。
---
## 环境配置 ##
jdk（linux内置需要卸载重装）之后配置环境变量
```
sudo vim /etc/profile
(最后一行）
#java_home
export java_home=(安装目录）
export PATH=$PATH:$java_home/bin
#hadoop_home
export hadoop_home=(安装目录）
export PATH=$PATH:$hadoop_home/bin:$hadoop_home/sbin
保存退出
source /etc/profile
java version和Hadoop version 检查是否存在和版本
```
