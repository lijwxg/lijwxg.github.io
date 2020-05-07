+++
title = "使用hugo构建个人blog"
date = 2020-03-17
tags = ["blog"]
draft = false
+++


这不是一个全套式的富文本编辑blog网站, 这仅是一个自生成静态页面, 
<!--more-->
网页托管在 github 上. 注意: 是托管. 你保有文章
作品的所有权利, 而不是遵守了若干用户协议后的权利.一个git, 一个编辑器, 生成属于自己的个人页面. 轻量, 无负担.


## 准备工作 {#准备工作}

-   安装git, 一个为了编程而生的软件, 但不再仅为了编程而生.
-   选择一个文本编辑工具: 小到一个记事本, 大到一框IDE, 只要你喜欢.
-   简单的[markdown](https://learnxinyminutes.com/docs/zh-cn/markdown-cn/)语言, 如果不会, 请花十分钟学习一下.
-   一个 github 账号, 如果没有, 请花两分钟注册一个.


## 配置基础环境 {#配置基础环境}

-   安装git之后, 将git命令配置为系统环境变量PATH中, git能够在终端或者git-bash中运行即可.
-   生成[ssh key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), 命令如下: 请在终端或者git-bash中运行. 生成秘钥文件在个人路径下的.ssh文件下, 其中需要使用的

是公钥: id\_rsa.pub.

```nil
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

-   将生成的公钥文件内容添加到 github 账户配置中: Settings --> SSH and GPG keys --> New SSH key.
-   在 github 页面上新建一个 GitHub Page 仓库, 注意仓库的命名规范: 用户名.github.io
-   生成[Personal access tokens](https://github.com/settings/tokens), 注意生成后记得保存好,只会出现一次.用于 travis CI 集成部署时的读写权限
    Settings --> Developer settings --> Personal access tokens --> Generate new token
    生成时注意一定要选择repo public\_repo 权限, 其它不选也没关系


## 创建 blog 项目 {#创建-blog-项目}

1.  从 github 上将上一步新建的仓库clone到本地.

    ```shell
    git clone git@github.com:用户名/用户名.github.io.git
    ```
2.  创建一个新的分支用来存放源文件, 注意: master分支被用来存放托管的静态页面.

    ```shell
    git branch -b hugo
    ```
3.  如果本地有安装hugo, 请略过这步. 为了简单, 和隐藏细节. 我们通过配置实现.
    1.  创建一个content/post文件夹, 以后编写的文章放在post路径下.
    2.  在.gitignore中增加忽略文件夹public/, resource/
    3.  添加主题

        ```shell
        git submodule add https://github.com/olOwOlo/hugo-theme-even themes/even
        ```
    4.  如果不是even主题,请忽略此步骤
        从even主题下的exampleSite文件夹中复制config.toml到blog根路径下替换原来文件配置config.toml
        1.  注释掉baseURL: #baseURL
        2.  修改标题, 修改其它个人配置.
4.  将仓库中的修改提交到github上.

    ```shell
    git add .
    git commit -m "初始化blog项目"
    ```

    本方法提供一键式脚本执行: [deploy.sh](https://github.com/lijwxg/lijwxg.github.io/blob/hugo/deploy.sh)
5.  关联github 和Travis-CI, 对我们的blog仓库进行持续集成部署.
    选中我们的blog仓库, 激活. 添加配置, 注意这里要增加一个变量token, 为了安装不能把token暴露在配置文件中,所以我们选用travis CI提供的变量方法.计为下一步中$token, 变量名保持一致即可.
6.  配置Travis-CI, 添加 .travis.yml 文件到项目下,提交. 本配置文件仅供参考, 如果有其它需求, 酌情修改.

    ```yaml
    language: python
    os: linux
    dist: xenial

    before_install:
    ​    - export TZ='Asia/Shanghai'  # 设置时区

    git:
        depth: 1

    install:
    ​    - wget https://github.com/gohugoio/hugo/releases/download/v0.67.1/hugo_0.67.1_Linux-64bit.deb
    ​    - sudo dpkg -i hugo*.deb

    script:
    ​    - hugo version
    ​    - hugo

    deploy:
        strategy: git
        provider: pages
        skip_cleanup: true
        token: $token
        on:
            branch: hugo
        local_dir: public
        email: username@example.com
        name: Travis CI
        target_branch: master
    ```
7.  提交后查看[travis](https://www.travis-ci.org/)网上是否集成成功,如果成功. 则可以访问个人主页
8.  username.github.io


## 新增文章 {#新增文章}

1.  blog网站已经部署完成,我们可以自由的写作了, 故事从此开始...
2.  新建一个以.md作为后缀名的文件.按照markdown语法书写.
    -   随着时间的增长, 你的markdown会停不下来
    -   注意hugo有特殊的 front-matter 要求, 作为文章的基本信息, 例如作者, 创建时间等
3.  将文件放在创建项目是的content/post下面.
4.  使用一键式脚本提交, 让 travis CI 飞一会.
5.  新的页面已经打开.


## 写在后面 {#写在后面}

1.  一段新的旅程都是由迈出的第一步开始的, 愿你从此能流畅的书写.
2.  开始后, 问题也会接踵而至, 不要停下来, 解决一个问题只需要两步: 1. 找到问题, 2: 解决问题.
