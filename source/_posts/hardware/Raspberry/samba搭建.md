---
date: 2018-07-19 08:10:53
tags: linux
---
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [安装samba](#安装samba)
- [配置samba](#配置samba)
- [添加samba共享用户](#添加samba共享用户)
- [访问共享文件](#访问共享文件)

<!-- /code_chunk_output -->
<!-- more -->

## 安装samba

```shell
sudo apt-get install samba
```

## 配置samba

```shell
$ cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
$ sudo vim /etc/samba/smb.conf
======================
[share]           #共享文件的名称， 将在网络上以此名称显示
path = /share         #共享文件的路径
valid users = pi        #允许访问的用户
browseable = yes        #允许浏览
public = yes        #共享开放
writable = yes        #可写
```

## 添加samba共享用户

```shell
sudo smbpasswd -a pi
```

添加pi用户到sambashare组中, 能够使用pi用户登录到其中

## 访问共享文件

在运行(Ctrl+R)中输入\\\\192.168.82.119进行访问
