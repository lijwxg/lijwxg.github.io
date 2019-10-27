---
date: 2018-10-02 22:10:53
tags: python
---
- [conda 命令](#conda-%E5%91%BD%E4%BB%A4)
- [使用Jupyter Notebook](#%E4%BD%BF%E7%94%A8Jupyter-Notebook)
- [matplotlib中pyplot的汉字字体显示问题](#matplotlib%E4%B8%ADpyplot%E7%9A%84%E6%B1%89%E5%AD%97%E5%AD%97%E4%BD%93%E6%98%BE%E7%A4%BA%E9%97%AE%E9%A2%98)
- [编译scikit-image错误](#%E7%BC%96%E8%AF%91scikit-image%E9%94%99%E8%AF%AF)
- [dlib安装](#dlib%E5%AE%89%E8%A3%85)
- [pip-module-has-no-attribute-main的错误](#pip-module-has-no-attribute-main%E7%9A%84%E9%94%99%E8%AF%AF)
- [pip损坏](#pip%E6%8D%9F%E5%9D%8F)
- [vrtualenv](#vrtualenv)
- [FAQ: 安装jupyter-notebook](#FAQ-%E5%AE%89%E8%A3%85jupyter-notebook)

<!-- more -->
## conda 命令
```shell
#conda env list
#activate root
#conda install ipykernel
#python -m ipykernel install --user --name siraj-regression --display-name "Python [conda env:siraj-regression]" # 注入jupyter notebook环境
#jupyter notebook
```

## 使用Jupyter Notebook
- 为了使jupyter能够支持anaconda的虚拟环境,需要在Anaconda里安装一个插件
```shell
$ conda install nb_conda
$ nohup jupyter-notebook >/dev/null 2>&1 &
$ job           # 显示后台运行的程序
$ fg            # 将后台运行程序调到前台显示
$ jupyer notebook
$ ssh username@address_of_remote -L127.0.0.1:1234:127.0.0.1:8888
```

- 安装jupyter-notebook并生成配置
```shell
$ pip install jupyter notebook
$ jupyter-notebook --generate-config
$ python -c "import IPython;print IPython.lib.passwd()"     # 生成秘钥

```

- 安装虚拟环境的内核到jupyter-notebook, 在虚拟环境中运行
```shell
$ python -m ipykernel install --user --name myenv --display-name "Python(myevn_)"
```

- 安装jupyter-themer,配置主题
```shell
$ sudo pip install jupyterthemes
$ jt -l
$ jt -t monokai -T -N       # 切换主题为monokai, 显示toolbar和标题
```


多内核的配置存放在./.local/share/jupyter/kernels下

```vim
c.NotebookApp.ip="*"
c.NotebookApp.password=u'sha1:***'
c.NotebookApp.open_browser=False
c.NotebookApp.port=88888
```

## matplotlib中pyplot的汉字字体显示问题
```python
plt.rcParams['font.sans-serif']=['Microsoft YaHei']  #用来正常显示中文标签
plt.rcParams['axes.unicode_minus']=False    #用来正常显示负号
```


```python
import matplotlib
print matplotlib.matplotlib_fname()
```
```shell
$ fc-list :lang=zh      # 查看centos自带的中文字体
$ sudo cp /usr/share/fonts/stix/msyh.ttc /home/lijiawen/.virtualenvs/env_py3/lib/python2.7/site-packages/matplotlib/mpl-data/fonts/ttf
$ vim /home/lijiawen/.virtualenvs/matplotlib_py2/lib/python2.7/site-packages/matplotlib/font_manager.py     # 在大概300行左右修改return{"ttf":{"ttf", "otf"}} 为return{"ttf":{"ttf", "otf", "ttc"}}
$ vim /home/lijiawen/.virtualenvs/matplotlib_py2/lib/python2.7/site-packages/matplotlib/mpl-data/matplotlibrc
删除font.family和font.sans-serif两行前的#，并在font.sans-serif后添加中文字体 Microsoft YaHei(添加在最前面)
$ cd ~/.cache/matplotlib $$ rm -rf *
```
重启jupyter notebook    ## 记得重启jupyter


## 编译scikit-image错误
**Cannot open include file: 'stdint.h'**
- https://github.com/chemeris/msinttypes
- 下载stdint.h和inttpes.h两个库文件
- 
## dlib安装
**cmake, Visual Studio 2015, boost, dlib**
**在Python27中运行pip install dlib装载库dlib所引起的问题解决**
http://blog.csdn.net/worrydog/article/details/53947214


## pip-module-has-no-attribute-main的错误
Pip 10.0.* doesn't support main.

You have to downgrade to pip 9.0.3.

```shell
$ pip install --upgrade pip==9.0.3
```

## pip损坏
重新安装pip
```shell
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ sudo python get-pip.py --force-reinstall
```

## vrtualenv
```shell
$ mkvirtualenv -p python3 jms_py3
```

## FAQ: 安装jupyter-notebook
使用sudo命令,将程序安装在/usr/local/lib/python3.5/dist-packages目录下面
否则都会安装在.local下面