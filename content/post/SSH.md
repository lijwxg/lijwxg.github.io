---
title: SSH
date: 2020-03-02
tag:
- ssh
---
## SSH协议

> SSH 为 Secure Shell 的缩写.SSH 为建立在应用层基础上的安全协议。SSH 是较可靠，专为远程登录会话和其他网络服务提供安全性的协议.

## 版本

```shell
#ssh -V
OpenSSH_7.9p1, LibreSSL 2.7.3
```

- OpenSSH是SSH1
- SSL是SSH2

## key pair

```shell
#ssh-keygen
```

> 默认生成的id_ras私钥文件是: ----BEGIN OPENSSH PRIVATE KEY-----

## 将私钥转化为SSH2

```shell
#puttygen id_rsa -O private-sshcom -o id_rsa.mid
```

> 生成的新文件是 ---- BEGIN SSH2 ENCRYPTED PRIVATE KEY ----

## 将SSH2转化为RSA - PEM

```shell
#ssh-keygen -i -f id_rsa.mid > id_rsa.rsa
```

> 新文件是: -----BEGIN RSA PRIVATE KEY-----
