---
date: 2019-10-03 22:10:53
tags: python
---
- [Pandas](#Pandas)
  - [如果是对特定列求和的话](#%E5%A6%82%E6%9E%9C%E6%98%AF%E5%AF%B9%E7%89%B9%E5%AE%9A%E5%88%97%E6%B1%82%E5%92%8C%E7%9A%84%E8%AF%9D)
  - [计算各列数据总和并作为新列添加到末尾](#%E8%AE%A1%E7%AE%97%E5%90%84%E5%88%97%E6%95%B0%E6%8D%AE%E6%80%BB%E5%92%8C%E5%B9%B6%E4%BD%9C%E4%B8%BA%E6%96%B0%E5%88%97%E6%B7%BB%E5%8A%A0%E5%88%B0%E6%9C%AB%E5%B0%BE)
  - [计算各行数据总和并作为新行添加到末尾](#%E8%AE%A1%E7%AE%97%E5%90%84%E8%A1%8C%E6%95%B0%E6%8D%AE%E6%80%BB%E5%92%8C%E5%B9%B6%E4%BD%9C%E4%B8%BA%E6%96%B0%E8%A1%8C%E6%B7%BB%E5%8A%A0%E5%88%B0%E6%9C%AB%E5%B0%BE)
  - [对于pandas中的Dataframe,如果需要按照列A进行分组，将同一组的列B求和,可以通过下述操作完成：](#%E5%AF%B9%E4%BA%8Epandas%E4%B8%AD%E7%9A%84Dataframe%E5%A6%82%E6%9E%9C%E9%9C%80%E8%A6%81%E6%8C%89%E7%85%A7%E5%88%97A%E8%BF%9B%E8%A1%8C%E5%88%86%E7%BB%84%E5%B0%86%E5%90%8C%E4%B8%80%E7%BB%84%E7%9A%84%E5%88%97B%E6%B1%82%E5%92%8C%E5%8F%AF%E4%BB%A5%E9%80%9A%E8%BF%87%E4%B8%8B%E8%BF%B0%E6%93%8D%E4%BD%9C%E5%AE%8C%E6%88%90)
  - [计算百分比](#%E8%AE%A1%E7%AE%97%E7%99%BE%E5%88%86%E6%AF%94)
  - [删除gender列，不改变原来的data数据，返回删除后的新表data_2。axis为1表示删除列，0表示删除行。inplace为True表示直接对原表修改。](#%E5%88%A0%E9%99%A4gender%E5%88%97%E4%B8%8D%E6%94%B9%E5%8F%98%E5%8E%9F%E6%9D%A5%E7%9A%84data%E6%95%B0%E6%8D%AE%E8%BF%94%E5%9B%9E%E5%88%A0%E9%99%A4%E5%90%8E%E7%9A%84%E6%96%B0%E8%A1%A8data2axis%E4%B8%BA1%E8%A1%A8%E7%A4%BA%E5%88%A0%E9%99%A4%E5%88%970%E8%A1%A8%E7%A4%BA%E5%88%A0%E9%99%A4%E8%A1%8Cinplace%E4%B8%BATrue%E8%A1%A8%E7%A4%BA%E7%9B%B4%E6%8E%A5%E5%AF%B9%E5%8E%9F%E8%A1%A8%E4%BF%AE%E6%94%B9)
  - [改变某一列的位置。如：先删除gender列，然后在原表data中第0列插入被删掉的列](#%E6%94%B9%E5%8F%98%E6%9F%90%E4%B8%80%E5%88%97%E7%9A%84%E4%BD%8D%E7%BD%AE%E5%A6%82%E5%85%88%E5%88%A0%E9%99%A4gender%E5%88%97%E7%84%B6%E5%90%8E%E5%9C%A8%E5%8E%9F%E8%A1%A8data%E4%B8%AD%E7%AC%AC0%E5%88%97%E6%8F%92%E5%85%A5%E8%A2%AB%E5%88%A0%E6%8E%89%E7%9A%84%E5%88%97)

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



