---
date: "2020-04-10"
title: "hugo简单入门"
tag:
  - hugo
  - github
  - travisCI
---

这是介绍 hugo 构建方法的文章, 希望大家愉快的书写, 享受书写带来的乐趣.

<!--more-->

个人录制B站视频: [使用Hugo快速构建个人主页](https://www.bilibili.com/video/BV1hK411L7kG/)

# hugo 静态博客

## 1. 配置准备

### 1.1 Git 客户端

1. [git 客户端](https://git-scm.com/)
2. 安装下载到的安装包

### 1.2 GitHub 账号

1. 注册账号
2. 创建新的仓库: 命名要以 username.github.io 作为仓库名
3. 在本地执行 git 命令将仓库进行关联.

### 1.3 TravisCI 关联 github

1. 直接使用 github 账号登陆
2. 回到 github 网页创建 token,提供给 travisCI 使用
3. 选中仓库中我们构建博客的仓库, 打开按钮,点击 settings, 配置 token 变量

### 1.4 配置好的一键化脚本

1. 使用 init.sh 脚本初始化仓库文件
2. 使用 deploy.sh 脚本初始化构建项目

## 2. 博客书写

### 2.1 markdown 语法了解

1. 推荐网站 [learnxinyminute](https://learnxinyminutes.com/docs/zh-cn/markdown-cn/)
2. 百度一下
3. vscode, 有道云笔记

### 2.2 享受书写的快乐

1. 多看书, 少睡觉.

## 3 优化

### 3.1 配置调整

1. 调整了页面中用不到的元素, 修改 config.toml
2. 调整了博客预览页面的标题, 还有描述信息, 修改 markdown 文件中的 front-matter
3. 调整详情页的时间, 分割描述信息和详情信息, 修改 front-matter.增加 more

### 3.2 域名调整

1. 修改.travis.yml 文件中的 fdn 参数
2. 到域名商提供的域名解析网站进行 CNAME 域名解析
