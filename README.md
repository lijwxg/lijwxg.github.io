# lijwxg.github.io

## 这是hexo的编辑的源文件, 忽略了.deploy 和node_moudules两个文件夹, 用作编辑内容的版本管理

## 备份源文件

- _config.yml：站点的配置文件，需要备份；
- themes：主题文件夹，需要备份；
- source：博客文章的 .md 文件，需要备份；
- scaffolds：文章的模板，需要备份；
- package.json：安装包的名称，需要备份；
- .gitignore：限定在 push 时哪些文件可以忽略，需要备份；
- .git：主题和站点都有，标志这是一个 git 项目，不需要备份；
- node_modules：是安装包的目录，在执行 npm install 的时候会重新生成，不需要备份；
- public：是 hexo g 生成的静态网页，不需要备份；
- .deploy_git：同上，hexo g 也会生成，不需要备份；
- db.json：文件，不需要备份。

```gitignore
node_modules/
.deploy*/
public/
db.json
```

```shell
$ git checkout -b hexo
$ git push origin hexo
```

## 恢复项目

在新的设备上恢复项目

1. 准备环境

```shell
$ brew install node
$ npm install -g cnpm --registry=https://registry.npm.taobao.org
$ cnpm install -g hexo
$ cnpm install -g hexo-deployer-git
```

2. 下载原始文件, 并在项目下安装node环境
   
```shell
$ cd
$ mkdir Hexo
$ git clone https://github.com/lijwxg/lijwxg.github.io.git
$ cd lijwxg.github.io
$ cnpm install
```

3. 重新发布页面
   
```shell
$ hexo cl g -d
```
