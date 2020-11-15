---
title: "SSH"
date: 2020-03-02T23:27:00+08:00
tags: ["ssh"]
draft: false
---

SSH 秘钥的一些使用方法

<!--more-->


## SSH 协议 {#ssh-协议}

> SSH 为 Secure Shell 的缩写.SSH 为建立在应用层基础上的安全协议。SSH 是较可靠，专为远程登录会话和其他网络服务提供安全性的协议.


## 版本 {#版本}

```shell
#ssh -V
OpenSSH_7.9p1, LibreSSL 2.7.3
```

-   OpenSSH 是 SSH1
-   SSL 是 SSH2


## key pair {#key-pair}

```shell
#ssh-keygen
```

> 默认生成的 id\_ras 私钥文件是: ----BEGIN OPENSSH PRIVATE KEY-----


## 将私钥转化为 SSH2 {#将私钥转化为-ssh2}

```shell
#puttygen id_rsa -O private-sshcom -o id_rsa.mid
```

> 生成的新文件是 ---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----


## 将 SSH2 转化为 RSA - PEM {#将-ssh2-转化为-rsa-pem}

```shell
#ssh-keygen -i -f id_rsa.mid > id_rsa.rsa
```

> 新文件是: -----BEGIN RSA PRIVATE KEY-----
