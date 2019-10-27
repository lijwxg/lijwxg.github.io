---
date: 2018-10-02 22:10:53
tags: python
---
- [PyECharts应用](#PyECharts%E5%BA%94%E7%94%A8)
  - [sanic 返回一个地图的网页](#sanic-%E8%BF%94%E5%9B%9E%E4%B8%80%E4%B8%AA%E5%9C%B0%E5%9B%BE%E7%9A%84%E7%BD%91%E9%A1%B5)

<!-- more -->

# PyECharts应用

## sanic 返回一个地图的网页
```python
from pyecharts import Map

REMOTE_HOST = "https://pyecharts.github.io/assets/js"

province_distribution = {
                            "广东": 0.07324421,
                            "江苏": 0.06981383,
                            "山东": 0.063376718
                        }

province_keys = province_distribution.keys()
province_values = [int(x * 10000) for x in province_distribution.values()]

def map_portrait(request):
    # s3d = scatter3d()

    map = Map("用户分布图", width=1200, height=600)
    map.add(" ", province_keys, province_values, visual_range=[0, 1000], maptype='china', is_visualmap=True,
            visual_text_color='#000', is_map_symbol_show=False, )

    return request.app.template_render(
        "map_data.html",
        myechart=map.render_embed(),
        host=REMOTE_HOST,
        script_list=map.get_js_dependencies(),
    )
```