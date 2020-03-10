# django-restful-framework

## Serializers

1. serializers ModelSerializer的序列化中model在有外键的情况下显示name代替显示id的几种方式
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

## Routers
