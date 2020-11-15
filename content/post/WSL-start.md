---
title: "WSL基础"
date: 2020-06-13T17:51:00+08:00
tags: ["windows", "linux", "shell", "wsl"]
draft: false
---

> Windows Subsystem for Linux（简称WSL）是一个在Windows 10上能够运行原生Linux二进制可执行文件（ELF格式）的兼容层。它是由微软与Canonical公司合作开发，其目标是使纯正的linux映像能下载和解压到用户的本地计算机，并且映像内的工具和实用工具能在此子系统上原生运行。

<!--more-->

在windows下更加轻量级的使用linux系统功能, 使用许多在linux下更加方便的功能.


## 支持镜像 {#支持镜像}

-   kali
-   ubuntu
-   Alpine
-   Debian
-   openSUSE
-   Centos


## 安装 {#安装}

在设置中启动Windows子系统功能, 在Windows应用商店中下载安装

> 子系统默认安装在C盘下,建议使用[工具](https://github.com/DDoSolitary/LxRunOffline/releases)将子系统迁移到指定位置下


## 相关配置 {#相关配置}


### 子系统的配置 {#子系统的配置}

1.  在cmd中执行bash,可以进去子系统的shell会话
2.  安装oh-my-zsh
3.  安装常用软件
    -   git
    -   mysql
    -   redis
    -   nginx
    -   supervisor
    -   python开发环境


### Windows系统下的配置 {#windows系统下的配置}

1.  将子系统的zsh集成到cmder中
    -   安装cmder
    -   选择启动的shell为{WSL:bash}
        启动参数为: set "PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & %ConEmuBaseDirShort%\conemu-cyg-64.exe --wsl -cur\_console:pm:/mnt
2.  pycharm集成bash
    -   在设置中修改terminal配置
        Settings -> Tools -> Terminal位置
    -   修改shell path参数为: "bash". 相当于调用了bash命令
3.  pycharm选择WSL中的解释器
    -   在设置添加解释器
        Settings -> Projects -> Projects Interpreter
    -   使用Add添加WSL类型的解释器,选择python路径


### 图形化访问 {#图形化访问}

1.  图形化子系统中的emacs
    [Emacs-wsl](https://github.com/hubisan/emacs-wsl), 从windows中使用图形化访问子系统中的应用
    > 图形界面中识别不了汉字输入,需要后续解决.
