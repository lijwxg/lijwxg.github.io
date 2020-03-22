+++
title = "Blog从Hexo迁移到Hugo"
date = 2020-03-17
tags = ["Blog", "Hugo", "Hexo"]
draft = false
+++

Hexo是一个十分炫酷的前端页面生成工具, 使用node.js实现, 有十分丰富的主题和炫酷的效果. 同时十分喜欢一切都是纯文
本的设计. 所想即所得. Hugo是由go语言开发的页面生成工具, 生成页面十分快捷. 关键是还支持org-mode文本渲染.在Emacs
里面完成文本操作, 学习org-mode也可以学以致用.
<!--more-->


## [快速入门hugo](https://gohugo.io/getting-started/quick-start/) {#快速入门hugo}

1.  使用OSX系统的话安装hugo十分便捷

    ```shell
    brew install hugo
    ```

2.  创建一个网站

    ```shell
    hugo new site mysite
    ```

3.  [主题下载](https://themes.gohugo.io/)
    从主题网站选择一个好看的主题, 下载下来应用到我们的blog, 这里选择even

    ```shell
    git submodule add https://github.com/olOwOlo/hugo-theme-even themes/even
    ```

4.  主题配置
    **注意**: 这个主题有对配置有要求, 需要用其默认配置覆盖hugo根路径下配置. 详情参见README.md

    ```shell
    cp -f themes/even/exampleSite/config.toml .
    vi config.toml
    ```

    修改默认配置参数为自己的参数

5.  进入blog项目的根目录, 生成测试文件

    ```shell
    cd mysite
    hugo new posts/my_blog.md
    ```

    在文本编辑工具中, 使用markdown语法书写一段blog

6.  开启本地

    ```shell
    hugo server -t even -D --bind=0.0.0.0
    ```

    如果主题选择固定主题, 可以不用在参数中提现, 直接在config.toml中配置, --bind能够让局域网中的设备访问,
    -D参数表示会编译所有的文件, 包含标记为草稿的文件.

7.  打开浏览器查看
    本地地址为 <http://localhost:1313>


## 迁移Hexo源文件 {#迁移hexo源文件}

1.  将Hexo的markdown文件拷贝到content目录下的post路径下
2.  使用hugo server开启本地服务, 检验blog效果
3.  根据情况修改Hexo中的front-matter


## 使用org-mode编写新的blog {#使用org-mode编写新的blog}

1.  文件头声明属性

    ```org
    #+hugo_base_dir: ~/mysite
    #+author:
    #+date:
    #+title:
    ```

    **注意**: author属性需要指定为空, 否则org-export-dispatch导出markdown文件的时候,会在front-matter中生成一条值为列表的author,
    导致渲染失败
    在导出整个文件作为markdown时,必须指定title属性, 即为标题名
2.  subtree导出
    在一个org文件中写多个短篇文章, 按照subtree导出为markdown, 本质和文件导出没有区别,都是生成markdown文件
    需要在子树下面添加生成markdown的配置属性, 必须指定输出的文件名, 默认为md格式

    ```org
    :properties:
    :export_file_name: test
    :end:
    ```
3.  流畅的使用org-mode书写
4.  使用org-export-dispatch导出markdown文件(C-c, C-e)
    如果是导出为一个markdown, 有title的头文件的时候, 在任意位置使用H-H导出, 如果没有,且可以subtree导出, 则需要将光标移动到子节点
    如果是整个文件分subtree导出为多个markdown, 使用H-A导出所有的subtree分别到各各文件.


## 将生成的静态页面托管到GitHub Page {#将生成的静态页面托管到github-page}

1.  在github上创建一个和用户名同名的以.github.io结尾的仓库, 例如用户名: lijwxg  则新建一个名为lijwxg.github.io的仓库
2.  hugo生成静态文件在博客根路径下的public文件夹中. 使用git初始化,并推送到远端github仓库

    ```shell
    git init
    git remote add origin https://github.com/lijwxg/lijwxg.github.io.git
    git push -f origin master
    ```
3.  在浏览器访问lijwxg.github.io
