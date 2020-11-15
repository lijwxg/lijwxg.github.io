---
title: "git使用"
date: 2017-11-30T14:53:00+08:00
tags: ["git"]
draft: false
---

git 由 Linus Torvalds 开发完成, 为了编程而生.

<!--more-->


## git 安装设置 {#git-安装设置}


### Git 的编译安装 {#git-的编译安装}

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


### 常用设置 {#常用设置}

windows 设置在提交文件时不默认修改换行符

```shell
# git config --global core.autocrlf false
```

解决 git status 显示中文乱码的问题

```shell
# git config --global core.quotepath false
```


### 配置多 git 账号管理 {#配置多-git-账号管理}

-   生成新的 key

    ```shell
    # cd ~/.ssh
    # ssh-keygen -t rsa -C "lijwxg@163.com"         # 给新的key取个新的名字id_rsa_demo
    ```
-   设置配置文件

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

-   测试连接

    ```shell
    # ssh -T git@github-demo
    ```

-   clone 代码

    ```shell
    # git clone git@github-demo:username/username.github.io.git
    ```


## 常用操作 {#常用操作}


### git 删除分支 {#git-删除分支}

删除本地分支

```shell
# git branch -D br
```

删除远程分支

```shell
# git push origin :br           # origin后面有个空格,相同与把空分支推到远程分支,就是删除
```


### git 代码回滚 {#git-代码回滚}

git 代码回滚: 指的是将代码库某分支退回到以前的某个 commit id

本地代码回滚

```shell
# git reset --hard commit id       # 回滚到commit id 将commit id之后的提交的commit都去除
# git reset --hard HEAD~3           # 将最近3次的提交回滚
```

远程代码回滚:
远程代码回滚比本地回滚要复杂

应用场景:<br>
自动部署系统发布后发现问题,需要回滚到某一个 commit, 再重新发布
原理: <br>
现将本地分支退回到某个 commit, 删除远程分支, 再重新 push 本地分支到远程
操作步骤:

-   git checkout the\_branch
-   git pull
-   git branch the\_branch\_backup
-   git reset --hard commit id
-   git push origin :the\_branch
-   git push origin the\_branch
-   git push origin :the\_branch\_backup

tips: master 分支是不能进行删除操作的


### 重新命名本地分支 {#重新命名本地分支}

```shell
# git branch -m devel develop
```


### 对已经提交的 log 的修改 {#对已经提交的-log-的修改}

```shell
# git commit --amend
```


### 跟踪远程分支 {#跟踪远程分支}

```shell
# git checkout --track checkversion/develop
```


### 版本回退 {#版本回退}

1.  git 本地版本回退

    ```shell
    git reset --hard commit_id(可用 git log –oneline 查看)
    ```

2.  git 远程版本回退

    ```shell
    git push origin HEAD --force #远程提交回退
    ```

    下面的命令也可以实现远程版本回退

    ```shell
    git reset --hard HEAD~1
    git push --force
    ```

3.  git reverse 和 git reset 的区别

    git revert 是用一次新的 commit 来回滚之前的 commit，git reset 是直接删除指定的 commit。
    在回滚这一操作上看，效果差不多。但是在日后继续 merge 以前的老版本时有区别。因为 git revert 是用一次逆向的 commit“中和”之前的提交，因此日后合并老的 branch 时，导致这部分改变不会再次出现，但是 git reset 是之间把某些 commit 在某个 branch 上删除，因而和老的 branch 再次 merge 时，这些被回滚的 commit 应该还会被引入。

    -   git reset 是把 HEAD 向后移动了一下，而 git revert 是 HEAD 继续前进，只是新的 commit 的内容和要 revert 的内容正好相反，能够抵消要被 revert 的内容。
    -   git reset + commit 号
    -   git reset 命令后面是需要加 2 种参数的：
        ”–hard”和”–soft”。

        这条命令默认情况下是”–soft”。执行上述命令时，这该条 commit 号之 后（时间作为参考点）的所有 commit 的修改都会退回到 git 缓冲区中。

        使用 git status 命令可以在缓冲区中看到这些修改。而如果加上”–hard”参数，则缓冲区中不会存储这些修改，git 会直接丢弃这部分内容。

        但需要注意的一 个问题是：由于这样的重置是直接在本地的修改，无法提交到远程服务器，如果直接丢弃的内容已经被推到远程服务器上了，则会造成本地和服务器无法同步的问题。

        即 git reset –hard 只能针对本地操作，不能针对远程服务器进行同样操作。如果从本地删掉的内容没有推到服务器上，则不会有副作用；如果被推到服务器，则下次本地和 服务器进行同步时，这部分删掉的内容仍然会回来。

        而上面注意中提到的问题则可以很好的被 git revert 命令解决。

        git revert + commit 号
        该命令撤销对某个 commit 的提交，这一撤销动作会作为一个新的修改存储起来，这样，当你和服务器同步时，就不会产生什么副作用。

Yesterday is history.
Tomorrow is a mystery.
But today is a gift.
That is why it's called the present.
The old game: give a wolf a taste, then keep him hungry.


## 对 tag 管理 {#对-tag-管理}

```shell
- 2018-08-30 Thursday
    git tag -a used_cache 670380f0362b3b12ad09942f039e80b18a47625e -m "版本：used_cache，发布日期：2018-08-29"
    git push origin tag used_cache
```
