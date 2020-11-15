---
title: "AWS基础"
date: 2020-08-13T18:11:00+08:00
tags: ["aws", "ec2", "s3", "ecr", "sagemaker"]
draft: false
---

[亚马逊云](https://console.aws.amazon.com/)是十分领先的云服务厂商, 提供了大量开箱即用服务.大大减少了开发成本.

<!--more-->


## 使用亚马逊的云服务 {#使用亚马逊的云服务}


### EC2 {#ec2}

Elastic Compute Cloud
服务器


### S3 {#s3}

Simple Storage Service
存储


### ECR {#ecr}

Elastic Container Registry
容器注册表


### Lambda {#lambda}

Serverless, 函数


### SageMaker {#sagemaker}

大规模构建、训练和部署机器学习模型


## aws工具集 {#aws工具集}


### 安装awscli {#安装awscli}

```shell
mkvirtualenv aws
workon aws
pip install awscli
```


### 配置系统环境 {#配置系统环境}

从我的安全凭证中获取到access key id, secret access key

```shell
aws configure
```


### 授权ec2访问s3 {#授权ec2访问s3}

在我的安全凭证中创建角色, 给EC2服务增加S3的权限

```shell
aws s3 ls
aws s3 cp s3://lijwxg/demo .
```


### 使用ecr {#使用ecr}

登陆

```shell
aws ecr get-login --no-include-email|sh
```

推送本地镜像到ecr

```shell
docker images
docker tag 338f12981185 111111111.dkr.ecr.ap-northeast-1.amazonaws.com/demo
docker push 111111111.dkr.ecr.ap-northeast-1.amazonaws.com/demo
```
