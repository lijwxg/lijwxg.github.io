---
date: 2018-12-25 19:10:53
tags: linux
---

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [System](#system)
  - [查看系统信息相关命令](#查看系统信息相关命令)
  - [CentOS 启动](#centos-启动)
    - [七个启动级别](#七个启动级别)
    - [设置启动模式](#设置启动模式)
  - [网络](#网络)
    - [netstat安装](#netstat安装)
    - [ifconfig](#ifconfig)
    - [网络命令](#网络命令)
    - [联网软件](#联网软件)
    - [防火墙相关设置](#防火墙相关设置)
  - [增加root权限](#增加root权限)
  - [修改文件权限](#修改文件权限)
- [Software](#software)
  - [编译安装方法](#编译安装方法)
  - [vi升级](#vi升级)
  - [Python升级](#python升级)
    - [Python的unicode是ucs-2还是ucs-4](#python的unicode是ucs-2还是ucs-4)
    - [安装thrift](#安装thrift)
    - [anaconda安装使用](#anaconda安装使用)
    - [pip换源](#pip换源)
    - [mysql-python-1.2.5安装](#mysql-python-125安装)
    - [virtualenv和virtualenvwrapper](#virtualenv和virtualenvwrapper)
  - [时间相关](#时间相关)
    - [查看时区](#查看时区)
    - [修改时区:](#修改时区)
    - [修改时间](#修改时间)
  - [nodejs](#nodejs)
  - [imply](#imply)
  - [mysql安装](#mysql安装)
  - [redis安装](#redis安装)
  - [nginx](#nginx)
  - [Emacs](#emacs)
  - [Apache](#apache)
    - [Apache ab](#apache-ab)
- [Source](#source)
  - [添加yum第三方源Repofogre:](#添加yum第三方源repofogre)
- [FAQ](#faq)
  - [sudo命令无法使用](#sudo命令无法使用)
  - [yum命令](#yum命令)
  - [使用说明](#使用说明)
  - [虚拟机连不上网](#虚拟机连不上网)
    - [问题描述: vwmare连接不上网络](#问题描述-vwmare连接不上网络)
    - [解决方案:](#解决方案)
    - [NetworkManager和network的区别](#networkmanager和network的区别)
  - [LAMP](#lamp)

<!-- /code_chunk_output -->
<!-- more -->
# System

## 查看系统信息相关命令

```shell
$ cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c           # 查看CPU信息（型号）
$ cat /proc/cpuinfo| grep "physical id"| sort| uniq| wc -l        # 查看物理CPU个数
$ cat /proc/cpuinfo| grep "cpu cores"| uniq                       # 查看每个物理CPU中core的个数(即核数)
$ cat /proc/cpuinfo| grep "processor"| wc -l                      # 查看逻辑CPU的个数
$ cat /ect/group                                                # 查看用户组
```

## CentOS 启动

### 七个启动级别

- 0：关机模式【系统默认运行级别不能设置为0，否则没法正常启动】

- 1：单用户模式【Root 权限、禁止远程登陆】

- 2：多用户模式【没有 NFS 和网络】

- 3：完整的多用户文本模式【支持 NFS 和网络、登陆后进入控制台命令行模式】

- 4：暂未使用、系统保留

- 5：图形化模式【GUI】

- 6：重启模式【系统默认运行级别不能设置为6，否则没法正常启动】

### 设置启动模式

```shell
$systemctl set-default multi-user.target  //设置成命令模式

$systemctl set-default graphical.target  //设置成图形模式
```

## 网络

### netstat安装

```shell
# yum install net-tools
```

### ifconfig

ifconfig [网络设备][down up -allmulti -arp -promisc][add<地址>][del<地址>][<硬件地址>][io_addr][irq][media<网络媒介类型>][mem_start<内存地址>][metric<数目>][mtu<字节>][netmask<子网掩码>][tunnel<地址>][-broadcast<地址>][-pointopoint<地址>][IP地址]

### 网络命令

```shell
# ip a
```

### 联网软件

```shell
nmtui
```

### 防火墙相关设置

```shell
$ netstat -apn                                                      # 查看端口情况
$ netstat -lnp                                                      # 查看监听的端口
$ sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp   # 新增端口设置
$ sudo firewall-cmd --reload                                        # 新增端口后更新防火墙
```

## 增加root权限

```shell
$su
$chmod u+w /etc/sudoers
$vi /etc/sudoers
找到Allow root to ruan any commands anywhere
在root  ALL=(ALL)  ALL 下面另起一行，输入“xx ALL=(ALL)  ALL”(xx表示你的用户名)，然后保存退出
$chmod u-w /etc/sudoers
```

## 修改文件权限

```shell
sudo chown -R vagrant:vagrant var
```

# Software

## 编译安装方法

```shell
$ autoconf.sh       # 如果没有configure的情况下需要运行这类文件生成configure
$ ./configure --prefix=/usr/local/<package-name>        # 请谨慎的加上prefix参数,否则可能安装失败而留下很难准确删除的文件
$ make                      # 
$ sudo make install         # 安装编译的文件
$ sudo make uninstall       # 卸载安装的文件 在某些情况下可用,前期是编译文件没有被删除
$ make clean                # 对编译的文件进行删除, 进行重新编译
```

## vi升级

```shell
# yum -y install vim-enhanced
```

## Python升级

```shell
$sudo yum update
$sudo yum groupinstall "Development tools"
$sudo yum install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel
$sudo yum install -y wget tree vim make automake autoconf gcc gcc-c++ cmake git
下载解压
$wget https://www.python.org/ftp/python/2.7.11/Python-2.7.11.tar.xz
$tar -xJvf Python-2.7.11.tar.xz
编译
$cd Python-2.7.12/
$./configure --prefix=/usr/local/python2.7 --enable-unicode=ucs4
$make
$make install
软链接
$mv /usr/bin/python /usr/bin/python2.7.5  
$ln -s /usr/local/python2.7/bin/python2.7 /usr/bin/python
修改yum中Python
$sudo vi /usr/bin/yum
$sudo vi /usr/libexec/urlgrabber-ext-down
$ sudo vim /usr/bin/firewall-cmd
$ sudo vim /usr/sbin/firewalld
$ vim .bahsrc
>> export PATH="/usr/local/python2.7/bin/:$PATH"
```

模块    |依赖            |说明
  --      |--                |--
_bsddb	    |bsddb	            |Interface to Berkeley DB library。Berkeley数据库的接口
_curses	    |ncurses            |	Terminal handling for character-cell displays。
_curses_    |panel	            |ncurses	A panel stack extension for curses。
_sqlite3    |sqlite	            |DB-API 2.0 interface for SQLite databases。SqlLite，CentOS可以安装sqlite-devel
_ssl	    |openssl-devel.i686	|TLS/SSL wrapper for socket objects。
_tkinter    |N/A	            |a thin object-oriented layer on top of Tcl/Tk。如果不使用桌面程序可以忽略TKinter
bsddb185    |old bsddb module	|老的bsddb模块，可忽略。
bz2	        |bzip2-devel.i686	|Compression compatible with bzip2。bzip2-devel
dbm	        |bsddb	            |Simple “database” interface。
dl	        |N/A	            |Call C functions in shared objects.Python2.6开始，已经弃用。
gdbm        |gdbm-devel.i686	|GNU’s reinterpretation of dbm
imageop	    |N/A	            |Manipulate raw image data。已经弃用。
readline    |readline-devel	    |GNU readline interface
sunaudiodev |N/A	            |Access to Sun audio hardware。这个是针对Sun平台的，CentOS下可以忽略
zlib	    |Zlib	            |Compression compatible with gzip

**安装setuptools和pip在下载源码后使用python setup.py install方式安装**

```shell
easy_install --upgrade pip
```

**Pip 10.0.* doesn't support main.**
You have to downgrade to pip 9.0.3.

```shell
python -m pip install pip==9.0.3
```

### Python的unicode是ucs-2还是ucs-4

```python
import sys
print sys.maxunicode        # 1114111表示ucs4, 65535表示ucs2
```

### 安装thrift

** 安装失败

### anaconda安装使用

```shell
$ sudo bash Anaconda2-5.0.0.1-Linux-x86_64.sh
$ vim ~/.bashrc
$ pip freeze > packages.txt
$ conda create --name opencv_py2 --all
$ source activate opencv_py2
$ source deactivate
$ conda install matplotlib=2.1.1
```

### pip换源

```shell
$ mkdir ~/.pip
$ touch pip.conf
$ vim pip.conf
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
```

### mysql-python-1.2.5安装

```shell
$ wget https://pypi.python.org/packages/a5/e9/51b544da85a36a68debe7a7091f068d802fc515a3a202652828c73453cad/MySQL-python-1.2.5.zip#md5=654f75b302db6ed8dc5a898c625e030c
$ sudo yum install mysql-devel
$ vim setup_posix.py
$ sudo python setup.py install
```

### virtualenv和virtualenvwrapper

```shell
$ sudo pip install virtualenv
$ sudo pip install virtualenvwrapper
$ vim ~/.bashrc
# setting for virtualenvwrapper 2018-03-23
export WORKON_HOME='~/.virtualenvs'
source /usr/local/bin/virtualenvwrapper.sh
$ source ~/.bashrc
$ mkvirtualenv test
$ workon test
$ deactivate
$ rmvirtualenv test
```

## 时间相关

根据提示选择对应的时区

```shell
# szselect
```

### 查看时区

```shell
# date -R
```

### 修改时区:

将Asia/shanghai-上海时区写入当前时区

```shell
# cp -f /usr/share/zoneinfo/Asia/Shanghai     /etc/localtime
```

### 修改时间

```shell
# date -s 03/06/2018    # 设置日期
# date -s 10:19         # 设置时间
# clock -w              # 强制将时间写入COMS, 没有这步重启会失效
```

## nodejs

```shell
$curl --silent --location https://rpm.nodesource.com/setup_8.x | sudo bash -
$sudo yum -y install nodejs
$sudo npm install -g cnpm --registry=https://registry.npm.taobao.org
$cnpm install [name]
```

## imply

*Imply=druid.io+datazoo+plywood+pivot+各种可视化工具*

```shell
# bin/supervise -c conf/supervise/quickstart.conf  -可以nohup 后台执行
$ nohup bin/supervise -c conf/supervise/quickstart.conf > /dev/null 2>&1 &
$ jobs  # 查看后台运行的运行
$ fg %s # 关闭指定的job
```

## mysql安装

```shell
$ yum list installed | grep mysql
$ wget http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
$ sudo yum localinstall mysql-community-release-el7-5.noarch.rpm 
$ yum repolist enabled | grep "mysql.*-community.*" 
$ yum repolist all | grep mysql
$ sudo yum install mysql-community-server
$ systemctl start mysqld
$ systemctl status mysqld
$ firewall-cmd --permanent --zone=public --add-port=3306/tcp
$ firewall-cmd --permanent --zone=public --add-port=3306/udp 
$ mysql_secure_installation
$ mysql
$ use mysql
$ update user set password=password("123456") where user="root";
$ flush privileges;
$ mkdir /home/data
$ mysqladmin -u root -p shutdown 
```

## redis安装

参考:

https://linux.cn/article-6719-1.html

```shell
$ wget http://download.redis.io/releases/redis-4.0.6.tar.gz
$ tar xzf redis-4.0.6.tar.gz
$ cd redis-4.0.6
$ make
$ cd src
$ cp redis-server redis-cli /usr/local/bin
$ ./utils/install_server.sh         # 安装redis服务
```

## nginx

```shell
$ wget  http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
$ rpm -ivh nginx-release-centos-7-0.el7.ngx.noarch.rpm
$ yum install nginx
$ vim /etc/nginx/nginx.conf
$ sudo systemctl enable nginx.service
```

## Emacs

[清华elpa](https://mirrors.tuna.tsinghua.edu.cn/help/elpa/)
```shell
$ wget https://mirrors.tuna.tsinghua.edu.cn/gnu/emacs/emacs-25.3.tar.xz
$ sudo yum install libXpm-devel libpng-devel libtiff-devel libjpeg-devel libungif-devel
$ ./configure --prefix=/usr/local/emcas-25.3 --with-x-toolkit=no

###  configure: error: The required function 'tputs' was not found in any library.
### The following libraries were tried (in order):
###  libtinfo, libncurses, libterminfo, libtermcap, libcurses

$ sudo yum install ncurses-devel        # 如果出现上面报错
$ make
$ sudo make install
$ cd /usr/local/bin
$ sudo ln -s /usr/local/emcas-25.3/bin/emacs emacs
$ git clone -b https://github.com/syl20bnr/spacemacs ~/.emacs.d
$ emacs --insecure              # 会报一个bind-map的错误 网络原因产生的错误, 不用https

```

## Apache

### Apache ab

```shell
# yum -y install httpd-tools
```

# Source

## 添加yum第三方源Repofogre:

[清华Repoforge源](https://mirrors.tuna.tsinghua.edu.cn/help/repoforge/)

```shell
$ rpm --import https://mirrors.tuna.tsinghua.edu.cn/repoforge/RPM-GPG-KEY.dag.txt
$ sudo cat > /etc/yum.repos.d/rpmforge.repo << EOF
[rpmforge]
name = RHEL $releasever - RPMforge.net - dag
baseurl = https://mirrors.tuna.tsinghua.edu.cn/repoforge/redhat/el7/en/$basearch/rpmforge
mirrorlist = http://mirrorlist.repoforge.org/el7/mirrors-rpmforge
enabled = 1
protect = 0
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
gpgcheck = 1

[rpmforge-extras]
name = RHEL $releasever - RPMforge.net - extras
baseurl = https://mirrors.tuna.tsinghua.edu.cn/repoforge/redhat/el7/en/$basearch/extras
mirrorlist = http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-extras
enabled = 0
protect = 0
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
gpgcheck = 1

[rpmforge-testing]
name = RHEL $releasever - RPMforge.net - testing
baseurl = https://mirrors.tuna.tsinghua.edu.cn/repoforge/redhat/el7/en/$basearch/testing
mirrorlist = http://mirrorlist.repoforge.org/el7/mirrors-rpmforge-testing
enabled = 0  
protect = 0
gpgkey = file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmforge-dag
gpgcheck = 1
EOF
$ sudo yum makecache
```

# FAQ

## sudo命令无法使用

http://blog.csdn.net/duguduchong/article/details/8804117

```
1.编辑/etc/sudoers文件，把Defaults  env_reset改成Defaults ! env_reset
2.编辑.bashrc,最后添加alias sudo='sudo env PATH=$PATH'
3.source ~/.bashrc
```

## yum命令

千万别用yum remove 卸载软件！

用yum remove你会发现吧相关依赖的软件包都卸载了。

所以要使用rpm -e –nodeps 软件名, 不会删除依赖.

## 使用说明

问题描述: error while loading shared libraries ...

一般我们在Linux下执行某些外部程序的时候可能会提示找不到共享库的错误, 比如:

```shell
tmux: error while loading shared libraries: libevent-1.4.so.2: cannot open shared object file: No such file or directory
```

原因一般有两个, 一个是操作系统里确实没有包含该共享库(lib*.so.*文件)或者共享库版本不对, 遇到这种情况那就去网上下载并安装上即可. 

另外一个原因就是已经安装了该共享库, 但执行需要调用该共享库的程序的时候, 程序按照默认共享库路径找不到该共享库文件. 

所以安装共享库后要注意共享库路径设置问题, 如下:

1. 如果共享库文件安装到了/lib或/usr/lib目录下, 那么需执行一下ldconfig命令

    ldconfig命令的用途, 主要是在默认搜寻目录(/lib和/usr/lib)以及动态库配置文件/etc/ld.so.conf内所列的目录下, 搜索出可共享的动态链接库(格式如lib*.so*), 进而创建出动态装入程序(ld.so)所需的连接和缓存文件. 缓存文件默认为/etc/ld.so.cache, 此文件保存已排好序的动态链接库名字列表. 

2. 如果共享库文件安装到了/usr/local/lib(很多开源的共享库都会安装到该目录下)或其它"非/lib或/usr/lib"目录下, 那么在执行ldconfig命令前, 还要把新共享库目录加入到共享库配置文件/etc/ld.so.conf中, 如下:
```shell
# cat /etc/ld.so.conf
include ld.so.conf.d/*.conf
# echo "/usr/local/lib" >> /etc/ld.so.conf
# ldconfig
```
3. 如果共享库文件安装到了其它"非/lib或/usr/lib" 目录下,  但是又不想在/etc/ld.so.conf中加路径(或者是没有权限加路径). 那可以export一个全局变量LD_LIBRARY_PATH, 然后运行程序的时候就会去这个目录中找共享库.LD_LIBRARY_PATH的意思是告诉loader在哪些目录中可以找到共享库. 可以设置多个搜索目录, 这些目录之间用冒号分隔开. 比如安装了一个mysql到/usr/local/mysql目录下,其中有一大堆库文件在/usr/local/mysql/lib下面, 则可以在.bashrc或.bash_profile或shell里加入以下语句即可:
```shell
export LD_LIBRARY_PATH=/usr/local/mysql/lib:$LD_LIBRARY_PATH    
```

一般来讲这只是一种临时的解决方案, 在没有权限或临时需要的时候使用.

## 虚拟机连不上网

### 问题描述: vwmare连接不上网络
```shell
# ifup ens33
Error: Connection activation failed: No suitable device found for this connection.
# systemctl start network         (重启网络服务)
Job for network.service failed because the control process exited with error code. See "systemctl status network.service" and "journalctl -xe" for details.
# systemctl status network.service
● network.service - LSB: Bring up/down networking
Loaded: loaded (/etc/rc.d/init.d/network; bad; vendor preset: disabled)
Active: failed (Result: exit-code) since Thu 2017-11-02 21:21:15 CST; 4s ago
Docs: man:systemd-sysv-generator(8)
Process: 4550 ExecStart=/etc/rc.d/init.d/network start (code=exited, status=1/FAILURE)

Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 network[4550]: RTNETLINK answers: File exists
Nov 02 21:21:15 client01 systemd[1]: network.service: control process exited, code=exited status=1
Nov 02 21:21:15 client01 systemd[1]: Failed to start LSB: Bring up/down networking.
Nov 02 21:21:15 client01 systemd[1]: Unit network.service entered failed state.
Nov 02 21:21:15 client01 systemd[1]: network.service failed.
```

### 解决方案:

- 网卡配置文件中没有添加MAC地址信息，处理过程如下
    - 查看网卡对应MAC地址
    ```shell
    # ip addr
    1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
    valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
    valid_lft forever preferred_lft forever
    2: ens33: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN qlen 1000
    link/ether 00:0c:29:9b:e7:51 brd ff:ff:ff:ff:ff:ff
    3: virbr0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN qlen 1000
    link/ether 52:54:00:a7:c4:9b brd ff:ff:ff:ff:ff:ff
    inet 192.168.122.1/24 brd 192.168.122.255 scope global virbr0
    valid_lft forever preferred_lft forever
    4: virbr0-nic: <BROADCAST,MULTICAST> mtu 1500 qdisc pfifo_fast master virbr0 state DOWN qlen 1000
    link/ether 52:54:00:a7:c4:9b brd ff:ff:ff:ff:ff:ff
    ```
    
    - 将MAC地址添加在配置文件中
    ```shell
    # echo "HWADDR=00:0c:29:9b:e7:51" >> /etc/sysconfig/network-scripts/ifcfg-ens33
    ```
    
    - 重启网络服务
    ```shell
    # systemctl start network
    ```

- 在尝试了上述方法后，问题依然没有解决，尝试第二种方案

    - 停止NetworkManager服务
    ```shell
    # systemctl stop NetworkManager
    ```
    
    - 取消开机启动
    ```shell
    # systemctl disable NetworkManager
    ```
    
    - 重启网络
    ```shell
    # service network restart
    Restarting network (via systemctl): [ OK ]
    ```
### NetworkManager和network的区别

    简单说network适合使用于网路设定后固定不变的服务器，而NetworkManager则适合使用于笔记型电脑上
    必须常常在有线及无线网路环境切换时使用，并且这二个服务所读取及写入的设定档是不同的。
    network ：读取的设定档路径为「/etc/sysconfig/network-scripts/*」下的设定档。
    NetworkManager ：读取的设定档路径为「/etc/sysconfig/networking/*」下的设定档。 
    CentOS7 在预设情况下会启动NetworkManager 服务(包含开机启动)，因为个人习惯传统的network设定，
    因此建议将NetworkManager 服务停用后再继续后续设定作业，否则在二个服务都启动的情况下将会造成互相干扰的麻烦状况。

## LAMP
安装LAMP环境
```shell
# yum -y install zlib-devel mysql-devel glibc-devel curl-devel gcc automake mysql libidn-devel openssl-devel net-snmp-devel rpm-devel OpenIPMI-devel httpd mysql-server php-gd php-mysql php-bcmath php-mbstring php-xml perl-DBI php
```
