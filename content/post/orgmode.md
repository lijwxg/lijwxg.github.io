---
title: "orgmode"
date: 2020-02-14T16:32:00+08:00
tags: ["emacs", "org"]
draft: false
---

org-mode作为日常记录的一大杀器, 有十分强大的功能, 学好是十分有必要的

<!--more-->

> Org mode is for keeping notes, maintaining TODO lists, planning projects, and authoring documents with a fast and effective plain-text system.


## emacs安装配置 {#emacs安装配置}

使用spacemacs(一个EMACS的的vimer版本配置), 了解[Spacemacs](https://www.spacemacs.org/)


## org 文件语法 {#org-文件语法}

orgmode存在一些特殊的语义


### 文件头 {#文件头}

在文件开始的头部定义文件的语义特点

```org
#+STARTUP: overview ;;默认, top-level headlines only
#+STARTUP: indent     ;;使用缩进作为层级,
#+STARTUP: showall    ;;no folding of any entries
#+STARTUP: showeverything ;; show even drawer
```


### Drawer {#drawer}

在全局折叠的时候不会展开, 之后在这个字段上才能展开


### 文本编程 {#文本编程}

在#+BEGIN\_SRC包围的语句中使用特定语言的语法, 使其可以用语法高亮

```python
import os
print(os.path)
```


### 时间标签 {#时间标签}

不同时间标签的含义和定义方法

1.  激活的时间标签 C-c . <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-03-01 Sun&gt;</span></span>
    激活的时间标签是使用尖括号, 用于确定的时间信息表达
2.  非激活的时间标签 C-c ! <span class="timestamp-wrapper"><span class="timestamp">[2020-03-01 Sun]</span></span>
    未激活的时间标签使用方括号, 不确定的时间表达使用
3.  加小时分钟 <span class="timestamp-wrapper"><span class="timestamp">[2020-03-01 Sun 13:00]</span></span>
4.  在两个时间戳之间用两个短横杠连接 <span class="timestamp-wrapper"><span class="timestamp">[2020-03-01 Sun 12:00]&#x2013;[2020-03-01 Sun 13:00]</span></span>


### 时间状态 {#时间状态}

不同的时间状态, 用于区分时间阶段

1.  schedule: C-c C-s
2.  deadline: C-c C-d
3.  closed: 表示完成, 在状态变成done时候添加, 默认是需要在文件头中添加 BEGIN\_SRC

    ```org
    #+STARTUP: logdone
    ```


### 常用语义[Table, links, images] {#常用语义-table-links-images}

用于格式化的渲染


#### 表格 {#表格}

创建一个表格, 展示表格数据

1.  创建表格, 使用分隔符|创建首行, 其它行在normal mode下使用tab键自动生成

    | ID | name | age |
    |----|------|-----|
    | 1  | 张三 | 18  |
    | 2  | 李四 | 20  |
    | 3  | 王五 | 14  |
2.  填充表格数据
    使用tab键在数据输入框之前切换, 进行输入.


#### 超链接 {#超链接}

使用三对方括号进行定义[org-mode](https://orgmode.org/)


#### 图片 {#图片}

使用两对中括号定义![](./demo.jpg)


## GTD {#gtd}

Tasks manage


### TODOlists {#todolists}


#### 学习org {#学习org}

<!--list-separator-->

- <span class="org-todo done DONE">DONE</span>  在互联网上查找资料

<!--list-separator-->

- <span class="org-todo done DONE">DONE</span>  安装emacs

<!--list-separator-->

- <span class="org-todo done DONE">DONE</span>  创建org文件

<!--list-separator-->

- <span class="org-todo done DONE">DONE</span>  配置org

<!--list-separator-->

- <span class="org-todo done DONE">DONE</span>  学习org语法规则<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-03-01 Sun 13:00&gt;&#x2013;&lt;2020-03-01 Sun 15:00&gt; </span></span> <code>[5/5]</code> <code>[100%]</code>

    学习分五步完成

    -   [X] 特殊语义
    -   [X] 时间标记
    -   [X] 装填切换
    -   [X] 标签定义
    -   [X] demo练习

<!--list-separator-->

- <span class="org-todo todo TODO">TODO</span>  自定义agenda的结构, 和手机同步展示, 编辑 <code>[0%]</code>

    与手机同步管理日程计划

    -   [ ] spacemacs关联org文件
    -   [ ] 自定义状态和标签.
    -   [ ] 在手机上使用beorg读取文件
    -   [ ] 在电脑上修改文件, 手机上同步
    -   [ ] 在手机上修改文件, 同步到电脑端


### agenda视图 {#agenda视图}


### 任务管理流程 {#任务管理流程}


#### 收集信息 {#收集信息}


#### 设置状态 {#设置状态}


#### 设置时间 {#设置时间}


#### 每天查看agenda {#每天查看agenda}


#### 及时更新状态 {#及时更新状态}


#### 归档 {#归档}


#### 定期回顾 {#定期回顾}


## 日记 {#日记}


## 工具 {#工具}


### 导出为其它格式文件,用于展示. {#导出为其它格式文件-用于展示-dot}


### 导出为其它格式文件, 用于展示 {#导出为其它格式文件-用于展示}


## 其它 {#其它}


### 使用git管理 {#使用git管理}


#### 初始化项目, 对所有的编辑进行版本管理. 可追溯. {#初始化项目-对所有的编辑进行版本管理-dot-可追溯-dot}


#### 将项目推送到指定的仓库. {#将项目推送到指定的仓库-dot}


### 使用webDev同步到其它的终端 {#使用webdev同步到其它的终端}


#### 坚果云 {#坚果云}


### 客户端 {#客户端}


#### IOS端 beorg {#ios端-beorg}
