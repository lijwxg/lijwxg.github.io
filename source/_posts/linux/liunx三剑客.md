
<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [linux三剑客](#linux三剑客)
  - [grep命令使用](#grep命令使用)
    - [从单个文件中搜索指定的字串](#从单个文件中搜索指定的字串)
    - [在多个文件中检索指定的字串](#在多个文件中检索指定的字串)
    - [用 grep -i 进行大小写无关的搜索](#用-grep-i-进行大小写无关的搜索)
    - [使用用正则表达式](#使用用正则表达式)
    - [用grep -w搜索整个词，而不是词中的部分字串](#用grep-w搜索整个词而不是词中的部分字串)
    - [使用grep -A, -B and -C显示之前、之后、前后的几行](#使用grep-a-b-and-c显示之前-之后-前后的几行)
    - [通过GREP_OPTIONS高亮显示搜索的字串](#通过grep_options高亮显示搜索的字串)
    - [用grep -r递归搜索全部的文件](#用grep-r递归搜索全部的文件)
    - [使用grep -v进行不匹配](#使用grep-v进行不匹配)
    - [显示不匹配全部模式的行](#显示不匹配全部模式的行)
    - [用grep -c 统计匹配的行数](#用grep-c-统计匹配的行数)
    - [用grep -l 只显示文件名](#用grep-l-只显示文件名)
    - [只显示匹配的字串](#只显示匹配的字串)
    - [显示匹配的位置](#显示匹配的位置)
    - [用 grep -n 在输出时显示行号](#用-grep-n-在输出时显示行号)
  - [sed](#sed)
  - [awk](#awk)

<!-- /code_chunk_output -->
<!-- more -->
# linux三剑客

## grep命令使用
grep（global search regular expression(RE) and print out the line，全面搜索正则表达式并把行打印出来）是一种强大的文本搜索工具，它能使用正则表达式搜索文本，并把匹配的行打印出来。

### 从单个文件中搜索指定的字串
```shell
$ grep "this" demo_file
```

###  在多个文件中检索指定的字串
```shell
$ grep "this" demo_*
```

### 用 grep -i 进行大小写无关的搜索
```shell
$ grep -i "the" demo_file
```

###  使用用正则表达式
```shell
$ grep -i "lines.*empty" demo_file
```

### 用grep -w搜索整个词，而不是词中的部分字串
```shell
$ grep -w "is" demo_file
```

### 使用grep -A, -B and -C显示之前、之后、前后的几行
- 显示匹配行之后的N行
```shell
$ grep -A 3 -i "example" demo_text
```

- 显示匹配行之前的N行
```shell
$ grep -B 2 "single WORD" demo_text
```

- 显示匹配行前后的N行
```shell
$ grep -C 2 "Example" demo_text
```
### 通过GREP_OPTIONS高亮显示搜索的字串
```shell
$ export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'

$ grep this demo_file
```

### 用grep -r递归搜索全部的文件
```shell
$ grep -r "ramesh" *
```

### 使用grep -v进行不匹配
```shell
$ grep -v "go" demo_text
```
### 显示不匹配全部模式的行
```shell
grep -v -e "a" -e "b" -e "c" test-file.txt
```

### 用grep -c 统计匹配的行数
```shell
$ grep -c "go" demo_text
$ grep -v -c this demo_file
```

### 用grep -l 只显示文件名
```shell
$ grep -l this demo_*
```

### 只显示匹配的字串
```shell
$ grep -o "is.*line" demo_file
```

### 显示匹配的位置
```shell
$ grep -o -b "3" temp-file.txt
```

### 用 grep -n 在输出时显示行号
```shell
$ grep -n "go" demo_text
```

## sed

## awk