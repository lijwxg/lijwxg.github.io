---
title: nginx使用
date: 2019-11-04
tag:
  - nginx
---

使用 nginx 提供高性能的静态文件服务, 作为负载均衡的代理服务器

<!--more-->

# Nginx 配置

> Nginx 是一个高性能的 HTTP 和反向代理 web 服务器
> nginx 默认监听 80 端口

1. 作为 HTTP 服务器, 可以提供高性能的静态文件服务.
1. 作为反向代理服务器, 可以负载均衡, 端口转发.

## 安装

### OSX

```shell
brew install nginx
```

### Ubuntu

```shell
apt-get install nginx
```

### CentOS

```shell
yum install nginx
```

## 配置

### http

> 配置

### server

> server 接收来自客户端的请求数据, 根据情况对请求进行处理

1. http server
   1. 默认支持使用, 监听 80 端口
1. https server
   1. 需要开启 ssl, 默认监听 443 端口.
1. websocket server

   1. 需要 http 中使用升级工具, 将 http 或者 https 升级为 websocket

      ```nginx.conf http
      map $http_upgrade $connection_upgrade {
          default upgrade;
          '' close;
      }
      ```

      map 指令的作用：  
      该作用主要是根据客户端请求中\$http_upgrade 的值，来构造改变\$connection_upgrade 的值，即根据变量\$http_upgrade 的值创建新的变量$connection_upgrade，  
        创建的规则就是{}里面的东西。其中的规则没有做匹配，因此使用默认的，即 $connection_upgrade 的值会一直是 upgrade。然后如果 \$http_upgrade 为空字符串的话，  
      那值会是 close。

   1. 在 http server 中配置升级标示字段

      ```.conf
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection "Upgrade";
      ```

### upstream

> 处理来自 server 的请求, 将请求交给 upsteam 的 server 池进行处理
> 负载均衡本质上也是反向代理.

- 本模块提供了负载均衡功能,支持 4 中调度算法:

  1. 轮询(默认)
     1. 每个请求按照时间顺序, 逐一分配到不同的后端服务器. 如果后端服务器停止服务, 故障系统自动剔除
     1. Weight 指定轮询权值，Weight 值越大，分配到的访问机率越高
  1. ip_hash
     1. 对每个请求的 IP 进行 hash, 相同的 IP 请求,固定访问同一台服务器
  1. fair
     1. nginx 本身不支持, 需要下载 upstream_fail 模块
     1. 根据后端服务器的响应时长进行分配, 响应时间短的优先分配
  1. url_hash
     1. nginx 本身不支持, 需要下载 hash 包
     1. 对每个请求的 url 进行 hash, 相同的 url 请求,固定访问同一台服务器. 提高缓存效率

- 负载均衡调度状态
  设定每台后端服务器在负载均衡调度中的状态
  1. down，表示当前的 server 暂时不参与负载均衡
  1. backup，预留的备份机器。当其他所有的非 backup 机器出现故障或者忙的时候，才会请求 backup 机器，因此这台机器的访问压力最低
  1. max_fails，允许请求失败的次数，默认为 1，当超过最大次数时，返回 proxy_next_upstream 模块定义的错误。
  1. fail_timeout，请求失败超时时间，在经历了 max_fails 次失败后，暂停服务的时间。max_fails 和 fail_timeout 可以一起使用。

[Nginx 支持 WebSocket 反向代理-学习小结](https://www.cnblogs.com/kevingrace/p/9512287.html)
[Nginx 负载均衡的实现和调度算法](https://blog.csdn.net/houkepei/article/details/80571744)
