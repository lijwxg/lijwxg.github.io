---
title: Spacemacs
date: 2019-11-04
tag:
  - emacs
---

安装使用 Spacemecs

<!--more-->

## 安装

> [Spacemaces](https://github.com/syl20bnr/spacemacs) github 提供了使用方法,建议使用 develop 分支

## Mac 操作系统

1. 使用 homebrew 安装 emacs
1. 建议安装 emacs-plus, 尝试 emacsforosx 发现包安装有问题, 初步判断是缺少 gnutls 依赖, 最后还是有一些问题, 将清华源的地址的 http 改成 https
1. git clone spacemacs 的配置仓库到本地
1. 初始化启动 emacs, 生成.spacemacs, 然后修改下载源为[清华源](https://mirrors.tuna.tsinghua.edu.cn/help/elpa/)

## 配置

1. 配置 layout, 通过层实现 emacs 的拓展功能实现
1. 增加 osx, org 层
