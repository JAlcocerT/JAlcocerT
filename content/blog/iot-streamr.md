---
title: "Streamr - The P2P Pub/Sub Network for IoT"
date: 2025-12-03T09:20:21+01:00
draft: false
tags: ["Web3","IoT","MQTT","Acurast","Shodan"]
description: 'Are decentralized data networks even possible?'
url: 'streamr-network'
---


**Tl;DR**


**Intro**

This year I have been consolidating some IoT/Sensor and MQTT knowledge on few posts:

Then, a friend told me about:

{{< youtube "6hbg_xMPCjs" >}}

<!-- https://www.youtube.com/watch?v=6hbg_xMPCjs -->


## Streamr Project

The Streamr Network: decentralized real‑time data


* https://streamr.network/
    * https://streamr.network/hub/projects
* https://docs.streamr.network/

> The Decentralized Data Network

> > Streamr is a next-gen communication network, featuring serverless data streaming and media broadcasts that scale automatically.

* https://github.com/streamr-dev/network

The decentralized P2P real-time data **pub/sub network**.

Build Web3 projects that leverage the Streamr data crowdsourcing and monetization infrastructure.

Example: https://streamr.network/hub/projects/0xbeb773584fb72bb8fa138844fc4a86a6573a511f11bd22cfae387e9406444690/overview

Streamr Network is a decentralized, open-source peer-to-peer platform for real-time data streaming and broadcasting, using a publish-subscribe (pub-sub) model to handle live data from sources like IoT devices, AI agents, or media without centralized servers.[1][3]

**Core Features**

- **P2P Architecture**: Nodes form overlay networks per data stream (topic), enabling scalable, censorship-resistant messaging with partitioning for high throughput (millions of events/second).[6][1]
- **Blockchain Integration**: Works with Ethereum, Polygon, and Gnosis for identity, payments via DATA token, governance, and node incentives (staking rewards for operators).[4][1]
- **Security & Monetization**: End-to-end encryption, cryptographic signing for data provenance, and direct data sales where producers earn DATA tokens automatically.[3][5]

* https://docs.streamr.network/streamr-network/smart-contracts
* https://docs.streamr.network/guides/become-an-operator/

Streamr Network's primary use cases focus on decentralized real-time data streaming for Web3, IoT, and AI applications, replacing centralized brokers with P2P efficiency.

### Use Cases

- Real-time data pipelines for DePIN, AI models, live CDNs, or IoT.
- Avoids vendor lock-in of centralized brokers like AWS Kinesis.

Anyone can run a node on standard hardware to relay data and earn rewards.

To use the Streamr Network, you need:

- A standard computer or server to run a Streamr node if you want to participate in data relaying and earn rewards; the node connects to the peer-to-peer network.[1]
- A wallet with Streamr’s DATA tokens for payments, staking, and transactions on the network through Ethereum-compatible wallets.[2]
- Developers can integrate via the Streamr SDKs and APIs to publish and subscribe to real-time data streams easily.[2]

- Decentralized real-time data delivery for Internet of Things (IoT) devices.
- Building live data pipelines for AI and machine learning models.
- Real-time event broadcasting for Web3 applications and Decentralized Physical Infrastructure Networks (DePIN).
- Stream monetization by data producers selling data directly to consumers over a trustless network.
- Replacing centralized pub-sub brokers (like AWS Kinesis) with a censorship-resistant, peer-to-peer alternative.[3][1][2]

Yes, several published applications and projects actively use Streamr Network for real-time decentralized data streaming.

**Key Use Cases**

- **IoT Data Streaming**: Connect sensors/devices for live telemetry (e.g., weather stations, smart cities) with end-to-end encryption and direct monetization via DATA tokens.[3]
- **AI/ML Pipelines**: Feed real-time data to decentralized AI models or agents for inference/training, enabling DePIN (Decentralized Physical Infrastructure Networks).[4][1]
- **Live Media/CDNs**: Broadcast events, video streams, or social feeds censorship-resistant, with low-latency global distribution.[2]
- **DeFi & Web3 Apps**: Real-time oracle data for trading bots, NFT drops, or gaming (e.g., live leaderboards).[3]
- **Data Marketplaces**: Producers sell streams directly to consumers (e.g., air quality data, stock feeds) with automated micropayments.[5]

Ideal for high-throughput, trustless scenarios avoiding AWS Kinesis/MQTT centralization; scales to millions of events/second via operator nodes.[1][4]

[1](https://streamr.network)
[2](https://coinmarketcap.com/academy/article/a-deep-dive-into-streamr)
[3](https://beincrypto.com/streamr-decentralised-network-data-sharing/)
[4](https://streamr.network/network)
[5](https://www.gate.com/learn/articles/what-is-streamr-all-you-need-to-know-about-data/2997)

### Notable Examples

* https://streamr.network/hub/projects
* https://streamr.network/hub/streams


Like the Helsinki Trams: https://streamr.network/hub/projects/0xc2ccfe01eed309c54b6dd96b9a7167c5bd940290674219424e1d2bae69479028/overview

![Streamr Live Data that includes lat and long](/blog_img/iot/streamr-live-data.png)

```sh
#npm install -g @streamr/cli-tools
streamr stream subscribe streamr.eth/demos/helsinki-trams
```

With 2 publishers,3 nodes and ~100 msg/s

- **StreamrTV**: A live video streaming platform launched in 2025, leveraging Streamr's P2P network for hyperscalable, decentralized CDN to distribute media efficiently without central servers.[3]
- **DIMO**: Vehicle data platform using Streamr for real-time IoT telemetry from connected cars, integrated on Polygon for DePIN data sharing.[2]
- **RedStone**: Oracle network broadcasting live data feeds via Streamr for DeFi apps, ensuring verifiable real-time metrics.[2]
- **Arkreen**: Environmental IoT project streaming sensor data (e.g., carbon tracking) through Streamr for decentralized analytics.[2]
- **Ruuvi Integration**: Sensor hardware (temperature/humidity) streams data to Streamr for monetized real-world IoT marketplaces.[4]

These demonstrate production use in DePIN, video, and IoT, with more in hackathons and partnerships like Helium for coverage.[5][6]

[1](https://streamr.network)
[2](https://polygon.technology/blog/how-real-time-data-infra-powers-depin-on-polygon-a-guide-by-streamr)
[3](https://depinscan.io/news/2025-07-29/streamrtv-launches-as-streamr-shifts-focus-to-real-world-applications)
[4](https://ruuvi.com/streamr/)
[5](https://streamr.network/ecosystem)
[6](https://depinhub.io/news/streamr-unveils-innovative-projects-at-learn-web3-hackathon-11426)
[7](https://beincrypto.com/streamr-decentralised-network-data-sharing/)
[8](https://www.binance.com/en/square/post/12464334514017)
[9](https://www.youtube.com/watch?v=5qCu7s8iWhw)
[10](https://streamr.network/network)
[11](https://streamr.network/hub/projects)
[12](https://getstream.io/blog/news-feeds-for-real-time-use-cases/)
[13](https://www.youtube.com/c/Streamr)
[14](https://yalantis.com/blog/real-time-data-streaming-use-cases/)
[15](https://coinmarketcap.com/academy/article/a-deep-dive-into-streamr)
[16](https://github.com/minima-global/streamr-minidapp-example)
[17](https://x.com/Streamr)
[18](https://atarca.eu/streamr-acknowledgement-token/)
[19](https://www.instaclustr.com/education/real-time-streaming/real-time-data-streaming-4-use-cases-5-components-and-6-best-practices/)
[20](https://www.youtube.com/watch?v=5PCSZAP1qrc)

#### Streamlit + Streamr

* https://streamr.streamlit.app/
* https://thedataengineerblog.com/build-a-streamr-node-dashboard-with-streamlit-using-python-bbf0b52a29cb
* https://github.com/tonykipkemboi/StreamrDashboard

#### Weather with Streamr

* https://streamr.network/hub/streams/streams.dimo.eth%2Ffirehose%2Fweather/overview

#### Traffic app

* https://mapmetrics.org/

* https://streamr.network/hub/projects/0xd4835eeb6da2c502a2cd3742220e85cd5497088be28fce66ce1f6cb17d7f7c7f/overview

## Comparison with MQTT

Streamr shares similarities [with MQTT](https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt) as both use a publish-subscribe messaging pattern to handle **real-time data streams**, primarily for IoT devices.

However, Streamr distinguishes itself by being fully decentralized, blockchain-integrated for payments and governance, and designed for Web3 data streaming ecosystems.

MQTT is centralized and protocol-focused, whereas Streamr combines P2P networking, economic incentives, and cryptographic security in an open data marketplace.

![MQTT Desktop](blog_img/iot/mqttx-desktop.png)
https://jalcocert.github.io/JAlcocerT/messaging-protocols/#mqtt

In summary, Streamr offers a decentralized, blockchain-backed alternative to MQTT with native support for **token-based data monetization** and broader Web3 use cases.

[1](https://beincrypto.com/streamr-decentralised-network-data-sharing/)
[2](https://streamr.network)
[3](https://coinmarketcap.com/academy/article/a-deep-dive-into-streamr)

**Remember about** the  Pub Sub Network Architecture

It decouples publisher from subscribers.

A publisher can be anyone or anything that provides a message.

* https://github.com/streamr-dev/mqtt-streamr


---

## Conclusions

A friend also mentioned to me about [acurast](https://acurast.com/developers/).

Which is supposed to be a decentralized compute network.

I didnt see any OSS project for it, so...im quite skeptical.

### Running Streamr

* https://streamr.network/data-token
* https://coinmarketcap.com/currencies/streamr/

Recently I tested a BTC node via UmbrelOS, which was a cool data experiment.

Using their container image at dockerhub: https://hub.docker.com/r/streamr/node

```sh
docker run -d --restart always -p 32200:32200 -v ~/.streamrDocker:/home/streamr/.streamr --name streamr streamr/node
```

Yes, the Streamr Network provides official Docker container images for running Streamr nodes. You can find these images on Docker Hub under the "streamr" profile, such as the `streamr/node` and `streamr/broker-node` images which are regularly updated.[1][2][3]

Using the Docker image simplifies setup by allowing you to pull and run the node container quickly on any system with Docker installed. You can also persist configuration and wallet data by mounting a local folder into the container.

This setup is recommended for running a node to participate in the network and earn DATA tokens.[3][6]

Example Docker command to run the streamr node:

```sh
docker run -d --restart always -p 32200:32200 -v ~/.streamrDocker:/home/streamr/.streamr --name streamr streamr/node
```

This makes running a Streamr node accessible on standard hardware without manual installation beyond Docker.[6][3]

**Streamr node rewards (for operators relaying data) are paid in DATA tokens, the network's native ERC-20 utility token on Polygon blockchain.** Operators stake DATA to join Sponsorships and earn proportional rewards based on uptime, bandwidth, and stream demand; delegators also stake DATA to operators for shared revenue.[1][2][3]

**Yes, view live nodes via the Streamr Network Explorer at streamr.network/network-explorer.** It shows active streams, nodes, connections, metrics, and a geo map; search by node address or filter historical data. Your node provides a direct Explorer link post-setup for monitoring.[4][5][6]


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/streamr" title="Streamr | Docker Config 🐋 ↗" >}}
{{< /cards >}}

As a Streamr operator, you provide bandwidth and computing resources to relay real-time data streams across the decentralized peer-to-peer network. Your node forwards data between publishers and subscribers, ensuring reliable, low-latency delivery of live data.

Specifically, operators:

- Host and maintain a Streamr node that connects to the network and manages message routing.
- Relay and forward encrypted data packets within subscribed data streams (topics).
- Provide uptime, availability, and bandwidth capacity required for high-throughput data flow (millions of messages per second).
- Participate in network consensus and governance by staking DATA tokens, which also enables earning rewards proportional to your contribution.
- Support network resilience by decentralization and censorship resistance through distributing data traffic across many nodes.

In return for providing these essential network services, operators earn rewards paid in DATA tokens based on their performance and staked amount.[1][2][3]

[1](https://docs.streamr.network/streamr-network/network-roles/operators)
[2](https://streamr.network/stake-and-earn)
[3](https://beincrypto.com/streamr-decentralised-network-data-sharing/)

---

## FAQ

[Web3](https://jalcocert.github.io/JAlcocerT/guide-web3/) is not the dark web.

But in theory, you could also publish your website there:

<!-- https://www.youtube.com/watch?v=CurcakgurRE -->

<!-- > Put your website on the Dark Web -->

{{< youtube "CurcakgurRE" >}}

I would still keep my regular static deployments to the web:

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/create-your-website/#select-the-deployment-method" title="Web Deployment methods | Docs ↗" >}}
{{< /cards >}}

### Shodan

Shodan is a specialized search engine that allows users to find Internet-connected devices. 

Unlike traditional search engines that index websites and pages, Shodan collects information about network-connected devices such as servers, security cameras, routers, printers, and IoT (Internet of Things) devices.

Shodan is a search engine similar to Google. But while Google searches for websites, Shodan searches for devices that are connected to the internet.

Users can perform a search using the Shodan search engine based on an IP address, device name, city, and/or a variety of other technical categories. 


### HoneyPot

Who knows what this actually does, but it's interesting to know it exists...

* https://github.com/thinkst/opencanary

> MIT | Modular and decentralised honeypot