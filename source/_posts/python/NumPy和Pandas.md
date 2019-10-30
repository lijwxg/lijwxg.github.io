---
date: 2019-10-03 22:10:53
tags: python
---

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [Pandas](#pandas)
  - [如果是对特定列求和的话](#如果是对特定列求和的话)
  - [计算各列数据总和并作为新列添加到末尾](#计算各列数据总和并作为新列添加到末尾)
  - [计算各行数据总和并作为新行添加到末尾](#计算各行数据总和并作为新行添加到末尾)
  - [对于pandas中的Dataframe,如果需要按照列A进行分组，将同一组的列B求和,可以通过下述操作完成：](#对于pandas中的dataframe如果需要按照列a进行分组将同一组的列b求和可以通过下述操作完成)
  - [计算百分比](#计算百分比)
  - [删除gender列，不改变原来的data数据，返回删除后的新表data_2。axis为1表示删除列，0表示删除行。inplace为True表示直接对原表修改。](#删除gender列不改变原来的data数据返回删除后的新表data_2axis为1表示删除列0表示删除行inplace为true表示直接对原表修改)
  - [改变某一列的位置。如：先删除gender列，然后在原表data中第0列插入被删掉的列](#改变某一列的位置如先删除gender列然后在原表data中第0列插入被删掉的列)

<!-- /code_chunk_output -->

<!-- more -->

函数 | 描述 
-|-
array | 转换输入数据(列表, 数组或其它序列类型)到一个ndarray, 可以推断一个dtype或明确的设置一个dtype. 默认拷贝输入数据
asarray | 转化输入为一个ndarray, 当输入已经是一个ndarray时就不拷贝.
arange | 同内建的range函数, 但不返回列表而是一个ndarray


# Pandas

## 如果是对特定列求和的话
使用iloc选择再使用apply求和

## 计算各列数据总和并作为新列添加到末尾
```python
df['Col_sum'] = df.apply(lambda x: x.sum(), axis=1)
```

## 计算各行数据总和并作为新行添加到末尾
```python
df.loc['Row_sum'] = df.apply(lambda x: x.sum())
```

## 对于pandas中的Dataframe,如果需要按照列A进行分组，将同一组的列B求和,可以通过下述操作完成：
```python
df = df.groupby(by=['column_A'])['column_B'].sum()
```
生成的数据类型是Series,如果进一步需要将其转换为dataframe,可以调用Series中的to_frame()方法.
```python
df = df.to_frame()
```
可以取出上述dataframe中的index,生成新的一列，并删除原dataframe中的index.
```python
df['column_A'] =df.index
df =df.reset_index(drop= True)
```

## 计算百分比
```python
price.pct_change()
```

## 删除gender列，不改变原来的data数据，返回删除后的新表data_2。axis为1表示删除列，0表示删除行。inplace为True表示直接对原表修改。
```python
data_2 = data.drop('gender', axis=1, inplace=False)
```

## 改变某一列的位置。如：先删除gender列，然后在原表data中第0列插入被删掉的列
```python
data.insert(0, '性别', data.pop('gender'))  #pop返回删除的列，插入到第0列，并取新名为'性别'
```



