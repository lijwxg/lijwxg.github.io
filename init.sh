#!/bin/bash
# author: lijiawen
# auto deploy file to origin git branch

# 是git客户端能记录下git服务端的账号密码.
git config credential.helper store

# 创建并切换到存放原始文件的git分支hugo
git checkout -b hugo

# 配置选择的主题,此处可根据情况自定义
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke

# 创建存放源文件的目录
mkdir -p content/posts
# 从选择的主题中将配置文件复制到项目目录下
cp themes/*/exampleSite/config.toml .
