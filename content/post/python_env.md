---
title: "Python环境"
date: 2018-10-02 22:10:53
tags:
  - python
---

python 入门基础的环境配置, 多种虚拟环境实现方法的选择

<!--more-->

## conda 命令

```shell
#conda env list
#activate root
#conda install ipykernel
#python -m ipykernel install --user --name siraj-regression --display-name "Python [conda env:siraj-regression]" # 注入jupyter notebook环境
#jupyter notebook
```

## 使用 Jupyter Notebook

- 为了使 jupyter 能够支持 anaconda 的虚拟环境,需要在 Anaconda 里安装一个插件

```shell
$ conda install nb_conda
$ nohup jupyter-notebook >/dev/null 2>&1 &
$ job           # 显示后台运行的程序
$ fg            # 将后台运行程序调到前台显示
$ jupyer notebook
$ ssh username@address_of_remote -L127.0.0.1:1234:127.0.0.1:8888
```

- 安装 jupyter-notebook 并生成配置

```shell
$ pip install jupyter notebook
$ jupyter-notebook --generate-config
$ python -c "import IPython;print IPython.lib.passwd()"     # 生成秘钥

```

- 安装虚拟环境的内核到 jupyter-notebook, 在虚拟环境中运行

```shell
$ python -m ipykernel install --user --name myenv --display-name "Python(myevn_)"
```

- 安装 jupyter-themer,配置主题

```shell
$ sudo pip install jupyterthemes
$ jt -l
$ jt -t monokai -T -N       # 切换主题为monokai, 显示toolbar和标题
```

多内核的配置存放在./.local/share/jupyter/kernels 下

```vim
c.NotebookApp.ip="*"
c.NotebookApp.password=u'sha1:***'
c.NotebookApp.open_browser=False
c.NotebookApp.port=88888
```

## matplotlib 中 pyplot 的汉字字体显示问题

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

重启 jupyter notebook ## 记得重启 jupyter

## 编译 scikit-image 错误

**Cannot open include file: 'stdint.h'**

- https://github.com/chemeris/msinttypes
- 下载 stdint.h 和 inttpes.h 两个库文件
-

## dlib 安装

**cmake, Visual Studio 2015, boost, dlib**
**在 Python27 中运行 pip install dlib 装载库 dlib 所引起的问题解决**
http://blog.csdn.net/worrydog/article/details/53947214

## pip-module-has-no-attribute-main 的错误

Pip 10.0.\* doesn't support main.

You have to downgrade to pip 9.0.3.

```shell
$ pip install --upgrade pip==9.0.3
```

## pip 损坏

重新安装 pip

```shell
$ curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$ sudo python get-pip.py --force-reinstall
```

## vrtualenv

```shell
$ mkvirtualenv -p python3 jms_py3
```

## FAQ: 安装 jupyter-notebook

使用 sudo 命令,将程序安装在/usr/local/lib/python3.5/dist-packages 目录下面
否则都会安装在.local 下面
