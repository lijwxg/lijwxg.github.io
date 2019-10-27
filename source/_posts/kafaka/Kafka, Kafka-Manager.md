---
date: 2018-05-06 21:37:44
tags: Kafka
---
- [kafaka-manager](#kafaka-manager)
  - [centos7下的javac的问题](#centos7%E4%B8%8B%E7%9A%84javac%E7%9A%84%E9%97%AE%E9%A2%98)
  - [Kafka 管理器kafka-manager安装](#Kafka-%E7%AE%A1%E7%90%86%E5%99%A8kafka-manager%E5%AE%89%E8%A3%85)
  - [kafka安装](#kafka%E5%AE%89%E8%A3%85)
  - [sbt安装](#sbt%E5%AE%89%E8%A3%85)
  - [kafka-manager包的编译](#kafka-manager%E5%8C%85%E7%9A%84%E7%BC%96%E8%AF%91)

<!-- more -->
# kafaka-manager

## centos7下的javac的问题

centos默认安装的是OpenJDK 没有javac
如果需要javac

```shell
yum install java-devel
```

## Kafka 管理器kafka-manager安装

运行环境要求:

1. Kafka0.8.1.1+
2. sbt0.13.X
3. Java 7+

## kafka安装

- 下载
- 解压

## sbt安装

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

## kafka-manager包的编译

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
