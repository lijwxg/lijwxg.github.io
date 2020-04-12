+++
title = "git命令"
date =  2017-11-30
tags = ["git"]
draft = false
+++

git由Linus Torvalds开发完成, 为了编程而生.
<!--more-->

# Git安装设置

## Git的编译安装

```shell
$ yum remove git
$ yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel
$ rpm -e nodeps git
$ wget https://sourceforge.net/projects/asciidoc/files/latest/download
$ unzip download
$ cd asciidoc-8.6.9/
$./configure
$ sudo make install
$ yum install xmlto

$ tar -zxf git-1.7.2.2.tar.gz
$ cd git-1.7.2.2
$ make prefix=/usr/local/git all
$ sudo make prefix=/usr/local/git install
```

## 常用设置

windows设置在提交文件时不默认修改换行符
```shell
# git config --global core.autocrlf false
```

解决git status显示中文乱码的问题
```shell
# git config --global core.quotepath false
```

## 配置多git账号管理

- 生成新的key
    ```shell
    # cd ~/.ssh
    # ssh-keygen -t rsa -C "lijwxg@163.com"         # 给新的key取个新的名字id_rsa_demo
    ```
- 设置配置文件
    ```shell
    # touch config
    $ vim config
    > # Default GitHub
    > Host github.com
    >   HostName github.com
    >   User git
    >   IdentityFile ~/.ssh/id_rsa
    >
    > # Second GitHub
    > Host github-demo
    >   HostName github.com
    >   User git
    >   IdentityFile ~/.ssh/id_rsa_demo
    ```

- 测试连接
    ```shell
    # ssh -T git@github-demo
    ```

- clone代码
    ```shell
    # git clone git@github-demo:username/username.github.io.git
    ```


# 常用操作

## git删除分支

删除本地分支
```shell
# git branch -D br
```

删除远程分支
```shell
# git push origin :br           # origin后面有个空格,相同与把空分支推到远程分支,就是删除
```

## git代码回滚

git代码回滚: 指的是将代码库某分支退回到以前的某个commit id

本地代码回滚
```shell
# git reset --hard commit id       # 回滚到commit id 将commit id之后的提交的commit都去除
# git reset --hard HEAD~3           # 将最近3次的提交回滚
```

远程代码回滚:
远程代码回滚比本地回滚要复杂

应用场景:<br>
自动部署系统发布后发现问题,需要回滚到某一个commit, 再重新发布
原理: <br>
现将本地分支退回到某个commit, 删除远程分支, 再重新push本地分支到远程
操作步骤:

- git checkout the_branch
- git pull
- git branch the_branch_backup
- git reset --hard commit id
- git push origin :the_branch
- git push origin the_branch
- git push origin :the_branch_backup

tips: master分支是不能进行删除操作的


## 重新命名本地分支

```shell
# git branch -m devel develop
```

## 对已经提交的log的修改

```shell
# git commit --amend
```

## 跟踪远程分支

```shell
# git checkout --track checkversion/develop
```

## 版本回退

1. git本地版本回退

    ```shell
    git reset --hard commit_id(可用 git log –oneline 查看)
    ```
1. git远程版本回退
    ```shell
    git push origin HEAD --force #远程提交回退
    ```

    下面的命令也可以实现远程版本回退
    ```shell
    git reset --hard HEAD~1
    git push --force
    ```

1. git reverse和git reset的区别

    git revert是用一次新的commit来回滚之前的commit，git reset是直接删除指定的commit。
    在回滚这一操作上看，效果差不多。但是在日后继续merge以前的老版本时有区别。因为git revert是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，导致这部分改变不会再次出现，但是git reset是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入。
    - git reset 是把HEAD向后移动了一下，而git revert是HEAD继续前进，只是新的commit的内容和要revert的内容正好相反，能够抵消要被revert的内容。
    - git reset + commit号
    - git reset命令后面是需要加2种参数的：
        ”–hard”和”–soft”。

        这条命令默认情况下是”–soft”。执行上述命令时，这该条commit号之 后（时间作为参考点）的所有commit的修改都会退回到git缓冲区中。

        使用git status命令可以在缓冲区中看到这些修改。而如果加上”–hard”参数，则缓冲区中不会存储这些修改，git会直接丢弃这部分内容。

        但需要注意的一 个问题是：由于这样的重置是直接在本地的修改，无法提交到远程服务器，如果直接丢弃的内容已经被推到远程服务器上了，则会造成本地和服务器无法同步的问题。

        即git reset –hard只能针对本地操作，不能针对远程服务器进行同样操作。如果从本地删掉的内容没有推到服务器上，则不会有副作用；如果被推到服务器，则下次本地和 服务器进行同步时，这部分删掉的内容仍然会回来。

        而上面注意中提到的问题则可以很好的被git revert 命令解决。

        git revert + commit 号
        该命令撤销对某个commit的提交，这一撤销动作会作为一个新的修改存储起来，这样，当你和服务器同步时，就不会产生什么副作用。

Yesterday is history.  
Tomorrow is a mystery.  
But today is a gift.  
That is why it's called the present.  
The old game: give a wolf a taste, then keep him hungry.

## 对tag管理

```shell
- 2018-08-30 Thursday
    git tag -a used_cache 670380f0362b3b12ad09942f039e80b18a47625e -m "版本：used_cache，发布日期：2018-08-29"
    git push origin tag used_cache
```


# Gitlab

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
