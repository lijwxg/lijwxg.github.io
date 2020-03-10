# Lua

> 解释性语言, 与C#,C++等语言结合紧密

## 安装

```shell
brew install lua
```

## 包管理

> luarocks

```shell
brew instll luarocks
```

luarocks 默认是为lua5.3管理包软件, 但是也支持多个版本的lua程序, 可以指定lua-dir

```shell
luarocks --lua-dir=/usr/local/opt/lua@5.1 install say
```
