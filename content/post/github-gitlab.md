---
title: "Gitlab/GitHub"
date: 2017-11-30T15:05:00+08:00
tags: ["git", "git-web"]
draft: false
---

使用网页端创建新的仓库

<!--more-->


## 新增仓库 {#新增仓库}

Command line instructions

```shell
Git global setup
git config --global user.name "李**"
git config --global user.email "li**n@company.com"
```

Create a new repository

```shell
git clone git@gitlab.example.com:username/project.git
cd project
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master
```

Existing folder

```shell
cd existing_folder
git init
git remote add origin git@gitlab.example.com:username/project.git
git add .
git commit -m "Initial commit"
git push -u origin master
```

Existing Git repository

```shell
cd existing_repo
git remote rename origin old-origin
git remote add origin git@gitlab.example.com:username/project.git
git remote add origin http://gitlab.example.com/username/project.git
git remote set-url origin http://gitlab.example.com/username/project.git
git push -u origin --all
git push -u origin --tags
```
