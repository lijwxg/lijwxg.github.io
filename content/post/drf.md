---
title: drf使用记录
date: 2020-04-06 20:47:26
tags:
  - python
  - django
categories:
  - python
  - django
---

django-restful-framework 基于 django 的一个实现 restfurl 风格接口的框架, 有十分完备的接口设计方案

<!--more-->

## Serializers

1. serializers ModelSerializer 的序列化中 model 在有外键的情况下显示 name 代替显示 id 的几种方式

   - SerializerMethod

     ```python
     class BrandModelNumberSerializer(serializers.ModelSerializer):
     brand = serializers.SerializerMethodField()
     class Meta:
         model = BrandModelNumber
         fields = "__all__"

     def get_brand(self, obj):
         return obj.brand.name

     ```

   - 序列化字段

     ```python
     class BrandModelNumberSerializer(serializers.ModelSerializer):
         brand_name = serializers.ReadOnlyField(source='brand.name')
         # brand = serializers.SlugRelatedField(read_only=True ,slug_field='name') ①
         # brand = serializers.StringRelatedField(label='类别') ②
         class Meta:
             model = BrandModelNumber
             fields = "__all__"
     ```

1. 格式化字段

   - DateTimeField

     ```python
     class CustomSerializer(ModelSerializer):
         update_time = DateTimeField(format='%Y-%m-%d %H:%M:%S', read_only=True)
         create_time = DateTimeField(format='%Y-%m-%d %H:%M:%S', read_only=True)
     ```
