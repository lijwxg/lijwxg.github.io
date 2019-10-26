---
title: mysql使用经验
date: 2017-12-04 19:07:05
tags: mysql
categories: Python
---

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [CURD](#curd)
  - [更新](#更新)

<!-- /code_chunk_output -->

<!--more-->
# CURD

## 更新

- 使用ignore关键词, 如果是使用主键primary或者是唯一索引unique区分了记录的唯一性,避免重复插入记录可以使用

```sql
  INSERT IGNORE INTO 'table_name' ('email', 'phone', 'user_id') VALUES('test@163.com', '999',  '9999');
```

  这样当有重复记录就会被忽略,执行后返回数字0
  > 还有一个应用就是复制表,避免重复记录

```sql
INSERT IGNORE INTO 'table_1'('name') SELECT 'name' FROM'table_2';
```

- 对于数据的更新有replace方法,直接将insert更改成replace,使用较为简单和方便replace into使用方法和insert into相同:
&emsp;&emsp;replace的运行与insert很像,但是如果旧记录和新纪录有相同的值,则在新纪录被插入之前,旧记录被删除,即尝试把新行插入到表中.  
&emsp;&emsp;当因为对于主键和为一种关键字出现重复关键字错误而造成插入失败时:从表中删除含有重复关键值得冲突行,再次尝试把新行插入到表中,旧记录与新纪录有相同的值得判断标注就是:  
&emsp;&emsp;表中有一个PRIMARY KEY或UNIQUE索引,否则,使用REPLACE语句没有意义,该语句会与INSERT相同

- 仅对于重复数据更新则在insert into语句之后加上on duplicate key update [key] values(key) 则可以实现对重复字段更新,对于多个字段关联的,使用联合索引,对多个值设置UNIQUE KEY,因为不会使用到主键,使用MYIsAM引擎来建立数据表.
