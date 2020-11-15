---
title: "linux三剑客"
date: 2019-06-07
tags: ["linux", "shell"]
draft: false
---

linux 下最常用和通用的文件, 字符串查询, 操作脚本命令.

<!--more-->


## grep 命令使用 {#grep-命令使用}

grep（global search regular expression(RE) and print out the line，全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。


### 从单个文件中搜索指定的字串 {#从单个文件中搜索指定的字串}

```shell
grep "this" demo_file
```


### 在多个文件中检索指定的字串 {#在多个文件中检索指定的字串}

```shell
grep "this" demo_*
```


### 用 grep -i 进行大小写无关的搜索 {#用-grep-i-进行大小写无关的搜索}

```shell
grep -i "the" demo_file
```


### 使用用正则表达式 {#使用用正则表达式}

```shell
grep -i "lines.*empty" demo_file
```


### 用 grep -w 搜索整个词，而不是词中的部分字串 {#用-grep-w-搜索整个词-而不是词中的部分字串}

```shell
grep -w "is" demo_file
```


### 使用 grep -A, -B and -C 显示之前、之后、前后的几行 {#使用-grep-a-b-and-c-显示之前-之后-前后的几行}

-   显示匹配行之后的 N 行

<!--listend-->

```shell
grep -A 3 -i "example" demo_text
```

-   显示匹配行之前的 N 行

<!--listend-->

```shell
grep -B 2 "single WORD" demo_text
```

-   显示匹配行前后的 N 行

<!--listend-->

```shell
grep -C 2 "Example" demo_text
```


### 通过 GREP\_OPTIONS 高亮显示搜索的字串 {#通过-grep-options-高亮显示搜索的字串}

```shell
export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'

grep this demo_file
```


### 用 grep -r 递归搜索全部的文件 {#用-grep-r-递归搜索全部的文件}

```shell
grep -r "ramesh" *
```


### 使用 grep -v 进行不匹配 {#使用-grep-v-进行不匹配}

```shell
grep -v "go" demo_text
```


### 显示不匹配全部模式的行 {#显示不匹配全部模式的行}

```shell
grep -v -e "a" -e "b" -e "c" test-file.txt
```


### 用 grep -c 统计匹配的行数 {#用-grep-c-统计匹配的行数}

```shell
grep -c "go" demo_text
grep -v -c this demo_file
```


### 用 grep -l 只显示文件名 {#用-grep-l-只显示文件名}

```shell
grep -l this demo_*
```


### 只显示匹配的字串 {#只显示匹配的字串}

```shell
grep -o "is.*line" demo_file
```


### 显示匹配的位置 {#显示匹配的位置}

```shell
grep -o -b "3" temp-file.txt
```


### 用 grep -n 在输出时显示行号 {#用-grep-n-在输出时显示行号}

```shell
grep -n "go" demo_text
```


## sed {#sed}


## awk {#awk}
