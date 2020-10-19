---
title: Airflow调度器
date: 2020-06-17
tags:
  - airflow
  - scheduler
---

## airflow 调度器

> airflow 是 Airbnb 贡献的 Apache 顶级项目, 一个采用 DAG（有向无环图）理念设计的任务调度框架，主要用于构造数据管线。

<!--more-->

### 环境准备

此应用程序使用 gunicorn 启动, 同时使用到 linux 的许多特性, 需要在 linux 环境下运行, 不支持 windows 环境运行.  
程序使用纯 python 实现, web 服务基于 flask.

1. windows 下的 wsl
2. python3 虚拟环境
3. mysql 安装

### 安装

1. [在虚拟换环境下安装包](http://airflow.apache.org/docs/stable/installation.html):
   - pip install apache-airflow[mysql]
2. 修改数据库
   - 创建 airflow 的 schema
   - 创建用户 airflow
   - set explicit_defaults_for_timestamp = 1;
3. 配置 AIRFLOE_HOME

### 配置

1. 修改 airflow.cfg

   - 修改 mysql 连接: sql_alchemy_conn = mysql://airflow:123456@mysqlIP/airflow
   - 修改执行器: executor = LocalExecutor
   - 修改时区: default_timezone = Asia/Shanghai, default_ui_timezone = Asia/Shanghai

2. 初始化数据,

   - airflow initdb
   - 如果之前有数据, 则重置数据库 airflow resetdb

3. 有两种页面显示的方案
   1. 默认(登陆就可以访问到所有的 dags)
   2. RBAC(基于角色的权限管理方案)
      - 修改 airflow.cfg 中 webserver rbac = True

### 使用

1. 创建用户
   - [创建 web 新用户](http://airflow.apache.org/docs/stable/security.html)
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
   - 创建 RBAC-UI 用户, 按照角色创建
     ```shell
     airflow create_user -r Admin -u username -e abc@163.com -f ming -l xing -p passeord
     ```
   - 在 docker 中需要增加变量
     ```bash
     postgresql+psycopg2://airflow:***@postgres:5432/airflow
     ```
2. 开启服务

   1. 开启 web-ui
      web 服务由 flask 实现, 可自定义开发
      ```shell
      airflow webserver
      ```
   2. 开启调度器
      只有在调度器开启的情况下,才能执行计划任务
      ```shell
      airflow scheduler
      ```
   3. 开启 worker

      ```bash
      airflow worker -D         # 守护进程运行celery worker
      airflow worker -c 1 -D    # 守护进程运行celery worker并指定任务并发数为1
      ```

3. 手动执行任务

   1. 查看 dag 列表
      ```shell
      airflow list_dags
      ```
   1. 查看 task 列表
      ```shell
      airflow list_tasks email_to
      ```
   1. 测试 task
      ```shell
      airflow test email_to send_email 2020-06-17
      ```
   1. 运行 task
      ```bash
      airflow run dag_id task_id execution_date             # 运行task
      airflow run -A dag_id task_id execution_date          # 忽略依赖 task 运行 task
      airflow trigger_dag dag_id -r RUN_ID -e EXEC_DATE     # 运行整个dag文件
      ```
   1. 暂停,取消任务

      ```bash
      airflow pause dag_id　        # 暂停任务
      airflow unpause dag_id        # 取消暂停，等同于在管理界面打开off按钮
      airflow list_tasks dag_id     # 查看task列表
      airflow clear dag_id          # 清空任务实例
      ```
