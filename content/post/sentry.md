---
title: "Sentry的部署"
date: 2020-01-12
tag:
- sentry
- log
- docker
---

针对后台日志采集和分析提供的整套解决方案, 使用docker部署
<!--more-->

## 获取compose文件

```shell
git clone https://github.com/getsentry/onpremise.git
```

## 运行安装脚本

```shell
./install
```

## 服务启动

```shell
docker-compose up -d
```

## 服务重新构建

```shell
docker-compose down
docker-compose up -d
```

## 服务启动关闭

```shell
docker-compose stop
docker-compose start
```

## 进入容器

```shell
docker exec -it sentry_onpremise_web_1 /bin/bash
```

## 集成

1. 获取dsn接口
1. 在代码中集成
