---
title: python用法
date: 2017-9-06 20:47:26
tags:
  - python
categories:
  - python
---

python 的一些基础知识记录

<!--more-->

## Python 的函数参数传递

&emsp;&emsp;在 Python 中所有的变量都可以理解为内存中一个对象的引用,这里的类型是属于对象的,而不是变量.而对象有两种'可更改','不可更改'两种,第一个代码块属于不可变类型的数字,同时,也可以理解为更改后的 a 为函数内部的局域变量,在外面不起作用.

```python
a = 1
def fun(a):
    a = 2
fun(a)
print(a)  #1
```

&emsp;&emsp;这里的函数内应用指向的是一个可变对象,对它的操作就和定位了指针地址一样,在内存里进行了修改.

```python
a = []
def fun(a):
    a.append(1)
fun(a)
print(a)  #[1]
```

## staticmethod 和 classmethod

&emsp;&emsp;Python 有三种方法,包括静态方法(staticmethod),类方法(classmethod),和实例方法.如下:

```Python
def foo(x):
    print("executing foo(%s)" % x)
class A(object):
    def foo(self, x):
        print("executing foo(%s, %s)" % (self, x))
    @classmethod
    def class_foo(cls, x):
        print("executing class_foo(%s, %s) % (cls, x)")
    @staticmethod
    def static_foo(x):
        print("excuting static_foo(%s)" % x)
a = A()
```

&emsp;&emsp;代码中的 self 和 cls 是对类和实例的绑定,对于一般的函数来说我们可以调用 foo(x),这是最基本的函数,最常用,它的工作和其他的类,实例无关,对于实例方法,我们知道在类里每次定义的方法都需要绑定这个实例,就是 foo(self,x),这是因为实例方法的调用离不开实例,我们需要把实例自己传给函数,调用的时候是这样的 a.foo(x)(其实就是 foo(a,x));类方法也是一样,不过它传递的是类而不是实例,A.classmethod_foo();  
&emsp;&emsp;而静态方法和普通方法是一样的,不需要对谁惊醒绑定,唯一的区别是调用的时候需要使用 a.static_foo(x)或者 A.static_foo()来调用
