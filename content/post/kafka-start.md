---
title: "使用 kafka, 基本环境和安装"
date: 2018-05-06T15:14:00+08:00
tags: ["kafka"]
draft: false
---

介绍基本的安装和使用

<!--more-->


## centos7 下的 javac 的问题 {#centos7-下的-javac-的问题}

centos 默认安装的是 OpenJDK 没有 javac
如果需要 javac

```shell
yum install java-devel
```


## Kafka 管理器 kafka-manager 安装 {#kafka-管理器-kafka-manager-安装}

运行环境要求:

1.  Kafka0.8.1.1+
2.  sbt0.13.X
3.  Java 7+


## kafka 安装 {#kafka-安装}

-   下载
-   解压


## sbt 安装 {#sbt-安装}

```shell
$ wget https://github.com/sbt/sbt/releases/download/v1.1.1/sbt-1.1.1.tgz
$ sudo mkdir /opt/scala/sbt                                             # 建立目录，解压文件到所建立目录
$ sudo tar -zxvf sbt-1.1.1.tgz -C /opt/scala/
$ cd /opt/scala/sbt
$ vim sbt                                                               # /*选定一个位置，建立启动sbt的脚本文本文件，如/opt/scala/sbt/ 目录下面新建文件名为sbt的文本文件*/
BT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
java $SBT_OPTS -jar bin/sbt-launch.jar "$@"
$ chmod u+x sbt                                                         # /×修改sbt文件权限×/
$ vim ~/.bashrc                                                         # 配置PATH环境变量，保证在控制台中可以使用sbt命令
export PATH=/opt/scala/sbt/:$PATH                                       # /*在文件尾部添加如下代码后，保存退出*/
$ source ~/.bashrc                                                      # 使配置文件立刻生效
$ sbt sbt-version                                                       # 测试sbt是否安装成功
```


## kafka-manager 包的编译 {#kafka-manager-包的编译}

```shell
$ git clone https://github.com/yahoo/kafka-manager
$ cd kafka-manager
$ ./sbt clean dist
$ cd tartget/universal
$ unzip kafka-manager-1.3.3.17.zip
$ vim conf/application.conf
kafka-manager.zkhosts="localhost:2181"
$ nohup bin/kafka-manager -Dconfig.file=conf/application.conf > /dev/null 2>&1 &
```
