---
title: "sphinx文档"
date: 2020-11-07T16:12:00+08:00
tags: ["sphinx"]
draft: false
---

使用sphinx构建项目的说明文档, sphinx的建立之初的目的就是为python构建一个详细的文档

<!--more-->


## 安装sphinx {#安装sphinx}

```nil
pip install sphinx
```


## 在pycharm的settings中设置Docstrings为reStructedText格式 {#在pycharm的settings中设置docstrings为restructedtext格式}


## 使用reStructuredText的语法 {#使用restructuredtext的语法}

reStructuredText 是扩展名为.rst的纯文本文件，含义为"重新构建的文本"，也被简称为：RST或reST；
是Python编程语言的Docutils项目的一部分，Python Doc-SIG (Documentation Special Interest Group)。
该项目类似于Java的JavaDoc或Perl的POD项目。 Docutils 能够从Python程序中提取注释和信息，格式化成程序文档。


## 在项目下建立doc文件夹, 区分源文件和代码文件 {#在项目下建立doc文件夹-区分源文件和代码文件}

1.  初始化项目

    ```nil
    cd project
    sphinx-quickstart
    ```
2.  修改sphinx的配置文件conf.py
3.  为源代码生成html文件

    ```nil
    sphinx-apidoc -o sphinx_demo/source ../src/
    make html
    ```


## 在函数下面写注释 {#在函数下面写注释}

```python
def funcname(self, parameter_list):
    """
    docstring
    :params parameter_list 参数列表
    """
    pass
```
