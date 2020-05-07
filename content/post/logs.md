---
title: "python日志模块"
date: 2018-10-03 22:10:53
tags:
  - python
---

python 常用的记录日志的模块, 用于日志分析等场景

<!--more-->

## 查看日志

```shell
$ cd /home/tornado/abc/logs/supervisor
$ tail -f  abc_tornado_stdout*                     #实时日志输出
$ cat tornado_stdout* | grep "ader_update"     #查看生成的日志
```

## 日志模块 logging

## 通过 logging.basicConfig 函数对日志的输出格式及方式做相关配置

**logging.basicConfig 函数各参数:**

- filename: 指定日志文件名
- filemode: 和 file 函数意义相同，指定日志文件的打开模式，'w'或'a'
- format: 指定输出的格式和内容，format 可以输出很多有用信息，如下例所示:
  - %(levelno)s: 打印日志级别的数值
  - %(levelname)s: 打印日志级别名称
  - %(pathname)s: 打印当前执行程序的路径，其实就是 sys.argv[0]
  - %(filename)s: 打印当前执行程序名
  - %(funcName)s: 打印日志的当前函数
  - %(lineno)d: 打印日志的当前行号
  - %(asctime)s: 打印日志的时间
  - %(thread)d: 打印线程 ID
  - %(threadName)s: 打印线程名称
  - %(process)d: 打印进程 ID
  - %(message)s: 打印日志信息
- datefmt: 指定时间格式，同 time.strftime()
- level: 设置日志级别，默认为 logging.WARNING
- stream: 指定将日志的输出流，可以指定输出到 sys.stderr,sys.stdout 或者文件，默认输出到 sys.stderr，当 stream 和 filename 同时指定时，stream 被忽略

```python
import logging

logging.basicConfig(level=logging.DEBUG,            # 设置存入log文件的日志级别
                    format="%(asctime)s %(filename)s [line:%(lineno)d] %(levelname)s %(message)s",
                    datefmt="%a, %d, %b, %Y %H:%M:%S",
                    filename="myapp.log",
                    filemode="w"
                    )

logging.error("This is a error message.")
logging.warning("this is a warning message!")
logging.info("this is a info message.")
logging.debug("this is a debug message.")
```

## 通过 logging.StreamHandler 将日志同时输出到文件和屏幕

```python
import logging

logging.basicConfig(level=logging.DEBUG,            # 设置存入log文件的日志级别
                    format="%(asctime)s %(filename)s [line:%(lineno)d] %(levelname)s %(message)s",
                    datefmt="%a, %d, %b, %Y %H:%M:%S",
                    filename="myapp_stream.log",
                    filemode="w"
                    )

# 定义一个StreamHandler, 将INFO级别或更高的日志信息打印到标注错误,并将其添加到当前的日志处理对象
console = logging.StreamHandler()
console.setLevel(logging.INFO)                      # 设置在控制台显示的日志级别
formatter = logging.Formatter("%(name)-12s: %(levelname)-8s %(message)s")
console.setFormatter(formatter)
logging.getLogger("").addHandler(console)

logging.error("This is a error message.")
logging.warning("this is a warning message!")
logging.info("this is a info message.")
logging.debug("this is a debug message.")
```

## 通过 logging.handler.RotatingFileHandler 对日志进行回滚

```python
import logging
from logging.handlers import RotatingFileHandler

# 定义一个RotatingFileHandler, 最多备份5个日志文件,每个日志文件最大10M
Rthandler = RotatingFileHandler("myapp_rotating.log", maxBytes=10*1024*1024, backupCount=5)
Rthandler.setLevel(logging.INFO)                    # 设置存入log文件的日志级别
formatter = logging.Formatter("%(asctime)s %(filename)s [line:%(lineno)d] %(levelname)s %(message)s")
Rthandler.setFormatter(formatter)
logging.getLogger("").addHandler(Rthandler)

logging.error("This is a error message.")
logging.warning("This is a warning message!")
logging.info("This is a info message!")
logging.debug("This is a debug message!")
```

从本例和上例可以看出.logging 有一个日志处理的主对象,其它处理都是通过 addHandler 添加进来的

**logging 的几种 handler 方式如下:**

1. logging.StreamHandler: 日志输出到流, 可以是 sys.stderr, sys.stdout 或者文件
2. logging.FileHandler: 日志输出到文件,

**日志回滚方式, 实际使用时用 RotatingFileHandler 和 TimedRotatingFileHandler:**

- logging.handlers.BaseRotatingHandler
- logging.handlers.RotatingFileHandler
- logging.handlers.TimedRotatingFileHandler
- logging.handlers. SockHandler # 远程输出日志到 TCP/IP sockets
- logging.handlers.DatagramHandler # 远程输出日志到 UDP sockets
- logging.handlers.SMTPHandler # 远程输出日志到邮件地址
- logging.handlers.SysLogHandler # 日志输出到 syslog
- logging.handlers.NTEventLogHandler # 远程输出到内存中指定 buffer
- logging.handlers.HTTPHandler # 通过"GET", "POST"远程输出到 HTTP 服务器

由于 StreamHandler 和 FileHandler 是常用的日志处理方式, 所以直接包含在 logging 模块中,而其他方式则包含在 logging.handlers 模块中.

## 通过 logging.config 模块配置日志

```conf
#logger.conf

###############################################

[loggers]
keys=root,example01,example02

[logger_root]
level=DEBUG
handlers=hand01,hand02

[logger_example01]
handlers=hand01,hand02
qualname=example01
propagate=0

[logger_example02]
handlers=hand01,hand03
qualname=example02
propagate=0

###############################################

[handlers]
keys=hand01,hand02,hand03

[handler_hand01]
class=StreamHandler
level=INFO
formatter=form02
args=(sys.stderr,)

[handler_hand02]
class=FileHandler
level=DEBUG
formatter=form01
args=('myapp.log', 'a')

[handler_hand03]
class=handlers.RotatingFileHandler
level=INFO
formatter=form02
args=('myapp.log', 'a', 10*1024*1024, 5)

###############################################

[formatters]
keys=form01,form02

[formatter_form01]
format=%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s
datefmt=%a, %d %b %Y %H:%M:%S

[formatter_form02]
format=%(name)-12s: %(levelname)-8s %(message)s
datefmt=
```

StreamHandlers

```python
import logging
import logging.config

logging.config.fileConfig("logger.conf")
logger = logging.getLogger("example01")

loggerloggerloggerlogger.error("This is a error message  in stream.")
loggerloggerlogger.warning("This is a warning message  in stream!")
loggerlogger.info("This is a info message  in stream!")
logger.debug("This is a debug message  in stream!")
```

RotatingFileHandlers

```python
import logging
import logging.config

logging.config.fileConfig("logger.conf")
logger = logggin.getLogger("example02")

logger.error("This is a error message.")
loggerloggerlogger.warning("This is a warning message in rotating!")
loggerlogger.info("This is a info message in rotating!")
logger.debug("This is a debug message in rotating!")
```

## logging 是线程安全的

- 线程安全就是多线程访问时，采用了加锁机制，当一个线程访问该类的某个数据时，进行保护，其他线程不能进行访问直到该线程读取完，其他线程才可使用。不会出现数据不一致或者数据污染。
- 线程不安全就是不提供数据访问保护，有可能出现多个线程先后更改数据造成所得到的数据是脏数据
