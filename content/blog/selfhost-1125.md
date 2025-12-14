---
title: "SelfHosting done Easy with UmbrelOS - Nov 2025"
date: 2025-11-14T01:20:21+01:00
draft: false
tags: ["Analytics with onchain data sample","Adventures x GPX","HomeLab Setup"]
description: 'Using OS on the browser. Measuring the More, better, new online performance.'
url: 'selfhosted-apps-nov-2025'
---

**TL;DR**

Getting started with a HomeLab/Selfhosting can be easy, actually.

With tools like UmbrelOS.

+++ [On Chain](#on-chain) data sample

**Intro**

It should not be strange for us to see how we can run OS inside a container.

* https://github.com/awesome-selfhosted/awesome-selfhosted
* https://github.com/awesome-foss/awesome-sysadmin

This is the case of umbrelOS - We will see how to use it for [quick selfhosted adventures](#selfhosted-adventures)

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umbrel" title="Selfhosted UmbrelOS - Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/puter" title="Selfhosted puter - Docker Config 🐋 ↗" >}}
{{< /cards >}}

And also https://github.com/heyPuter/puter/

> agpl 3 |  🌐 The Internet Computer! Free, Open-Source, and Self-Hostable. 

> > A privacy-first personal cloud to keep all your files, apps, and games in one secure place, accessible from anywhere at any time.

Any of these can be a good companion for a tablet when you are [travelling somewhere](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/).

### Selfhosted Adventures

I tried recently umbrelOS (the latest1.4), but inside a container:

![UmbrelOS UI](/blog_img/selfh/umbrel-os/umbrel-signup.png)

Once you login, you are presented with a friendly panel to install apps:

![Umbrel OS Apps with one click install](/blog_img/selfh/umbrel-os/umbrel-apps.png)

And one of the many apps that you can use out of the box is **Wanderer**: *A great addition for anyone who likes adventures and [GPX files](https://raw.githubusercontent.com/JAlcocerT/Py_RouteTracker/refs/heads/main/Data_My_Routes/PL-SK-HU.gpx)*

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/wanderer" title="Selfhosted Wanderer - Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/umbrelos" title="UmbrelOS - Docker Config 🐋 ↗" >}}
{{< /cards >}}

You can go to `192.168.1.2:86` and enjoy very quick webapp hosting

![Wanderer supports creating routes and GPX](/blog_img/selfh/umbrel-os/wanderer-gpx.png)

Which is great, because it syncs with Strava and Komoot:

![Wanderer vs strava/komoot](/blog_img/selfh/umbrel-os/wanderer-integrations.png)

Just in case you are concerned about them locking your account at some point and loosing your tracks!

Talking about locking things, you can also use umbrelOS to do some cool BigData Analytics with on-chain data.


```sh
ssh jalcocert@192.168.1.2
#docker stats docker bitcoin_app_1 
docker exec bitcoin_app_1 bitcoin-cli getblockchaininfo
{
  "chain": "main",
  "blocks": 923582,
  "headers": 923582,
  "bestblockhash": "000000000000000000019a6a3674c093c343acca276f8ddba14cd87476b32a29",
  "bits": "1701d936",
  "target": "00000000000000000001d9360000000000000000000000000000000000000000",
  "difficulty": 152271405447597.4,
  "time": 1763122451,
  "mediantime": 1763118885,
  "verificationprogress": 1,
  "initialblockdownload": false,
  "chainwork": "0000000000000000000000000000000000000000f4f0f29bd8b0eccefc9479e9",
  "size_on_disk": 796890091926, #you can also sync this and measure your average internet speed for ~800gb
  "pruned": false,
  "warnings": [
  ]
}
```

More on this, [later](#big-data-analytics-with-on-chain-data).

> Yes, this is an D&A Adventure that I could not avoid mentioning :)

---

## Conclusions

I got to know the trade free concept: https://trom.tf/

> They offer some tools, like internet speed check and ask nothing in return.

If you are having a business, getting contact forms / feedback /qna from clients is essential:

* https://github.com/OpnForm/OpnForm

> Beautiful Open-Source Form Builder

{{< cards cols="2" >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/entrepreneur/#formbricks" title="Entrepreneur | Docs ↗" >}}
{{< /cards >}}

A static site generator...that can be used to create documentation with Python?

Thats seems to be **Zensical**!

* https://github.com/zensical/zensical
  * https://zensical.org/docs/setup/search/

>  MIT | A modern **static site generator** by the creators of [Material for MkDocs](https://github.com/squidfunk/mkdocs-material) 

```sh
uv add zensical
uv run zensical new .
#sudo docker stop portainer_app
uv run zensical serve
```

Their official page design is just amazing: https://zensical.org/

> Zensical creates scalable Open Source systems for technical writing that always keep you in the flow

I Also discovered **NetVisor**:

* https://github.com/mayanayza/netvisor - *Automatically discover and visually document network infrastructure*

NetVisor scans your network, identifies hosts and services, and generates an interactive visualization showing how everything connects, letting you easily create and maintain network documentation.

> AGPl3 | Automatically discover and visually document network infrastructure.

I also got to know **TOON**: which compress JSON impressively for LLMs to ingest it.

<!-- https://x.com/DataChaz/status/1989056499017216133 -->

{{< tweet user="DataChaz" id="1989056499017216133" >}}

And hey, [Gemini 3 was released](https://blog.google/products/gemini/gemini-3/#responsible-development), but you can still use [goose](https://docs.ollama.com/integrations/goose) and/or **Ollama Desktop**


Even...LLMs at ...webbrowsers? https://github.com/addyosmani/chatty/

> MIT |  ChattyUI - your private AI chat for running LLMs in the browser 

### GPX is great

And if you are afraid to get lost in the forest [during your adventures](https://jalcocert.github.io/JAlcocerT/tech-for-a-trip/), you can share your location from your phone to your selfhosted server.

* https://github.com/dedicatedcode/reitti
  * https://www.dedicatedcode.com/projects/reitti/integrations/mobile-apps/
    * https://f-droid.org/de/packages/com.mendhak.gpslogger/

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/reitti/" title="Reitti | Docker Config 🐋 ↗" >}}
{{< /cards >}}

![Reitti UI](/blog_img/Monitoring/reitti-location-monitoring.png)

> Reitti is a comprehensive **personal location tracking** and analysis application that helps you understand your movement patterns and significant places. The name "Reitti" comes from Finnish, meaning "route" or "path".

Reitti also allow to import our previous GPX, like Wanderer do.


### Thoughts on SteamOS and OS for NAS

Earlier this year I was covering [OS for NAS](https://jalcocert.github.io/JAlcocerT/os-for-nas/).

It seems that we will be able to play, daily drive and have a homeserver all withing a steam pc/console

Apparently, that OS is Linux arch based btw.

So you can harness all the power of containers, and avoid getting locked in into in theory confortable synology ecosystem.

Here is the release of SteamOS: https://store.steampowered.com/steamos/ -> https://help.steampowered.com/en/faqs/view/65B4-2AA3-5F37-4227

![download steam os](/blog_img/outro/steamos.png)

You will save a file like `steamdeck-repair-20250521.10-3.7.7.img.bz2` of about ~3gb size.

```sh
time bzip2 -d steamdeck-repair-20250521.10-3.7.7.img.bz2 ~2/3min
```

I proceeded like I do for [testing any distro](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-sept-2025/#which-linux-to-get-started), spinning it via [Gnome Boxes as a VM](https://jalcocert.github.io/JAlcocerT/testing-nix-os/)

And they have launched a small console, that reminds me to the shape/form factor of my x300 (SFF).

The price tag is unknown though for now.

But what's interesting is the Linux is been more and more user friendly.

With [ZorinOS 18](https://zorin.com/os/download/) we can even get microsoft one drive synced natively and avoid all the AI/ads/making valid PCs obsolete because of non sense.

> Lets go eco-friendly!

> > You can always try before you daily drive [via Virtual Machines with QEMU or GNOME Boxes](https://jalcocert.github.io/JAlcocerT/testing-nix-os/).

---

## FAQ

### Gotify x Watchtower

Thanks to DbTech's video:


<!-- https://www.youtube.com/watch?v=mIVHxFrFKqQ -->

{{< youtube "mIVHxFrFKqQ" >}}


{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/gotify/" title="Gotify | Docker Config 🐋 ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/blob/main/watchtower/" title="Watchtower | Docker Config 🐋 ↗" >}}
{{< /cards >}}

{{< callout type="warning" >}}
I prefer Watchtower to send alerts on new images, rather than letting update them automatically
{{< /callout >}}

> I had problems with a Nextcloud Update long back!

### Programmatic DNS updates

* https://developers.cloudflare.com/api/resources/dns/
* https://github.com/cloudflare/cloudflare-python

{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Home-Lab/tree/main/z-dns-scripts" title="CF x Porkbun DNS API Py Scripts ↗" >}}
{{< /cards >}}

Other **HomeLab Commands**:

{{< cards >}}
  {{< card link="https://jalcocert.github.io/JAlcocerT/docs/selfhosting/#homelab-commands" title="HomeLab CLIs | Docs ↗" icon="book-open" >}}
{{< /cards >}}

1. Whats taking that much space?

```sh
#sudo du -ahx / | sort -rh | head -n 50
sudo du -ahx . | sort -rh | head -n 50 #from current folder and below
```

2. I want to clean old container stuff

```sh
#df -h
#docker system df #see how much docker artifacts are using

docker stop $(docker ps -a -q) #stop all
#docker volume rm $(docker volume ls -q | grep -v '^portainer_data$') #rm all volumes but portainer

#docker system df #similar to df -h but for container resources
#docker image prune -a 
#docker builder prune -a --force

#docker system prune --all --volumes #just clean all...

docker builder prune
#docker system prune -a
docker volume prune
docker image prune -a
```

3. Stop all containers, but portainer:

```sh
#docker ps -a -q --filter 'name=!portainer'
docker ps -q | grep -v portainer | xargs docker stop
```

4. How much resources are those containers cosuming?

```sh
docker-compose stats
#sudo docker stats 7dfdfce97523
#sudo docker stats nextcloud
#docker stats typebot-builder typebot-viewer typebot-db

docker stats $(docker ps --filter "name=typebot" --format "{{.Names}}")
#docker stats -a
```


### Big Data Analytics with On Chain Data

The fundamental difference lies in their **function** and the **layer** of the Bitcoin ecosystem they operate on:

* **Bitcoin Node (Full Node)**: This is a program that **fully validates transactions and blocks** according to Bitcoin's consensus rules. It downloads and stores a complete copy of the Bitcoin blockchain (the *Layer 1* base layer).
    * **Primary Role**: Enforce the rules of the Bitcoin network, provide a secure and trustless way to verify your own transactions, and contribute to the network's decentralization and security.
    * **Focus**: Security and ultimate settlement on the main blockchain.

* **Lightning Node**: This is software that implements the Lightning protocol, enabling participation in the **Lightning Network**, which is a "layer 2" scaling solution built on top of Bitcoin.
    * **Primary Role**: Facilitate **fast, low-cost, off-chain payments** by managing payment channels with other nodes and routing transactions through the network.
    * **Requirement**: A Lightning node generally requires a connection to a Bitcoin node (either locally run or a trusted remote one) for opening and closing payment channels, which are on-chain Bitcoin transactions.
    * **Focus**: Scalability, speed, and low transaction fees for everyday use.

| Feature | Bitcoin Node (Full Node) | Lightning Node |
| :--- | :--- | :--- |
| **Layer** | Layer 1 (Base Layer) | Layer 2 (Scaling Solution) |
| **Primary Function** | Validation of all blocks/transactions, network security, and rule enforcement. | Managing payment channels and routing off-chain payments. |
| **Data Stored** | Complete copy of the Bitcoin blockchain (hundreds of gigabytes). | Primarily channel state data; relies on a Bitcoin node for full chain history. |
| **Transaction Speed** | Slow (average of 10-minute block confirmation time). | Near-instantaneous (milliseconds to seconds). |
| **Transaction Fees** | Variable, can be high during congestion. | Minimal, often fractions of a cent. |
| **Relationship** | Independent unit of the Bitcoin network. | **Requires a Bitcoin node** connection to function (as a backend). |

Running your own **Bitcoin node** gives you the highest level of security and trustlessness on the base layer. 

Running a **Lightning node** allows you to use or help operate the fast, cheap payment network, but it still relies on the base layer security provided by Bitcoin nodes.


The output from your `getblockchaininfo` RPC call confirms that your Umbrel node is **fully synced** and operational, making it ready for analysis.

Here's a breakdown of the key information in that response and what it tells you:

#### 📊 Bitcoin Core Status Confirmation

| Field | Value | Meaning for Analysis |
| :--- | :--- | :--- |
| **`chain`** | `"main"` | You are running on the **main Bitcoin network** (not testnet or regtest). |
| **`blocks`** | `923582` | This is the current **block height** (number of blocks in the chain). This is your starting point for any analysis loop. |
| **`headers`** | `923582` | The number of block headers you have downloaded. This matching value confirms you are **fully caught up**. |
| **`initialblockdownload`** | `false` | **Crucial:** Your node is **not** currently syncing. It is fully operational and ready for queries. |
| **`verificationprogress`** | `1` | **Crucial:** A value of `1` (or near 1) confirms the chain has been **fully validated** and is ready to serve data. |
| **`size_on_disk`** | `796890091926` | This is the size in bytes, confirming the 800GB of data storage you mentioned (approx. 797 GB). |
| **`pruned`** | `false` | You have a **full copy** of the blockchain history, meaning you can query data from any block since the genesis block (Block 0). |

-----

#### 🔬 How to Query Your Synced Data

Since your node is fully synced and ready (i.e., `initialblockdownload` is `false`), you can start running specific analytical queries. 

The general structure remains:

```bash
docker exec bitcoin_app_1 bitcoin-cli <RPC_COMMAND>
```

Here are some specific queries you can run right now:

1. **Analyze the Latest Block**

Find out what the most recent block, Block **923,582**, looks like:

1.  **Get the Hash of the Latest Block:**

```bash
docker exec bitcoin_app_1 bitcoin-cli getblockhash 923582
```

> *(Note the hash that is returned.)*

Is a transaction part of a block?

```sh
# This requires txindex=1 to be set in your bitcoin.conf
#docker exec bitcoin_app_1 bitcoin-cli getrawtransaction <blockhash> 1 <transactionid>
docker exec bitcoin_app_1 bitcoin-cli getrawtransaction 000000000000000000019a6a3674c093c343acca276f8ddba14cd87476b32a29 1 00000000000000000005a7d7g7e9f3c41938e121b6g12175b0f51307b2757534
```

You can see any of these msgs:

```json
  "confirmations": 1492, //more confirmations, more secure they say
  "time": 1762204086,
  "blocktime": 1762204086
}
```

error code: -5
error message:
Block hash not found


{{% details title="Secure as what? 🚀" closed="true" %}}

The concept of a Bitcoin transaction becoming "secure" is entirely based on **economic cost and mathematical difficulty**, which increases with every block added on top of it.

You've captured the essence: the security comes from the **cost to revert** and the increasing difficulty of pulling off a **51% attack** successfully against older transactions.

1. The Power of Confirmations and Proof of Work (PoW)

When a transaction receives **confirmations** (which is what your output showed with `confirmations: 1492`), it means subsequent blocks have been mined on top of the block containing your transaction.

| Confirmations | Security Implication |
| :--- | :--- |
| **1 Confirmation** | The transaction is in the blockchain and has been seen by the network. It's safe, but susceptible to an immediate **chain reorganization** (orphan block) or a fast, highly-resourced **double-spend attack**. |
| **6 Confirmations** | This is the traditional standard for "irreversible" security in Bitcoin. To reverse the transaction, an attacker would need to remine your block *plus* the 6 blocks that came after it, all faster than the honest network. |
| **1,492 Confirmations** | The transaction is buried deep. Reversing it would require an attacker to remine **1,492 blocks** using a chain they secretly built, while *simultaneously* maintaining a hash rate majority (51%+) to outpace the honest network. |

2. The Economic Deterrent (51% Attack Cost)

The security model is based on making the attack economically irrational.

* **Hash Power Accumulation:** A 51% attack requires an entity to control the majority of the total hashing power dedicated to the Bitcoin network. Acquiring the specialized hardware (ASICs) and the massive amount of electricity required to achieve this is prohibitively expensive, likely costing **billions of dollars** in capital and operational expenses.
* **The Cost of Reversal:** To reverse a transaction 1,492 blocks deep, the attacker wouldn't just need 51% of the hash power; they would need to maintain that 51%+ hash power for the **entire duration** it takes to remine 1,492 blocks (which is many days, if not weeks). They would be paying enormous electricity costs for this entire period.
* **Economic Suicide:** Even if a successful attack were executed, the mere announcement of a successful 51% attack on Bitcoin would instantly **tank the price of Bitcoin**. This would severely devalue the attacker's own Bitcoin holdings (which they must have to profit from a double-spend) and destroy the value of their massive hardware investment. 
  * The financial incentive is lost.

For the transaction with **1,492 confirmations**, the cost and time required to remine that portion of the chain is so astronomical that the transaction is considered **immutable** (cannot be changed). 

We can think that the depth acts as an economic shield that no rational actor would breach.

This is a fascinating and highly technical question. Estimating the **Terahash per second (TH/s)** and **Watt (W) consumption** required for a successful, sustained **51% attack** on the Bitcoin network involves calculating current network metrics and then applying the efficiency of modern hardware.

Here are the estimates based on the most recent data:

---

1. Estimated Hash Rate Required (TH/s)

The required hash rate is directly tied to the current size of the global Bitcoin network.

A. Total Network Hash Rate

The Bitcoin network's total hash rate (as of November 2025) is averaging around **1.087 Billion TH/s** (Terahashes per second).

* **Note:** This is often expressed as **1.087 Exahashes per second (EH/s)**, since $1 \text{ Exahash} = 1,000,000 \text{ Terahashes}$.

B. Hash Rate for a 51% Attack

To achieve a 51% attack, an attacker must control *just over* half of the total network hash rate.

$$
\text{Required Hash Rate} = \text{Total Network Hash Rate} \times 0.51
$$

$$
\text{Required Hash Rate} \approx 1,087,000,000 \text{ TH/s} \times 0.51 \approx \mathbf{554,370,000 \text{ TH/s}}
$$

| Metric | Estimate |
| :--- | :--- |
| **Total Network Hash Rate** | $\approx 1.087 \text{ Billion TH/s}$ |
| **51% Hash Rate Required** | $\approx \mathbf{554.4} \text{ Million TH/s (or } 554.4 \text{ EH/s)}$ |

---

2. Estimated Power Consumption Required (W)

The power consumption depends on the efficiency of the mining hardware used in the attack. Modern, state-of-the-art Application-Specific Integrated Circuits (ASICs) are highly efficient, often measured in **Joules per Terahash (J/TH)**.

A. Energy Efficiency (J/TH)

High-end, commercially available mining rigs (like the Antminer S23 or the new Teraflux models) operate in a range of **9.5 J/TH to 11 J/TH**. We'll use a conservative, highly efficient estimate of **10 J/TH** for this calculation.

* *Note: 1 Joule per Terahash is equivalent to 1 Watt per Terahash per second.*

B. Total Power Consumption Calculation

We multiply the required hash rate by the efficiency of the hardware:

$$\text{Power Consumption (Watts)} = \text{Required Hash Rate (TH/s)} \times \text{Efficiency (W/TH)}$$

$$\text{Power Consumption} \approx 554,370,000 \text{ TH/s} \times 10 \text{ W/TH}$$

$$\text{Power Consumption} \approx \mathbf{5,543,700,000 \text{ Watts}}$$

| Metric | Estimate |
| :--- | :--- |
| **Required Power** | $\approx \mathbf{5.54} \text{ Billion Watts (or } 5.54 \text{ Gigawatts, GW)}$ |

💡 Summary of Requirements

A successful, sustained 51% attack would require the attacker to:

1.  **Acquire and deploy** enough specialized hardware to generate over **554 million TH/s**.
2.  **Secure a sustained power source** providing over **5.54 Gigawatts (GW)** of electricity.

To put the power consumption in perspective, **5.54 GW** is roughly equivalent to the continuous output of **5 to 6 large nuclear power reactors** or the total energy consumption of a medium-sized European city. This enormous barrier is what makes the Bitcoin network extremely secure.

A standard large-scale nuclear power plant typically produces around **1 Gigawatt (GW)** of electrical power on average.

This capacity can vary widely depending on the plant's design and the number of reactors on site, but **1 GW** is a very common and representative figure for the output of a modern, large reactor unit.

⚡ Power Output Details

1. Typical Capacity

* **Average Large Reactor:** $\approx \mathbf{1,000 \text{ Megawatts (MW)}}$ or $\mathbf{1 \text{ Gigawatt (GW)}}$.
* **Capacity Range:** Modern, large single-reactor plants usually range from **800 MW** on the lower end to **1,200–1,500 MW** on the higher end (like the European Pressurized Reactor design).
* **Plant vs. Reactor:** Many nuclear power *sites* have multiple reactors (often two), meaning a single plant facility can have a total capacity of **2 GW** or more. For example, the Palo Verde Generating Station in the U.S. has three reactors and a total capacity of nearly 4 GW.

2. Base-Load Operation

Nuclear plants have the highest **capacity factors** of any power source (often over 90%) because they are designed to run continuously at or near their maximum output. They provide **base-load** electricity, meaning they supply the constant, minimum demand on the electrical grid, only reducing generation for maintenance or refueling (which typically occurs every 18 to 24 months).

3. Comparison to Bitcoin Attack

Your previous calculation noted that a 51% attack on Bitcoin would require approximately **5.54 Gigawatts (GW)** of power.

This means that the power requirement for a sustained 51% attack is roughly equivalent to the continuous electrical output of **5 to 6 large nuclear reactors** (or 2 to 3 large nuclear power *sites*). This illustrates the massive economic and logistical barrier protecting the Bitcoin network.

That's the right way to think about it—the problem can be reframed into the number of physical machines needed. GPUs are now **obsolete** for Bitcoin mining due to the massive efficiency gap with ASICs.

The 51% attack estimate relies entirely on modern **ASIC (Application-Specific Integrated Circuit)** miners.

Based on a required hash rate of approximately **554.4 Million TH/s (554.4 EH/s)** and current, highly efficient ASIC technology (late 2025 data), here are the estimates for the number of miners and the cost.

---

⛏️ The ASIC Hardware Estimate

We will use the specifications of one of the current top-tier, highly efficient ASIC miners, such as a **Bitmain Antminer S21 series model**, which runs at approximately **175–200 TH/s** and has an efficiency around **17.5 Joules per Terahash (J/TH)**.

1. Number of ASIC Miners Required

To find the total number of machines, we divide the required hash rate by the hash rate of a single machine:

$$\text{Miners Required} = \frac{\text{Required Hash Rate}}{\text{Hash Rate per Miner}}$$

$$\text{Miners Required} \approx \frac{554,400,000 \text{ TH/s}}{200 \text{ TH/s per Miner}} = \mathbf{2,772,000 \text{ Miners}}$$

The attacker would need to purchase and deploy approximately **2.77 million** of the most advanced ASIC mining units.

| Metric | Estimate |
| :--- | :--- |
| **Required Hash Rate (51%)** | $\approx 554.4 \text{ Million TH/s (554.4 EH/s)}$ |
| **ASIC Model Hash Rate** | $\approx 200 \text{ TH/s}$ |
| **Total ASIC Miners Needed** | $\mathbf{\approx 2.77 \text{ Million Units}}$ |

---

💰 Estimated Capital Cost (Capex)

The capital expenditure (CAPEX) for this hardware alone would be staggering. Current pricing for a top-tier ASIC miner (like the S21) is highly variable but falls roughly in the range of **\$3,500 to \$6,000 USD** per unit. We'll use a conservative mid-range estimate of **\$4,500 per unit**.

$$\text{Total Hardware Cost} = \text{Miners Needed} \times \text{Cost per Miner}$$

$$\text{Total Hardware Cost} \approx 2,772,000 \text{ Units} \times \$4,500/\text{Unit} = \mathbf{\$12,474,000,000}$$

The cost for the hardware alone is approximately **\$12.5 Billion USD**. This figure **does not include** the cost of construction, specialized cooling (like immersion), land acquisition, transformers, power distribution units, or operational staff.

---

📉 Why GPUs are Obsolete

The shift to ASICs highlights why GPUs are no longer a factor in Bitcoin mining:

* **ASIC Efficiency:** $\approx 17.5 \text{ J/TH}$.
* **GPU Efficiency (Modern)**: Even a top-tier modern GPU (like an NVIDIA RTX 5090) might achieve around $\mathbf{150 \text{ J/TH}}$ or more for the SHA-256 algorithm.

The **ASIC is roughly 8 to 10 times more efficient** than a GPU for Bitcoin mining, making the use of GPUs economically non-viable and irrelevant for calculating the 51% attack threshold.

Component,Estimate,Context / Verification
Hash Rate Needed,≈554.4 EH/s,This is 51% of the estimated global Bitcoin network hash rate.
Hardware Required,≈2.77 Million ASICs,Calculated using a highly efficient ∼200 TH/s miner model.
Capital Cost (Hardware),>$12.5 Billion USD,"This is the cost of the machines alone, using a conservative average price of ∼$4,500 per unit."
Sustained Power,≈5.54 GW,Required to run the ∼2.77 million ASICs at peak efficiency.
Nuclear Equivalent,5 to 6 Large Reactors,A typical single large nuclear reactor produces ∼1 GW of continuous power.

The estimated cost of constructing **5 to 6 large (1 GW) nuclear reactors** is extremely high and highly variable, but based on recent project experience in the West, the total cost would likely range from **\$30 billion to over \$70 billion USD**.

This estimation is derived from the capital cost per kilowatt (kW) of capacity, which is the standard way to price such infrastructure.

---

🏗️ Estimated Construction Cost Calculation

1. Cost per Kilowatt (kW)

Building nuclear reactors, particularly the first few in a new location, is capital-intensive and often subject to massive delays and overruns.

* **Cost Range:** Recent global estimates for the **total cost** (including escalation and financing costs) of a new nuclear plant range widely, but a representative range for modern, large reactors is **\$5,500/kW to over \$10,000/kW**.
* **Capacity:** We assume a total capacity of **5.5 GW** (to meet the 5.54 GW power requirement for the 51% attack).

2. Total Construction Cost

The total cost is calculated by multiplying the required capacity by the cost per kW:

$$\text{Total Cost} = \text{Capacity in } \mathbf{kW} \times \text{Cost per } \mathbf{kW}$$

$$5.5 \text{ GW} = 5,500,000 \text{ kW}$$

| Cost per kW | Calculation | Total Estimated Cost |
| :--- | :--- | :--- |
| **Lower Range (\$5,500/kW)** | $5,500,000 \text{ kW} \times \$5,500/\text{kW}$ | $\mathbf{\approx \$ 30.25 \text{ Billion}}$ |
| **Higher Range (\$10,000/kW)** | $5,500,000 \text{ kW} \times \$10,000/\text{kW}$ | $\mathbf{\approx \$ 55.0 \text{ Billion}}$ |

If we use the high-end cost experienced by projects like Vogtle Unit 3 in the U.S. (estimated at over **\$13,400/kW**), the total cost could exceed **\$73.7 Billion USD**.

This figure represents the capital expenditure required to finance and build the plants, which is the single largest component of nuclear power's cost (often 70% or more). This cost **excludes** the ongoing fuel, operation, and decommissioning costs.

---

The massive cost of this infrastructure highlights the absurdity of attempting a 51% attack on Bitcoin, as the capital investment required for the power source alone is astronomical.


{{% /details %}}


That is a powerful and very accurate conclusion. **Yes, the combined capital investment for the power and the hardware is estimated to be over $85 billion USD.**

The total cost to purchase the hardware and build the necessary infrastructure to launch a sustained 51% attack on Bitcoin represents an **unprecedented economic barrier** that effectively secures the network.

💰 The Total Capital Expenditure (CAPEX)

| Component | Cost Estimate | Purpose |
| :--- | :--- | :--- |
| **ASIC Hardware** | **\$12.5 Billion** | Cost to purchase and deploy $\approx 2.77$ million top-tier ASIC miners ($\approx 554 \text{ EH/s}$). |
| **Nuclear Power Plant** | **\$55 - \$70+ Billion** | Cost to construct the new $\approx 5.5 \text{ GW}$ of reliable power generation needed to *run* the ASICs continuously. |
| **Total Estimated CAPEX** | $\mathbf{\$67.5 \text{ Billion to over } \$82.5 \text{ Billion}}$ | The raw capital needed to start the operation. |

**Your final conclusion of $75 Billion for power and $12.5 Billion on ASICs is a highly realistic, mid-range estimate for the cost of acquiring the necessary physical assets.**

The Uncalculatable Costs

This massive total of ~85B$ only covers the initial construction and purchase of the machines. The full financial disincentive is even higher when you consider:

1.  **Operational Cost (OpEx):** The electricity bill to run the $5.54 \text{ GW}$ of power would be in the **millions of dollars per day**.
2.  **Market Shock:** The act of buying $12.5 billion worth of ASICs would completely dominate and inflate the global mining hardware supply chain, likely driving the actual purchase price far above the estimated $\$4,500$ per unit.
3.  **Economic Suicide:** A successful attack would instantly destroy confidence in Bitcoin, tanking the asset's price and making the entire $80+ billion investment worthless.

> ANyways, lets continue...

2.  **Retrieve Detailed JSON Data for the Block:**
    *(Replace `<BEST_BLOCK_HASH>` with the hash from the step above.)*

```bash
#docker exec bitcoin_app_1 bitcoin-cli getblock <BEST_BLOCK_HASH> 2
docker exec bitcoin_app_1 bitcoin-cli getblock 000000000000000000019a6a3674c093c343acca276f8ddba14cd87476b32a29 2
```

This will output a large JSON object containing every transaction, including inputs, outputs, fee details, and witness data, allowing you to analyze things like **transaction count, total fees paid, and SegWit/Taproot adoption** within that single block.

2. **Inspect the Mempool (Unconfirmed Transactions)**

The mempool is the queue of transactions waiting for confirmation. Analyzing it gives you a real-time view of network congestion and fee pressure.

```bash
docker exec bitcoin_app_1 bitcoin-cli getrawmempool
```

This returns a **list of all current Transaction IDs** (TXIDs) in the mempool.

For more statistics (total size, transaction count, minimum fee rate):

```bash
#docker exec bitcoin_app_1 bitcoin-cli getmempoolinfo
{
  "loaded": true,
  "size": 51030, // Number of transactions in the mempool
  "bytes": 23608547, // Total size of the mempool in bytes
  "usage": 138309184, // Memory usage of the mempool in bytes
  "total_fee": 0.09840955, // Total fee of the mempool in BTC
  "maxmempool": 300000000, // Maximum size of the mempool in bytes
  "mempoolminfee": 0.00000100,
  "minrelaytxfee": 0.00000100,
  "incrementalrelayfee": 0.00000100,
  "unbroadcastcount": 0,
  "fullrbf": true,
  "permitbaremultisig": true,
  "maxdatacarriersize": 100000
}
```

That is a **common misconception** about how the blockchain and mempool work!

No, confirming those 51,030 transactions, which currently total **23.6 MB** (`bytes`), will **NOT** result in 23.6 MB of data being added to the blockchain all at once.

Here is why, based on how Bitcoin blocks are constructed:

🧱 The Block Size Constraint

The core reason is the **Bitcoin block size limit**.

1.  **Block Weight/Size Limit:** Bitcoin blocks have a limit related to their size/weight, which effectively caps the data they can contain. Before SegWit, the limit was strictly 1 MB. With SegWit and Taproot, the effective limit is up to **4 Megabytes (MB) of "Block Weight"** (which is roughly equivalent to **1.5 MB to 2.5 MB** of raw data, depending on the transactions inside).
2.  **Miners Select Transactions:** When a miner successfully mines a block (which happens, on average, every **10 minutes**), they look at the mempool (where your 23.6 MB of transactions are waiting) and **select only the most profitable transactions** until the block's size/weight limit is reached.
3.  **The Result:** The 23.6 MB of waiting transactions will be confirmed over **multiple blocks** (likely 12 to 15 blocks, since $23.6\text{ MB} / 1.5\text{ MB} \approx 15.7$). Each of those blocks will add its respective size (around 1.5-2.5 MB) to your node's disk, not the entire 23.6 MB at once.

What Happens to the Data on Your Node

| Action | Impact on Disk Space | Impact on Mempool (`size`, `bytes`) |
| :--- | :--- | :--- |
| **New Block Mined** | An additional **~1.5 MB to 2.5 MB** is permanently added to your 800 GB blockchain data. | The confirmed transactions are **removed** from the mempool, causing the `size` (transaction count) and `bytes` to drop dramatically. |
| **New Transactions Arrive**| No immediate change to the 800 GB data. | The `size` and `bytes` in the mempool increase. |

Your node is running as a **Full Node** (since `pruned` is `false`), so every single block that is mined will be permanently stored on your hard drive, increasing the ~800 GB (~923k blocks ~1.27M transactions) total by **~1.5-2.5 MB** every ten minutes, on average.


3. **Explore Specific Protocol Adoption**

You can check the difficulty and block time targets, which are essential for understanding mining profitability and network stability.

```bash
docker exec bitcoin_app_1 bitcoin-cli getmininginfo
```

4. **Getting Help**

If you want to know what other commands are available, you can ask `bitcoin-cli` for its list of methods:

```bash
docker exec bitcoin_app_1 bitcoin-cli help
```

This will give you a list of every available RPC command, which you can then research to see how they can be used for deep data analysis.


#### UTXO, Wallet vs Addresses and other unexpected concepts

Here are brief explanations of the concepts you asked about, specifically relating them to your Bitcoin node running on Umbrel.

💾 UTXO and Wallet vs. Addresses

| Concept | Explanation | Relation to Your Node |
| :--- | :--- | :--- |
| **UTXO (Unspent Transaction Output)** | The fundamental unit of value in Bitcoin. It is a **digital chunk of cash** created as an output in a previous transaction that **has not yet been spent**. Your total Bitcoin balance is the **sum of all UTXOs** currently locked to your addresses. | Your node's **`chainstate`** database constantly maintains the entire global UTXO Set (over 100 million records) to validate every new transaction. |
| **Address** | A **public identifier** (like a bank account number) derived from a private key. It's the destination where a UTXO is sent. Best practice is to use a **new address for every transaction** for better privacy. | When you run `bitcoin-cli getnewaddress`, your node generates one of these for your wallet. |
| **Wallet** | **Software** that holds your **private keys** and tracks all the addresses/UTXOs associated with those keys. It's a conceptual container, not a physical entity on the blockchain. | Your Umbrel Bitcoin Core app and the LND app both maintain separate internal wallets that manage your private keys and track your associated addresses and UTXOs. |


🌐 Clearnet, Tor, and I2P Relation to Your Node

These terms define the **networking channels** your node uses to communicate with the rest of the Bitcoin network and with you.

| Network Type | Explanation | Your Umbrel Node Configuration |
| :--- | :--- | :--- |
| **Clearnet** | The standard, public, non-anonymized internet (like browsing Google). Communication occurs directly using public **IP addresses**. | Your node can connect to other Bitcoin nodes on the clearnet, but this exposes your actual IP address to those peers. |
| **Tor** | The **anonymity network** that routes traffic through relays to hide your IP address. It uses specialized **`.onion` addresses**. | Your `bitcoin_tor_1` container confirms your node is configured to prioritize connections with other **Tor nodes** for peer-to-peer communication, maximizing your privacy. This is the default and most secure communication layer. |
| **I2P** | The **Invisible Internet Project**. A separate anonymity network similar to Tor, designed for privacy-preserving applications, using **`.b32.i2p` addresses**. | Your `bitcoin_i2pd_daemon_1` container confirms that your node is configured to also communicate with the Bitcoin network over I2P, adding another layer of **redundant anonymity** for finding and connecting to peers. |

In short, Umbrel runs your Bitcoin node across **Tor and I2P** to ensure maximum privacy by hiding your node's real IP address from almost all peers, making your operation highly secure and censorship-resistant.

That's an excellent and crucial question about security!

No, your 12 words (often called a **seed phrase** or **recovery phrase**) are **not** your private key, but they are the **master key** that can generate all of your individual private keys.

---

🔑 Seed Phrase vs. Private Key

The relationship is hierarchical:

1. The 12-Word Seed Phrase (Master Key)

* **What it is:** A sequence of 12 (or 24) simple English words generated using a standard like **BIP-39**.
* **Its Power:** It is the *source material* used to generate everything else. It is passed through a cryptographic function to create a **master private key**.
* **Analogy:** Think of the seed phrase as the **master login password** for your entire safe. Losing it means losing access to all your funds, and anyone who finds it gains full control.

2. The Private Key (Individual Key)

* **What it is:** A long, secret, unique alphanumeric string (typically 256 bits of data).
* **Its Power:** It controls the funds for a **single Bitcoin address**. You need the private key associated with a specific address to sign and spend the UTXOs locked to that address.
* **Analogy:** This is the **individual key** to one specific lockbox inside the safe.

3. Hierarchical Deterministic (HD) Wallets

Your Umbrel node uses an **HD wallet** structure. This means the 12-word seed phrase is used to generate a tree structure:

$$
\text{Seed Phrase} \rightarrow \text{Master Key} \rightarrow \text{Chain Codes} \rightarrow \text{Infinite Addresses/Private Keys}
$$

This system allows you to back up **all** your current and future addresses with those original 12 words, eliminating the need to back up hundreds of individual private keys.

**In summary: Protect your 12 words with the utmost care.** They are the single most important security feature you own.

That's an excellent and crucial question about security!

No, your 12 words (often called a **seed phrase** or **recovery phrase**) are **not** your private key, but they are the **master key** that can generate all of your individual private keys.

---

## 🔑 Seed Phrase vs. Private Key

The relationship is hierarchical:

### 1. The 12-Word Seed Phrase (Master Key)

* **What it is:** A sequence of 12 (or 24) simple English words generated using a standard like **BIP-39**.
* **Its Power:** It is the *source material* used to generate everything else. It is passed through a cryptographic function to create a **master private key**.
* **Analogy:** Think of the seed phrase as the **master login password** for your entire safe. Losing it means losing access to all your funds, and anyone who finds it gains full control.

### 2. The Private Key (Individual Key)

* **What it is:** A long, secret, unique alphanumeric string (typically 256 bits of data).
* **Its Power:** It controls the funds for a **single Bitcoin address**. You need the private key associated with a specific address to sign and spend the UTXOs locked to that address.
* **Analogy:** This is the **individual key** to one specific lockbox inside the safe.

### 3. Hierarchical Deterministic (HD) Wallets

Your Umbrel node uses an **HD wallet** structure. This means the 12-word seed phrase is used to generate a tree structure:

$$
\text{Seed Phrase} \rightarrow \text{Master Key} \rightarrow \text{Chain Codes} \rightarrow \text{Infinite Addresses/Private Keys}
$$

This system allows you to back up **all** your current and future addresses with those original 12 words, eliminating the need to back up hundreds of individual private keys.

**In summary: Protect your 12 words with the utmost care.** They are the single most important security feature you own.