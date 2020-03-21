#!/bin/bash
# author: lijiawen
# auto deploy file to origin git branch

git add .
if [ -z $1 ] ; then
		msg='提交blog'
else
		msg=$1
fi
git commit -m $msg
git push origin
