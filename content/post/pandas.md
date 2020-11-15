---
title: "常用pandas方法"
date: 2019-10-03T16:26:00+08:00
tags: ["numpy"]
draft: false
---

常用 pandas 处理数据, 有较好的实现方法和效率

<!--more-->


## 常用函数 {#常用函数}

| 函数    | 描述                                                                    |
|-------|-----------------------------------------------------------------------|
| array   | 转换输入数据(列表, 数组或其它序列类型)到一个 ndarray, 可以推断一个 dtype 或明确的设置一个 dtype. 默认拷贝输入数据 |
| asarray | 转化输入为一个 ndarray, 当输入已经是一个 ndarray 时就不拷贝.            |
| arange  | 同内建的 range 函数, 但不返回列表而是一个 ndarray                       |


## 如果是对特定列求和的话 {#如果是对特定列求和的话}

使用 iloc 选择再使用 apply 求和


## 计算各列数据总和并作为新列添加到末尾 {#计算各列数据总和并作为新列添加到末尾}

```python
df['Col_sum'] = df.apply(lambda x: x.sum(), axis=1)
```


## 计算各行数据总和并作为新行添加到末尾 {#计算各行数据总和并作为新行添加到末尾}

```python
df.loc['Row_sum'] = df.apply(lambda x: x.sum())
```


## 对于 pandas 中的 Dataframe,如果需要按照列 A 进行分组，将同一组的列 B 求和,可以通过下述操作完成： {#对于-pandas-中的-dataframe-如果需要按照列-a-进行分组-将同一组的列-b-求和-可以通过下述操作完成}

```python
df = df.groupby(by=['column_A'])['column_B'].sum()
```

生成的数据类型是 Series,如果进一步需要将其转换为 dataframe,可以调用 Series 中的 to\_frame()方法.

```python
df = df.to_frame()
```

可以取出上述 dataframe 中的 index,生成新的一列，并删除原 dataframe 中的 index.

```python
df['column_A'] =df.index
df =df.reset_index(drop= True)
```


## 计算百分比 {#计算百分比}

```python
price.pct_change()
```


## 删除 gender 列，不改变原来的 data 数据，返回删除后的新表 data\_2。axis 为 1 表示删除列，0 表示删除行。inplace 为 True 表示直接对原表修改。 {#删除-gender-列-不改变原来的-data-数据-返回删除后的新表-data-2-axis-为-1-表示删除列-0-表示删除行-inplace-为-true-表示直接对原表修改}

```python
data_2 = data.drop('gender', axis=1, inplace=False)
```


## 改变某一列的位置。如：先删除 gender 列，然后在原表 data 中第 0 列插入被删掉的列 {#改变某一列的位置-如-先删除-gender-列-然后在原表-data-中第-0-列插入被删掉的列}

```python
data.insert(0, '性别', data.pop('gender'))  *pop返回删除的列，插入到第0列，并取新名为'性别'
```
