---
title: "python常用数据结构"
date: 2018-09-02 22:10:53
tags:
  - python
---

字典是另一种可变容器模型，且可存储任意类型对象。

<!--more-->

字典的每个键值(key=>value)对用冒号(:)分割，每个对之间用逗号(,)分割，整个字典包括在花括号({})中 ；

字典值可以没有限制地取任何 python 对象，既可以是标准的对象，也可以是用户定义的；但键不行，如果同一个键被赋值两次，后一个值会被记住。

值可以取任何数据类型，但键必须是不可变的，如字符串，数字或元组（列表这样的可变类型不能作为键）。

创建、访问：

```python
dict = {'Name': 'Zara', 'Age': 7, 'Class': 'First'};
dict2 = {  }; //空字典
print "dict['Name']: ", dict['Name'];
print "dict['Age']: ", dict['Age'];
```

字典中包含列表：dict={'yangrong':['23','IT'],"xiaohei":['22','dota']}

字典中包含字典：dict={'yangrong':{"age":"23","job":"IT"},"xiaohei":{"'age':'22','job':'dota'"}}

修改、添加：

```python
dict['Age'] = 8; # update existing entry
dict['School'] = "DPS School"; # Add new entry
```

删除：

```python
del dict['Name']; # 删除键是'Name'的条目
dict.clear();     # 清空词典所有条目
del dict ;        # 删除词典
```

查看是否包含特定 key：

dict.has_key(k)
如果键在字典 dict 里返回 true，否则返回 false
查看所有键、值、（键，值）对：dict.keys()、dict.values()、dict.items()；返回值的类型为列表
遍历：

```python
for d,x in dict.items():
    print "key:"+d+",value:"+x



for k in dict.keys():
    print "key:"+k+",value:"+dict[k]
```

排序：

# 按照 key 进行排序

```python
print sorted(dict1.items(), key=lambda d: d[0])
```

或：

```python
sorted(d.items(), lambda x, y: cmp(x[0], y[0])), 或反序：
sorted(d.items(), lambda x, y: cmp(x[0], y[0]), reverse=True)
```

# 按照 value 进行排序

```python
print sorted(dict1.items(), key=lambda d: d[1])
```

或：

```python
sorted(d.items(), lambda x, y: cmp(x[1], y[1])), 或反序：
sorted(d.items(), lambda x, y: cmp(x[1], y[1]), reverse=True)
```

### list

- 按距离差访问元素

- 顺序访问，速度慢

- 存储空间要求小

dict：

- 按索引访问元素

- 需要大空间，但访问很快

set：

- 元素不可重复

- 其它和 dict 基本类似

- |、&、-、^，分别是：并、交、差、逆差

## 动态的根据元素名称创建新的变量

[动态创建新的变量](https://zhuanlan.zhihu.com/p/26150569)
使用 locals 来添加变量

```python
def func(mylist):
    for x in mylist:
        locals()[x] = []
```
