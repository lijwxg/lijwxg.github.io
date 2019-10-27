## **个人信息**

---

<div>
<img style="position:absolute;margin-left:700px" width=150px src="https://i.loli.net/2019/10/26/9R4zjiaAkE2HOqy.jpg">
</div>

<i class="fa fa-male" aria-hidden="true"></i>:&ensp;李嘉文  
<i class="fa fa-phone" aria-hidden="true"></i>: 181****1019  
<i class="fa fa-envelope" aria-hidden="true"></i>: lijwxg@hotmail.com  
<i class="fa fa-rss-square" aria-hidden="true"></i>:  [daoji.site](https://daoji.site)
<i class="fa fa-graduation-cap" aria-hidden="true"></i>: 东北林业大学(211本科)
<!-- more -->

## **工作经验**

---

1. 软通动力技术有限公司 -- **python开发工程师**(2019.4.24至今)  
   - 负责华为产品集成部署,产品迭代迁移
2. 北京市多牛传媒有限公司 -- **python开发工程师**(2017.11-2019.4)
   - 公司广告平台大数据API
   - 公司产品: 人人, NGA, TGBUS等
3. 深圳市花果山有限公司 -- **python开发工程师**(2016.05-2017.10)
   - 销售系统维护

## **技术栈**

---

<div align=center>
<img src="https://i.loli.net/2019/10/25/f3rg7JTvOhlyon1.jpg">
</div>

## **项目经验**

---

1. **BI 系统**:
    `项目描述`:
    - 依托大数据平台, 对公司数据进行有效的整合, 提供数据报表, 用于用户分析, 渠道分析等, 帮助公司做出合理的决策, 用户画像生成.
    - 平台使用 tornado 框架开发, 使用 supervisor 部署,使用 nginx 进行负载均衡和反向代理. 提供第三方数据需求接口.
    - 构建了数据报表系统, 每日通过 matplotlib 将关键性数据进行图形化, 整合后通过smtp发送给相关人员.

    `个人职责`
    - 邮件系统实现: 实现邮件任务系统, 调用接口, 将接口返回数据通过邮件形式发送到指定的个人邮箱, 按照定时计划执行
    - 数据API实现: 根据需求设计完成接口

    `业务结构`

    ```mermaid
    graph BT
    终端 --kafka--> hdfs
    爬虫 --> ES

    druid--实时数据-->pandas+tornado
    mysql-->pandas+tornado
    ES-->pandas+tornado

    pandas+tornado --> BI
    pandas+tornado --> 报表
    pandas+tornado --> 邮件
    subgraph 数据源
    终端
    爬虫
    end
    subgraph 数据库
    hdfs-->druid
    hdfs-->mysql
    druid-->mysql
    mysql
    ES
    end
    subgraph 数据分析及API
    pandas+tornado
    end
    subgraph 输出
    BI
    邮件
    报表
    end
    ```

    <br/>

2. **Q币交易系统**:
    `项目描述`:
    - 基于角色, 用户能在平台上完成虚拟货币的供货, 进货, 充值等一系列操作, 提供财务管理, 订单管理, 商品管理等服务模块.
    - 系统使用 sanic 框架开发, 基于微服务理念, 对模块进行了拆分, 并独立提供服务, 基于restful风格提供了接口.
    - 每个服务使用 docker 部署, 对外提供统一的API入口, 统一进行权限认证. 可以根据需求方便对系统进行拓展, 保证服务的高性能, 高可用.

    `个人职责`:
    - 负责了订单管理.商品管理和接口设计和实现
    - 责任服务模块的部署, 压力测试.

    `业务结构`

    ```mermaid
    graph LR

    subgraph API
    财务管理
    订单管理
    商品管理
    用户认证-->财务管理
    用户认证-->订单管理
    用户认证-->商品管理
    统一网关-->用户认证
    end
    ```

    <!--在用户模块, 使用 MySQL 储存用户注册信息, 通过 celery 库使用 SMTP 服务给用户发送注册成功邮件;使用 cookie 和 sessions 判断用户登录状态,显示特定页面给客户
    权限: 基于角色的权限管理系统 RBAC
    在订单,财务管理模块, 通过提交订单,结算用户商品金额, 从数据库提取同步的数据, 防止用户 对网页提交数据进行修改,对库存进行校验. 调用第三方支付提供的 API, 完成 支付环节, 提供订单状态显示,包括支付状态, 基本订单信息. 并记录详细的日志信息.
    使用事务保证服务的安全可靠-->.

3. **Grafana 系统**:
    `项目描述`:
    - grafana 作为集成了包含权限管理, 用户管理, 数据展示, 数据探索, 业务告警的开发工具.
    - 将数据以更加灵活, 更加便捷, 更加快速的方式展现出来, 数据内容包含运维,开发, 产品和客户所关心的数据.

    `个人职责`:
    - Grafana的日常维护:管理后台,权限控制, 升级, 模块更新
    - 对接Grafana的API实现

    `业务结构`

    ```mermaid
    graph LR
    数据库 --> pannel
    API --> pannel
    Dashboard --> Browser
    subgraph Grafana
    pannel
    Dashboard
    pannel --> Dashboard
    end
    subgraph 源数据
    数据库
    API
    end
    ```

    <!--实现技术:
    存储: 广泛使用各类数据库, 包括 mysql, druid, es.
    API: 使用 python 框架 sanic 提供了大量供 grafana 使用的自定义接口.-->

4. **牛油果广告系统**:
    `项目描述`:
    - 通过服务接受来自广告系统的数据(日均数据量上亿条), 接受服务将广告行为数据发送到 kafka 的 topic 中供 streaming 进行消费.
    - 落地到 hdfs, 然后发送到druid 提供实时运算, 保证了系统的实时性.
    - 最后展示环节通过 python 的 web 接口程序返回.

    `个人职责`:
    - 数据报表实现
    - 数据接口实现
    <!--实现技术:
    存储: kafka 作为实时消息队列, druid 作为实时运行系统.
    数据接收: 使用 python 框架 sanic 提供了数据接收服务,作为数据的入口
    数据处理: 使用了 pandas 进行数据处理.-->

5. **Monitor 系统**:
   `项目描述`:
    - 监控公司的各项业务数据, 包含 redis,es, mysql,druid,kafka 集群的健康状态
    - 每日进入数据的量, 核心业务的运行状态, 常用工具等

    `个人职责`:
    - 页面显示数据API实现
    - 告警邮件系统实现

6. **友赚系统**:
    `项目描述`
    - 积分墙服务, 推广应用和游戏的平台. 对接游戏和软件商, 通过推广和积分奖励让用户下载平台上的软件, 游戏
    - 完成相关任务, 结算奖励, 避免用户使用一个手机刷单, 使用用户的设备信息作为唯一标识, 使用redis 做了任务队列和实时任务系统,

    `个人职责`:
    - 任务获取,核实服务的实现
    - 管理员系统的实现,包含任务输入,排期, 财务报表.审核功能实现
    - 短信验证和微信绑定,提现功能的实现

    `业务结构`:

    ```mermaid
    sequenceDiagram
    participant APP
    participant GateWay
    participant API
    participant Server

    APP->>GateWay: Login
    GateWay->GateWay: 验证用户session
    alt pass
        GateWay ->> API: 请求用户数据
        API-->> APP: 返回用户数据
    else failed
        GateWay -->> APP: 返回登录页
        APP ->> GateWay: 输入账号,密码
        GateWay->GateWay: 验证用户名, 密码
    end
    APP->> GateWay: 获取任务信息
    GateWay->> API: 获取任务信息
    API-->>APP: 返回数据
    APP->> GateWay: 领取任务
    GateWay ->> API: 用户领取任务
    API->> Server: 领取任务
    alt 满足条件
        Server-->> API: 领取成功及任务ID
        API-->>APP: 领取成功
    else 不满足条件
        Server-->> API: 领取失败原因
        API-->>APP:领取失败及原因
    end
    ```

    <!--实现技术:
    使用 redis 技术实时存储了用户领取的任务状态和信息, 同时通过将后台管理工具生成的任务以队列的形式存储到 redis 中
    使用 Elasticsearch 记录用户的行为日志, 根据行为日志对用户的奖励进行结算-->

7. **NCE云化网管**:
   `项目描述`
    - 负责集群化部署NCE: 提供多场景, 多规模, 全套解决方案,  保证现网实施无问题, 负责   工具的web化集成, 提供从硬件到软件层的部署解决方案
    - 从老系统迁移到新的云化网管, 包含数据迁移, 配置迁移方案的实施

    `个人职责`:
    - 安装,迁移工具实现
    - 流程优化和效率提升

## **个人评价**

- 认真负责，工作执行力强，乐于从事有挑战性的工作;
- 沟通能力强，抗压能力强，具备良好的团队协作精神;
- 学习能力强，对新的技术点能够快速地自主学习掌握并应用到工作中。
