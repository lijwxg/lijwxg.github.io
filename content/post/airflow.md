---
title: Airflow调度器
date: 2020-06-17
tags:
  - airflow
  - scheduler
---

## airflow调度器

> airflow是Airbnb贡献的Apache顶级项目, 一个采用DAG（有向无环图）理念设计的任务调度框架，主要用于构造数据管线。
<!--more-->

### 环境准备

此应用程序使用gunicorn启动, 同时使用到linux的许多特性, 需要在linux环境下运行, 不支持windows环境运行.  
程序使用纯python实现, web服务基于flask.  

1. windows下的wsl
2. python3虚拟环境
3. mysql安装


### 安装

1. [在虚拟换环境下安装包](http://airflow.apache.org/docs/stable/installation.html):
   - pip install apache-airflow[mysql]
2. 修改数据库
   - 创建airflow的schema
   - 创建用户airflow
   - set explicit_defaults_for_timestamp = 1;
3. 配置AIRFLOE_HOME

### 配置

1. 修改airflow.cfg
   - 修改mysql连接: sql_alchemy_conn = mysql://airflow:123456@mysqlIP/airflow
   - 修改执行器: executor = LocalExecutor
   - 修改时区: default_timezone = Asia/Shanghai, default_ui_timezone = Asia/Shanghai

2. 初始化数据,
   - airflow initdb
   - 如果之前有数据, 则重置数据库airflow resetdb

3. 有两种页面显示的方案
   1. 默认(登陆就可以访问到所有的dags)
   2. RBAC(基于角色的权限管理方案)
      - 修改airflow.cfg中webserver rbac = True

### 使用

1. 创建用户
    - [创建web新用户](http://airflow.apache.org/docs/stable/security.html)
        ```python
        import airflow
        from airflow import models, settings
        from airflow.contrib.auth.backends.password_auth import PasswordUser
        user = PasswordUser(models.User())
        user.username = 'new_user_name'
        user.email = 'new_user_email@example.com'
        user.password = 'set_the_password'
        session = settings.Session()
        session.add(user)
        session.commit()
        session.close()
        exit()
        ```
    - 创建RBAC-UI用户, 按照角色创建
        ```shell
            airflow create_user -r Admin -u username -e abc@163.com -f ming -l xing -p passeord
        ```
2. 开启服务
    1. 开启web-ui
        web服务由flask实现, 可自定义开发
        ```shell
        airflow webserver
        ```
    2. 开启调度器
        只有在调度器开启的情况下,才能执行计划任务
        ```shell
        airflow scheduler
        ```

3. 手动执行任务
    1. 查看dag列表
        ```shell
        airflow list_dags
        ```
    2. 查看task列表
        ```shell
        airflow list_tasks email_to
        ```
    3. 测试task
        ```shell
        airflow test email_to send_email 2020-06-17
        ```

