---
title: "plantuml使用"
date: 2020-06-06T15:54:00+08:00
tags: ["plantuml"]
draft: false
---

使用plantuml画结构图

<!--more-->


## 通过简单直观的语言来绘制示意图 {#通过简单直观的语言来绘制示意图}

[plantuml](<https://plantuml.com/zh/>)是一种统一建模语言(Unified Modeling Language，UML), 能方便快捷将想法转化为图形, 所想即所得.


## 准备工作 {#准备工作}

1.  安装[Graphviz](<http://www.graphviz.org/>)
    > plantuml使用Graphviz来生成相关图形
2.  配置Graphviz的环境变量, dot -v命令能生效
3.  下载[plantuml.jar](<https://plantuml.com/zh/download>)
    > plantuml.jar包可以直接运行uml的文件,进行输出


## PlantUML是一个开源项目，支持快速绘制 {#plantuml是一个开源项目-支持快速绘制}

**本文摘抄自[plantuml](<https://plantuml.com/zh/>)**


### 支持绘制UML图,如下 {#支持绘制uml图-如下}

-   [时序图](#时序图)
-   [用例图](#用例图)
-   类图
-   活动图 (旧版语法在此处)
-   组件图
-   状态图
-   对象图
-   部署图
-   定时图


### 同时还支持以下非UML图,如下 {#同时还支持以下非uml图-如下}

-   线框图形界面
-   架构图
-   规范和描述语言 (SDL)
-   Ditaa diagram
-   甘特图
-   思维导图
-   Work Breakdown Structure diagram
-   以 AsciiMath 或 JLaTeXMath 符号的数学公式
-   Entity Relationship diagram


## 图形显示 {#图形显示}


### 时序图 {#时序图}


#### 声明参与者 {#声明参与者}

你可以用->来绘制参与者之间传递的消息， 而不必显式地声明参与者。
你也可以使用 --> 绘制一个虚线箭头。
另外，你还能用 <- 和 <--，这不影响绘图，但可以提高可读性。 注意：仅适用于时序图，对于其它示意图，规则是不同的。

\`\`\`plantuml
用户 -> 认证中心: 登录操作
认证中心 -> 缓存: 存放(key=token+ip,value=token)token

用户 <- 认证中心 : 认证成功返回token
用户 -> 认证中心: 下次访问头部携带token认证
认证中心 <- 缓存: key=token+ip获取token
其他服务 <- 认证中心: 存在且校验成功则跳转到用户请求的其他服务
其他服务 -> 用户: 信息
\`\`\`

关键字 participant 用于改变参与者的先后顺序。
你也可以使用其它关键字来声明参与者：

-   actor
-   boundary
-   control
-   entity
-   database
-   collections

关键字 as 用于重命名参与者
你可以使用RGB值或者颜色名修改 actor 或参与者的背景颜色。


#### 给自己发消息 {#给自己发消息}

参与者可以给自己发信息，
消息文字可以用\n来换行。


#### 修改箭头样式 {#修改箭头样式}

修改箭头样式的方式有以下几种:

-   表示一条丢失的消息：末尾加 x
-   让箭头只有上半部分或者下半部分：将<和>替换成\\或者 /
-   细箭头：将箭头标记写两次 (如 >> 或 //)
-   虚线箭头：用 -- 替代 -
-   箭头末尾加圈：->o
-   双向箭头：<->


#### 对消息序列编号 {#对消息序列编号}

关键字 autonumber 用于自动对消息编号。

语句 autonumber __start__ 用于指定编号的初始值，而 autonumber __start__ __increment__ 可以同时指定编号的初始值和每次增加的值。

你可以在双引号内指定编号的格式。
格式是由 Java 的DecimalFormat类实现的： (0 表示数字；# 也表示数字，但默认为0)。
你也可以用 HTML 标签来制定格式。

你还可以用语句 autonumber stop 和 autonumber resume __increment__ __format__ 来表示暂停或继续使用自动编号。


#### Page Title, Header and Footer {#page-title-header-and-footer}

The title keyword is used to add a title to the page.
Pages can display headers and footers using header and footer.


#### 分割示意图 {#分割示意图}

关键字 newpage 用于把一张图分割成多张。
在 newpage 之后添加文字，作为新的示意图的标题。
这样就能很方便地在 Word 中将长图分几页打印。


#### 组合消息 {#组合消息}

我们可以通过以下关键词将组合消息：

-   alt/else
-   opt
-   loop
-   par
-   break
-   critical
-   group, 后面紧跟着消息内容

可以在标头(header)添加需要显示的文字(group除外)。
关键词 end 用来结束分组。
注意，分组可以嵌套使用。


#### 给消息添加注释 {#给消息添加注释}

我们可以通过在消息后面添加 note left 或者 note right 关键词来给消息添加注释。
你也可以通过使用 end note 来添加多行注释。


#### 其他的注释 {#其他的注释}

可以使用note left of，note right of或note over在节点(participant)的相对位置放置注释。
还可以通过修改背景色来高亮显示注释。
以及使用关键字end note来添加多行注释。


#### 改变备注框的形状 {#改变备注框的形状}

你可以使用 hnote 和 rnote 这两个关键字来修改备注框的形状。


#### Creole和HTML {#creole和html}

[可以使用creole格式](<https://plantuml.com/zh/creole>)


#### 分隔符 {#分隔符}

你可以通过使用 == 关键词来将你的图表分割多个步骤。


#### 引用 {#引用}

你可以在图中通过使用ref over关键词来实现引用


#### 延迟 {#延迟}

你可以使用...来表示延迟，并且还可以给延迟添加注释。


#### 空间 {#空间}

你可以使用|||来增加空间。
还可以使用数字指定增加的像素的数量。


#### 生命线的激活与撤销 {#生命线的激活与撤销}

关键字activate和deactivate用来表示参与者的生命活动。
一旦参与者被激活，它的生命线就会显示出来。
activate和deactivate适用于以上情形。
destroy表示一个参与者的生命线的终结。


#### Return {#return}

A new command return for generating a return message with optional text label. The point returned to is the point that cause the most recently activated life-line. The syntax is simply return label where label, if provided, can be any string acceptable on conventional messages.


#### 创建参与者 {#创建参与者}

你可以把关键字create放在第一次接收到消息之前，以强调本次消息实际上是在创建新的对象。


#### Shortcut syntax for activation, deactivation, creation {#shortcut-syntax-for-activation-deactivation-creation}

Immediately after specifying the target participant, the following syntax can be used:
++ Activate the target (optionally a #color may follow this)
-- Deactivate the source
\*Create an instance of the target
!! Destroy an instance of the target


#### 进入和发出消息 {#进入和发出消息}

如果只想关注部分图示，你可以使用进入和发出箭头。
使用方括号\`[\`和\`]\`表示图示的左、右两侧。


#### Anchors and Duration {#anchors-and-duration}

With teoz usage it is possible to add anchors to the diagram and use the anchors to specify duration time.


#### 构造类型和圈点 {#构造类型和圈点}

可以使用\`<a id="org45352f7"></a>\`给参与者添加构造类型。
在构造类型中，你可以使用(X,color)格式的语法添加一个圆圈圈起来的字符。


#### 更多标题信息 {#更多标题信息}

你可以在标题中使用creole格式。
在标题描述中使用\`\n\`表示换行。
还可以使用关键字title和end title定义多行标题。


#### 包裹参与者 {#包裹参与者}

可以使用box和end box画一个盒子将参与者包裹起来。
还可以在box关键字之后添加标题或者背景颜色。


#### 移除脚注 {#移除脚注}

使用hide footbox关键字移除脚注。


#### 外观参数(skinparam) {#外观参数--skinparam}

用skinparam改变字体和颜色。
可以在如下场景中使用：

-   在图示的定义中，
-   在引入的文件中，
-   在命令行或者ANT任务提供的配置文件中。

你也可以修改其他渲染元素


#### 填充区设置 {#填充区设置}

可以设定填充区的参数配置。
