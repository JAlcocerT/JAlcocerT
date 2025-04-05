---
title: "Whats the right Messaging Protocol for me?"
date: 2025-04-09T05:20:21+01:00
draft: false
tags: ["Dev","Python"]
description: 'MQTT vs RMQ vs Kafka. Great Tools for IoT Projects!'
url: 'messaging-protocols'
---

You might be playing around with your Pi:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-gps-superset/#apache-superset-setup" title="Superset Setup" image="/blog_img/iot/Rpi4_4gb_size.jpg" subtitle="IoT Pi Project with Superset" >}}
{{< /cards >}}

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/demo-realtime-pollution" title="Flask Intro" image="/blog_img/apps/flask-nginx-duckdns.png" subtitle="Deployed with NGINX" >}}
  {{< card link="https://github.com/JAlcocerT/demo-realtime-pollution" title="Taipy Sensor Display" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code on Github" >}}
{{< /cards >}}

As seen here:

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/get-started-with-flask/#flask-and-websockets" title="Flask and WebSockets" >}}
{{< /cards >}}


1. MQTT
2. Kafka
3. RabitMQ


| Feature               | WebSockets                         | MQTT                               | RabbitMQ                           |
|-----------------------|------------------------------------|-------------------------------------|------------------------------------|
| Connection Type       | Permanent, bi-directional          | **Publish/subscribe**                   | Message broker with various patterns|
| Initiation            | Either party can initiate          | Clients subscribe/publish           | Producers send to queues            |
| Connection Duration    | Long-lived until closed            | Long-lived with session persistence | Can be transient or persistent      |
| Use Cases             | Real-time apps (chat, gaming)     | IoT, telemetry, low-bandwidth apps  | Microservices, task queues         |
| Latency               | Low latency                        | Generally low latency               | Higher latency due to routing      |


{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/RPi/posts/rpi-mqtt/" title="I was learning MQTT with a RPI here" icon="user" >}}
{{< /cards >}}

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/microcontrollers-setup-101/" title="MQTT with ESP32 and a Pico W" >}}
  {{< card link="https://github.com/JAlcocerT/RPi/tree/main/Z_MQTT" title="MQTT Source Files" >}}
{{< /cards >}}

* WebSockets are best for real-time communication where low latency is crucial.
* MQTT excels in low-bandwidth environments and is optimized for IoT applications.
* RabbitMQ is suitable for scenarios requiring reliable message delivery and complex routing logic.

There is also Web RTC (Real Time Communication).

### MQTT

**MQTT** (Message Queuing Telemetry Transport) is a lightweight, open-source messaging protocol designed for efficient communication in situations where network bandwidth and power are limited. 

MQTT (Message Queuing Telemetry Transport):
        MQTT is a lightweight, publish-subscribe messaging protocol designed for constrained devices and low-bandwidth, high-latency or unreliable networks.
        It provides a flexible and efficient mechanism for asynchronous, real-time communication between clients and servers.
        MQTT is commonly used in IoT (Internet of Things) applications, telemetry systems, and messaging applications where real-time data streams need to be transmitted reliably and efficiently.
        While MQTT can be used for real-time communication in various scenarios, it may not be as widely supported or as easy to integrate as REST APIs or WebSockets in certain contexts.    


It's primarily used in IoT (Internet of Things) systems, where devices communicate over unreliable or low-bandwidth networks.

MQTT works on a **publish-subscribe** model, where devices can **publish** messages to a **topic** and **subscribe** to topics to receive messages. 

This decouples the sender from the receiver, making it ideal for scenarios where multiple devices need to communicate without needing direct knowledge of each other.


{{% details title="More about - MQTT 🌍" closed="true" %}}

The key benefits of MQTT include:
- **Low bandwidth usage**: It sends small payloads over the network, minimizing the amount of data transmitted.
- **Reliability**: MQTT offers three levels of Quality of Service (QoS) for message delivery to suit different reliability needs.
- **Asynchronous communication**: Devices can operate asynchronously, sending or receiving messages without waiting for responses, which reduces latency.


MQTT is widely used in industries such as smart homes, industrial automation, and transportation. Some common applications include temperature sensors, smart appliances, and real-time notifications from connected devices.

{{% /details %}}



{{< callout type="info" >}}
MQTT works as PUB/SUB - See a sample project with a Pi https://jalcocert.github.io/RPi/posts/rpi-mqtt/  💻 
{{< /callout >}}

#### MQTT Use Case

**Monitor a Car Battery Remotely using ESP8266**

https://www.youtube.com/watch?v=VnGRFwDrLHo


### RabbitMQ

**RabbitMQ** is an open-source message broker that facilitates communication between applications, services, or microservices in a distributed system.

It supports multiple messaging protocols, including **AMQP** (Advanced Message Queuing Protocol), which is the default protocol used by RabbitMQ for managing and routing messages.

RabbitMQ operates on a **queue-based model**, where messages are placed in queues by producers and consumed by consumers.

It ensures reliable delivery and helps decouple systems, allowing for asynchronous and scalable communication between different components.


{{% details title="More about - RabbitMQ 🌍" closed="true" %}}

The main features of RabbitMQ include:
- **Message Queuing**: It acts as an intermediary that stores messages until they can be processed by consumers.
- **High Availability**: RabbitMQ can be configured for high availability, ensuring that messages are not lost in case of server failure.
- **Routing**: RabbitMQ offers powerful routing capabilities, including direct, fanout, topic, and header exchanges, allowing messages to be routed to the right consumers efficiently.
- **Scalability**: It can handle large amounts of messages and scale horizontally by adding more servers to form a cluste

RabbitMQ is commonly used in systems that require guaranteed message delivery, such as e-commerce websites, financial services, and supply chain management systems.

It can manage complex workflows, ensure data consistency, and improve system reliability.

{{% /details %}}

{{< callout type="info" >}}
**RabbitMQ Hint**: Use "exchanges" to efficiently route messages based on routing rules. For example, a "topic exchange" allows routing messages based on patterns, ideal for complex message filtering.
{{< /callout >}}


#### Tools for MQTT

1.  ThingBoards https://github.com/thingsboard/thingsboard

```yml
version: '3.0'
services:
  mytb:
    restart: always
    image: "thingsboard/tb-postgres"
    ports:
      - "8080:9090"
      - "1889:1883"
      - "7070:7070"
      - "5683-5688:5683-5688/udp"
    environment:
      TB_QUEUE_TYPE: in-memory
    volumes:
      - /home/Docker/thingsboard/data:/data
      - /home/Docker/thingsboard/var:/var/log/thingsboard
```

2. MQTTX

```sh
flatpak install flathub com.emqx.MQTTX
```
![alt text](blog_img/iot/mqttx-desktop.png)

3. MQTT Explorer

4. MQTT with Python: https://www.emqx.com/en/blog/how-to-use-mqtt-in-python

### Apache Kafka

**Apache Kafka** is a distributed event streaming platform that is used for building real-time data pipelines and streaming applications.

Kafka is designed to handle large volumes of high-throughput, fault-tolerant, and distributed data streams in a reliable and scalable manner.

{{< callout type="info" >}}
You might have heard about Kafka coupled with [PySpark](https://jalcocert.github.io/JAlcocerT/guide-python-PySpark/)!
{{< /callout >}}

Kafka works on a **publish-subscribe** model, where producers write data (events) to topics, and consumers read from those topics.

Kafka stores streams of records in **topics** and allows real-time processing of these records. 

It is particularly known for its ability to handle massive amounts of data with low latency.


{{% details title="More about - Kafka 🌍" closed="true" %}}

Key features of Kafka include:
- **High Throughput**: Kafka can handle millions of messages per second, making it ideal for real-time data processing at scale.
- **Durability**: Kafka persists all messages to disk and replicates them across multiple brokers, ensuring data is not lost even in case of server failures.
- **Scalability**: Kafka clusters can be scaled horizontally by adding more brokers to handle increased load.
- **Fault Tolerance**: Kafka ensures data reliability by replicating data across multiple brokers and enabling automatic failover.


Kafka is widely used in systems that require real-time data processing, such as event logging, monitoring, data integration, and real-time analytics. It's often employed in applications like fraud detection, user activity tracking, and real-time event processing.

{{% /details %}}

{{< callout type="info" >}}
When designing a Kafka-based system, consider partitioning your topics for parallel processing and increased throughput. Properly choosing the number of partitions can significantly affect performance and scalability.
{{< /callout >}}


---

## Conclusions

### Outro

If you want to get into electronics, see these:

1. Arduino IDE
2. LibrePCB

### Redis as a message broker

Redis can be used as a message broker, and in the context of publish/subscribe (Pub/Sub) functionality, it shares similarities with message brokers like MQTT and RabbitMQ. 

{{< cards cols="1" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/web-apps-with-flask/#real-time-data-with-flask" title="Flask SSE and Redis for RT Data" >}}
{{< /cards >}}

**Redis as a Message Broker:**

* **Pub/Sub Mechanism:** Redis has built-in Pub/Sub capabilities. Clients can subscribe to channels, and when a message is published to a channel, all subscribed clients receive it. This allows for a decoupled communication model where publishers don't need to know about specific subscribers.

* **Data Structures for Queuing:** Besides Pub/Sub, Redis's list data structure can also be used to implement basic message queues. Producers can `LPUSH` (left push) messages onto a list, and consumers can `BRPOP` (blocking right pop) to retrieve and process messages. Redis Streams, introduced later, offer more advanced features for message streaming, including persistence, consumer groups, and acknowledgments.

* **Simplicity and Performance:** Redis is known for its speed and simplicity. Its in-memory nature allows for very low latency message delivery. Setting up and using Redis for basic messaging is generally straightforward.

* **"At-Most-Once" Delivery (for basic Pub/Sub):** By default, Redis Pub/Sub offers "at-most-once" delivery semantics. This means that if a subscriber is disconnected when a message is published, it will not receive that message upon reconnection. There's no built-in mechanism for message persistence or guaranteed delivery in the basic Pub/Sub. Redis Streams offer more reliable delivery options.

**MQTT (Message Queuing Telemetry Transport):**

* **Specifically Designed for Messaging:** MQTT is a lightweight messaging protocol specifically designed for constrained devices and low-bandwidth, unreliable networks, often used in IoT (Internet of Things) scenarios.

**RabbitMQ:**

* **Full-Featured Message Broker:** RabbitMQ is a robust and feature-rich message broker that supports multiple messaging protocols (including AMQP, MQTT, STOMP).

**In the context of a Flask SSE application:**

Redis can be a good choice as a message broker to decouple your event producers from your Flask SSE endpoint, especially if you have multiple sources of real-time data or if you anticipate scaling your application.

You would typically use Redis's Pub/Sub or Streams to distribute events to your Flask application, which then formats them as SSE events and sends them to connected browsers.

While Redis offers messaging capabilities, it's not a direct replacement for all use cases of MQTT or RabbitMQ, especially those requiring strong delivery guarantees, complex routing, or protocol-specific features.

The best choice depends on the specific requirements and complexity of your application.

For simpler real-time updates and scenarios where some message loss is acceptable (or handled at the application level), Redis can be a performant and easy-to-manage option.