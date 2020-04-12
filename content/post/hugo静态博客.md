---
date: "2020-04-10"
title: "开始学hugo"
tag: 
- hugo
- github
- travisCI
---

这是介绍hugo构建方法的文章, 希望大家愉快的书写, 享受书写带来的乐趣.
<!--more-->

# hugo静态博客

## 1. 配置准备

### 1.1 Git客户端

1. [git客户端](https://git-scm.com/)
2. 安装下载到的安装包

### 1.2 GitHub账号

1. 注册账号
2. 创建新的仓库: 命名要以 username.github.io作为仓库名
3. 在本地执行git命令将仓库进行关联.

### 1.3 TravisCI关联github

1. 直接使用github账号登陆
2. 回到github网页创建token,提供给travisCI使用
3. 选中仓库中我们构建博客的仓库, 打开按钮,点击settings, 配置token变量

### 1.4 配置好的一键化脚本

1. 使用init.sh脚本初始化仓库文件
2. 使用deploy.sh脚本初始化构建项目

## 2. 博客书写

### 2.1 markdown语法了解

1. 推荐网站 [learnxinyminute](https://learnxinyminutes.com/docs/zh-cn/markdown-cn/)
2. 百度一下
3. vscode, 有道云笔记

### 2.2 享受书写的快乐

1. 多看书, 少睡觉.

## 3 优化

### 3.1 配置调整

1. 调整了页面中用不到的元素, 修改config.toml
2. 调整了博客预览页面的标题, 还有描述信息, 修改markdown文件中的front-matter
3. 调整详情页的时间, 分割描述信息和详情信息, 修改front-matter.增加more

### 3.2 域名调整

1. 修改.travis.yml文件中的fdn参数
2. 到域名商提供的域名解析网站进行CNAME域名解析
