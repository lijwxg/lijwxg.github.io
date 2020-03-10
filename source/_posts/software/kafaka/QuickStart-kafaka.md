---
date: 2018-12-29 19:10:53
tags: kafaka
---

<!-- @import "[TOC]" {cmd="toc" depthFrom=1 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [运行kafka和kafka-manager](#运行kafka和kafka-manager)
  - [Python代码示例](#python代码示例)

<!-- /code_chunk_output -->

<!-- more -->
# 运行kafka和kafka-manager

```shell
tar -xzf kafka_2.11-1.0.1.tgz
cd kafka_2.11-1.0.1
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test    # create a topic
bin/kafka-topics.sh --list --zookeeper localhost:2181                                                         # list topics
bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test                                       # send some messages
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning                 # start a consumer
cd ../kafka-manager-1.3.3.17
nohup bin/kafka-manager -Dconfig.file=conf/application.conf > /dev/null 2>&1 &
```

kafka的配置我这里就提及下重点  关于host.name这个参数

如果我们想远程消费这个KAFKA  一定要把这个定义成能访问的IP   比如我想在内网消费这个KAFKA 就要用内网IP绑定

## Python代码示例

```python
#!/usr/bin/env python
# _*_coding:utf-8_*_
# __author__ = lijwxg@hotmail.com
# __file__ = kafka_test2.py
# __date__ = 2018/3/13
# __time__ = 9:50

from kafka import KafkaProducer
from kafka import KafkaConsumer
from kafka.errors import KafkaError
import json


class Kafka_producer():
    u"""
    使用kafka的生产模块
    """

    def __init__(self, kafkahost, kafkaport, kafkatopic):
        self.kafkaHost = kafkahost
        self.kafkaPort = kafkaport
        self.kafkatopic = kafkatopic
        self.producer = KafkaProducer(bootstrap_servers='{kafka_host}:{kafka_port}'.format(
            kafka_host=self.kafkaHost,
            kafka_port=self.kafkaPort
        ))

    def sendjsondata(self, params):
        try:
            parmas_message = json.dumps(params)
            producer = self.producer
            producer.send(self.kafkatopic, parmas_message.encode('utf-8'))
            producer.flush()                                                    # 此处如果没有,则发送的消息不会提交
        except KafkaError as e:
            print e


class Kafka_consumer():
    u"""
    使用Kafka—python的消费模块
    """

    def __init__(self, kafkahost, kafkaport, kafkatopic, groupid):
        self.kafkaHost = kafkahost
        self.kafkaPort = kafkaport
        self.kafkatopic = kafkatopic
        self.groupid = groupid
        self.consumer = KafkaConsumer(self.kafkatopic, group_id=self.groupid,
                                      bootstrap_servers='{kafka_host}:{kafka_port}'.format(
                                          kafka_host=self.kafkaHost,
                                          kafka_port=self.kafkaPort))

    def consume_data(self):
        try:
            for message in self.consumer:
                # print json.loads(message.value)
                yield message
        except KeyboardInterrupt, e:
            print e


def main():
    u"""
    测试consumer和producer
    :return:
    """
    # 测试生产模块
    producer = Kafka_producer("192.168.60.224", 9092, "test")
    for i in range(10):
        params = '{abetst}:{null}---' + str(i)
        producer.sendjsondata(params)
    # 测试消费模块
    # 消费模块的返回格式为ConsumerRecord(topic=u'ranktest', partition=0, offset=202, timestamp=None,
    # \timestamp_type=None, key=None, value='"{abetst}:{null}---0"', checksum=-1868164195,
    # \serialized_key_size=-1, serialized_value_size=21)
    # consumer = Kafka_consumer('127.0.0.1', 9092, "ranktest", 'test-python-ranktest')
    # message = consumer.consume_data()
    # for i in message:
    #     print i.value


if __name__ == '__main__':
    main()
```
