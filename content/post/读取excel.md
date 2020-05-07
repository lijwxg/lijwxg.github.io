---
title: python处理excel文件
date: 2017-06-1 12:10:53
tags:
  - tool
  - excel
---

python 有可以使用 xlrd, xlwt 两个库实现对应 excel 文件的读写.

<!--more-->

## 读取 sheet

```python
import xlrd

workbook = xlrd.open_workbook('demo.xlxs')

worksheets = workboos.sheet_names()
for sheet in worksheets:
    worksheet = workbook.sheet_by_name(sheet)
    header_excel = worksheet.row_values(0)
```

## 读取时间格式的值, 转化为字符串

```python
import xlrd
from xlrd import xldate_as_tuple
import datetime

book = xlrd.open_workbook('demo.xls')
sheet = book.sheet_by_name('Sheet1')
for row in range(sheet.nrows):
    for col in range(sheet.ncols):
        value = sheet.cell(row,col).value
        # 经过测试此处不是3, 是2
        if sheet.cell(row,col).ctype == 2:
            date = xldate_as_tuple(sheet.cell(row,col).value,0)
            value = datetime.datetime(*date).strftime("%Y-%m-%d")
        print(value)
```
