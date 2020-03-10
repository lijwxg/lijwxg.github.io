# 包管理相关

## pip

> 对第三方库进行管理

## virtualenv

> 虚拟环境管理

## FAQ

1. mysqlclient安装问题

    - macOS
        - error: command 'clang' failed with exit status 1
        - 处理

        ```shell
        export LDFLAGS="-L/usr/local/opt/openssl/lib"
        export CPPFLAGS="-I/usr/local/opt/openssl/include"
        ```

    - windows
        - error: vc++2015编译问题
        - 处理: 去[python非官方包](https://www.lfd.uci.edu/~gohlke/pythonlibs/)网站下载编译好的包直接安装

        ```shell
        python setup.py install
        ```

1. pip安装报错

    ```log
    pip is configured with locations that require TLS/SSL, however the ssl module in Python is not available
    ```

    在python命令行中导入ssl包

    ```log
    ImportError: dlopen(/usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/lib/python3.7/lib-dynload/_ssl.cpython-37m-darwin.so, 2): 
    Library not loaded: /usr/local/opt/openssl/lib/libssl.1.0.0.dylib
    Referenced from: /usr/local/Cellar/python/3.7.4/Frameworks/Python.framework/Versions/3.7/lib/python3.7/lib-dynload/_ssl.cpython-37m-darwin.so
    Reason: image not found
    ```

    发现是openssl的路径中libssl.1.0.0.dylib在安装其它环境的时候升级了  
    使用命令切换

    ```shell
    brew switch openssl 1.0.2s
    ```
