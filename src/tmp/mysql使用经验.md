---
title: mysql使用经验
date: 2017-12-04 19:07:05
tags:
  - mysql
categories:
  - python
---

SQL 的常用增删改查操作

<!--more-->

## 更新

- 使用 ignore 关键词, 如果是使用主键 primary 或者是唯一索引 unique 区分了记录的唯一性,避免重复插入记录可以使用

```sql
  INSERT IGNORE INTO 'table_name' ('email', 'phone', 'user_id') VALUES('test@163.com', '999',  '9999');
```

这样当有重复记录就会被忽略,执行后返回数字 0

> 还有一个应用就是复制表,避免重复记录

```sql
INSERT IGNORE INTO 'table_1'('name') SELECT 'name' FROM'table_2';
```

- 对于数据的更新有 replace 方法,直接将 insert 更改成 replace,使用较为简单和方便 replace into 使用方法和 insert into 相同:
  &emsp;&emsp;replace 的运行与 insert 很像,但是如果旧记录和新纪录有相同的值,则在新纪录被插入之前,旧记录被删除,即尝试把新行插入到表中.  
  &emsp;&emsp;当因为对于主键和为一种关键字出现重复关键字错误而造成插入失败时:从表中删除含有重复关键值得冲突行,再次尝试把新行插入到表中,旧记录与新纪录有相同的值得判断标注就是:  
  &emsp;&emsp;表中有一个 PRIMARY KEY 或 UNIQUE 索引,否则,使用 REPLACE 语句没有意义,该语句会与 INSERT 相同

- 仅对于重复数据更新则在 insert into 语句之后加上 on duplicate key update [key] values(key) 则可以实现对重复字段更新,对于多个字段关联的,使用联合索引,对多个值设置 UNIQUE KEY,因为不会使用到主键,使用 MYIsAM 引擎来建立数据表.
