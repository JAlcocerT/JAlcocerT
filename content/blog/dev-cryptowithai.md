---
title: "Crypto. Now understandable with AI"
date: 2025-06-13
draft: false
description: 'Two buzz words in one. Understand crypto once and for all. This time thanks to LLMs'
url: 'understading-crypto-with-ai'
---

* https://chainlist.org/

> ChainList is a list of EVM networks. Users can use the information to connect their wallets and Web3 middleware providers to the appropriate Chain ID and Network ID to connect to the correct chain.


Here we go again...

I was testing [Astro Bento Portfolio + Github Pages + Github CI/CD](https://github.com/JAlcocerT/web3) with the resulting Web3/Crypto related microblog [here](https://jalcocert.github.io/web3/).

{{< callout type="warning" >}}
This post is just describing the process to apply data analytics with crypto. **Not any recommendation or financial advice of any type.**
{{< /callout >}}

Some time ago I was having a look to this **amazing BlockChain/Solidity FreeCodeCamp course:**

{{< youtube "gyMwXuJrbJQ" >}}

**Practical Blockchain:**
- Parties that do not know each other can **exchange value without a central authority**



<!-- 
inspired by CryptaIQ and keeping that intelligent, AI-powered vibe:

    ProtocolAI – Simple and clear, focusing on AI-powered protocol insights.
    DeCryptIQ – Emphasizing crypto and intelligent insights with a "decryption" feel.
    BlockWise – Suggests wisdom and understanding of blockchain protocols.
    CryptoLens – Implies a clear view or “lens” into understanding crypto.
    ChainSage – Conveys expertise and guidance in blockchain.
    Protocolize – Playful and suggests simplifying protocols with AI.
    InsightChain – Focuses on providing deep insights into blockchain protocols.
    CryptoCompass – Implies navigating and understanding the crypto landscape.
    IntelliChain – A combination of intelligence and blockchain, emphasizing smart analysis.
    BlockIQ – Short, catchy, and focused on intelligent blockchain insights. -->



{{< callout type="info" >}}
I decided to create [the **InsighChAIn Project**](https://github.com/JAlcocerT/PyInsightChAIn). Knowledge from [the Scrap project](https://github.com/JAlcocerT/Scrap_Tools) and practically from [CVCreAItor](/ai-useful-yet-simple/) 💻 
{{< /callout >}}

{{< details title="What would Cicero Think about Crypto?" closed="true" >}}

* Protection Against Arbitrary Power

- **Cicero’s View:**
  - Clear, consistent laws safeguard against tyranny or arbitrary rule.
  - Without laws, society is governed by the whims of those in power, leaving people without protection or fairness.

- **Complexity’s Role:**
  - A well-designed system of rules provides structure and predictability.
  - Everyone—whether ruler or citizen—is theoretically bound by these rules, leveling the playing field and reducing the ability of any one person or group to impose their will unfairly.

* Risk of Over-Regulation or **Tyranny of Rules**

- **Too Many Rules:**
  - Excessively complex systems can result in over-regulation.
  - People may struggle to navigate the legal or bureaucratic framework, hindering personal freedoms.
  - Complex rules can concentrate power among those who manipulate or interpret the system.

- **Inaccessibility:**
  - Complex rules create a divide between those who understand the law (experts, bureaucrats, the wealthy) and the general population.
  - Individuals may feel oppressed or disadvantaged without the resources to navigate or challenge the system.

{{< /details >}}

> If there are no clear laws, we will be enslaved by the wishes of men - Cicero

My point is: I dont have any idea about Solidity, Smart Contracts or whatever code goberns crypto.

But...I think many of us know how to use AI already (particularly LLMs) - to get some ideas of what are we interacting with.

> Let's try to get clarification on some Smart Contract

Understanding SC's with LLMs: these are are some [interesting protocols](https://dappradar.com/rankings/defi?sort=tvlInFiat&order=desc)

{{% details title="More about protocols... 🚀" closed="true" %}}

* https://lido.fi/ - Decentralized [Staking ETH](https://stake.lido.fi/) (get stETH and use stETH in DeFi)
* https://yearn.fi/
* https://compound.finance/
* https://aavescan.com
  * https://aavescan.com/polygon-v3/0x8f3cf7ad23cd3cadbd9735aff958023239c6a0630xa97684ead0e402dc232d5a977953df7ecbab3cdb

* [SETH](https://etherscan.io/token/0xae7ab96520de3a18e5e111b5eaab095312d7fe84)


{{% /details %}}

## Crypto Analytics

There are of course some platforms already for this.

But as this is all public, how about...exploring a BTC wallet?

Like the one offered for donations at duckdns:

* https://btcscan.org/address/16gHnv3NTjpF5ZavMi9QYBFxUkNchdicUS

{{< cards cols="1" >}}
  {{< card link="https://fossengineer.com/selfhosting-nginx-proxy-manager-docker/" title="DuckDNS+NGINX is a very cool setup, btw" >}}
{{< /cards >}}

And that exploration of a wallet can be [done with Python](https://github.com/JAlcocerT/Streamlit-AIssistant/blob/main/Z_Tests/Crypto/btc_explore.ipynb)!

[![Open in Google Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/JAlcocerT/Streamlit-AIssistant/blob/main/Z_Tests/Crypto/btc_explore.ipynb)

{{< details title="Crypto - SelfServing Dashboards & Analytics Platforms: Dune and more 📌" closed="true" >}}

I have used [Dune-Analytics](https://dune.com/), together with [SQL](/sql-data-analytics/)

{{< callout type="info" >}}
Particularly, to make a [UniSwap Protocol Dashboard](https://dune.com/fossengineer/uniswap).
{{< /callout >}}


1. **DeBank**:
   - **Free Tier**: DeBank offers a free version that includes basic features for tracking and managing decentralized finance (DeFi) portfolios, such as token balances, transaction histories, and portfolio insights across multiple chains.
   - **Usage**: Popular among users for its clean, easy-to-use interface and chain aggregation features.

2. **Zapper**:
   - **Free Tier**: Zapper provides free access to basic DeFi portfolio tracking and yield farming analytics. It aggregates data from various DeFi protocols and presents it in a unified dashboardsage**: A favorite for users tracking multiple DeFi investments across different platforms, with an intuitive user interface.

3. **Nansen**:
   - **Free Tier**: The free version of Nansen offers basic tracking features but with significant limitations, including access to limited data on wallet activity and DeFi protocols .
   - Advanced features, such as more detailed analytics, deeper insights into DeFi protocols, and enhanced filtering, are available through paid plans.

4. **Dune Analytics**:
   - **Free Tier**: Dune offers a free version that allows users to query and visualize blockchain data using SQL. However, query limits and access to certain advanced dashboards are restricted .
   - **Paid Features plans** unlock higher query limits, private dashboards, and greater customization options for advanced users, particularly useful for researchers and developers.

5. **Messari**:
   - **Free Tier**: Messari’s free tier provides limited access to crypto data and analysis, such as basic market insights and some reports .
   - **Paid Features**: Forled research, advanced analytics, and exclusive reports, Messari offers premium subscriptions. These are typically used by institutional investors and analysts.

- **Nansen** and **Messari** are particularly popular among institutional investors due to their advanced data features and research reports. 
- **DeBank** and **Zapper** are favored by DeFi enthusiasts for their user-friendly interfaces and portfolio tracking capabilities.
- **Dune Analytics** appeals to data-driven users and developers, especially those who are **comfortable with SQL and need deep access to blockchain data**.

For many casual users, **DeBank** and **Zapper** provide sufficient features, while **Nansen** and **Messari** are more suited for power users needing professional-grade analysis.



{{< /details >}}


### Exploring Protocols

Solidity is not the only language you can use with Polygon. While it's the most popular language for developing smart contracts on Polygon due to its compatibility with the Ethereum Virtual Machine (EVM), other languages can be used indirectly.

{{< details title="Here are some other options 📌" closed="true" >}}

Indirectly through Compilation:

Vyper: A Python-like language that compiles to EVM bytecode, allowing you to write smart contracts in a more Pythonic style.   
Yul: A low-level assembly language for the EVM, which can be used for highly optimized or specific use cases.

{{< /details >}}





So if the Analytics part is clear...

...and blockchain data is public?

How about exploring one protocol as an example? 

> Let's give it a try to **PolyMarket**


* Its kind of a prediction market...place? Lets find out how many transactions are happening
  * https://defillama.com/protocol/polymarket#information
  * Transactions - https://polygonscan.com/txs?a=0x4bfb41d5b3570defd03c39a9a4d8de6bd8b8982e

{{< details title="About PolyMarket... 📌" closed="true" >}}


Polymarket Overview: **A decentralized application on the Polygon blockchain** for predicting real-world events like elections and sports.

Functionality: Users buy shares based on their predictions; share prices fluctuate with user confidence. Correct predictions yield profits, while incorrect ones result in losses.
Prediction Examples: Includes political outcomes (e.g., presidential elections) and pop culture events (e.g., TikTok's potential ban in the U.S.).
Liquidity Providers: Essential for market function; they deposit funds into a share pool and earn rewards, including weekly payouts in USDC.
Important Considerations:
    Not available in the U.S.; users should verify local laws.
    Distinction between actual probabilities and market opinions is crucial.
Key Takeaways:
    Users can profit from accurate predictions.
    Liquidity providers ensure market efficiency.
    Awareness of local regulations is necessary before participation.


{{< /details >}}


{{< youtube "GvT_Fycvt14" >}}

#### The Code - BlockChain Transaction Analyzer



---

## Crypto Resources

* BlockChain Scanners
  * [ETHScan](https://etherscan.io/)
  * [Solscan](https://solscan.io/)
  * https://polygonscan.com/

* Blockchain explorer for Ethereum based network and a tool for inspecting and analyzing **EVM based blockchains**.
  * https://github.com/blockscout/blockscout

{{< callout type="info" >}}
If you want to read one and only one book aboyt Crypto - [WhyCryptoCurrencies](https://whycryptocurrencies.com/)
{{< /callout >}}




### Interesting Crypto Stuff I found lately


{{< callout type="warning" >}}
**Remember** that these are my notes as I learn and not any recommendation to buy/sell anything, neither to follow any link.
{{< /callout >}}

#### Lending Protocols

I mean **Lending&Borrowing** Protocols:

https://de.fi/explore/borrow-lending/cat/stablecoin

> As of now, some popular ones are [Compound](https://compound.finance/), AAve v3 or [Spark](https://app.spark.fi/)

![alt text](/blog_img/crypto/sample-eth-wallet.png)

![alt text](/blog_img/crypto/sample-eth-aave.png)

* https://www.reddit.com/r/CryptoCurrency/comments/mnzv1c/defi_explained_lending_borrowing/
* https://www.reddit.com/r/CryptoCurrency/comments/nletmi/defi_explained_the_full_guide/#:~:text=Decentralized%20Finance%20(DeFi)%20is%20a,protocols%20that%20work%20without%20intermediaries.

#### Staking Protocols

I was always confused by staking vs lending.

#### More Web3 Stuff

> I was writing [about web3 here](https://jalcocert.github.io/JAlcocerT/guide-web3). 

{{< callout type="info" >}}
If you have a website, I show you [how to also have a **Web3 Compatible website**](/guide-web3/)
{{< /callout >}}


* https://www.reddit.com/r/defi/comments/1dl9ecu/most_reputable_respected_and_definitive_guides_on/

*  Full-Stack DApp Boilerplate for Substrate and ink! Smart Contracts  https://github.com/scio-labs/inkathon?ref=statichunt.com


* Top Protocols per Chain (for example Ethereum) - https://defillama.com/top-protocols
* AAVE v3 is the most popular lending protocol for ETH at this moment - https://defillama.com/protocol/aave-v3?medianApy=true

#### Some dApps

Open Source, Permissionless & privacy conscious DeFi portfolio tracker


* https://llamafolio.com/

> Start visualising and tracking 434 protocols across 17 blockchains.



#### Stable Coins

Example stable coins are: USDT, USDC, DAI, USDS...

* https://defillama.com/stablecoins
* https://defillama.com/stablecoin/dai
* https://defillama.com/stablecoins/Polygon

#### ERC20



{{< details title="What cool things can be done with ERC20? USDC USDT DAI Transfers" closed="true" >}}

It is possible to receive **USDT, USDC, and DAI** into an ERC-20 (Ethereum) wallet:

* DAI Contract Address: https://eth.blockscout.com/token/0x6B175474E89094C44Da98b954EedeAC495271d0F
* Tether (USDT): https://eth.blockscout.com/token/0xdAC17F958D2ee523a2206206994597C13D831ec7
* USDC: https://eth.blockscout.com/token/0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48

All three of these are commonly **issued as ERC-20 tokens**, meaning they operate on the Ethereum blockchain and are compatible with Ethereum addresses.

* **ERC-20 Compatibility:**
    * USDT, USDC, and DAI are designed to adhere to the ERC-20 token standard. This standard defines a set of rules and functions that allow these tokens to interact with the Ethereum blockchain and other ERC-20-compatible wallets.
    * Therefore, any Ethereum wallet that supports ERC-20 tokens can receive and hold these cryptocurrencies.

* **Wallet Addresses:**
    * Your Ethereum wallet address is the same address you'll use to receive all three tokens. You don't need separate addresses for each.

* **Important Considerations:**
    * **Network Fees (Gas):** When sending or receiving ERC-20 tokens, you'll need to pay Ethereum network fees (gas). These fees fluctuate depending on network congestion.
    * **Wallet Support:** Ensure your wallet fully supports ERC-20 tokens. Most modern Ethereum wallets do, but it's always good to double-check.
    * **Correct Network:** It is vital that the sender of the tokens, sends them on the Ethereum network. If they send them on another network, such as the Tron network, the funds will most likely be lost.
    * **Contract Addresses:** While you use your regular Ethereum address to receive these tokens, each token has its own unique contract address on the Ethereum blockchain. This contract address is used by the blockchain to identify the token. You do not need to use the contract address to receive the tokens.

> You can confidently use your Ethereum (ERC-20) wallet address to receive USDT, USDC, and DAI.


{{< /details >}}

For example, the **aave token is ERC20**:

* https://eth.blockscout.com/token/0x7fc66500c84a76ad7e9c93437bfc5ac33e2ddae9

---

## Conclusions

---

## FAQ

### Chain Comparison

Bitcoin, Ethereum, Solana, and Polkadot: A Comparative Overview

| Feature | Bitcoin | Ethereum | Solana | Polkadot |
|---|---|---|---|---|
| **Primary Function** | Digital currency | Smart contract platform | High-throughput blockchain | Interoperable blockchain network |
| **Consensus Mechanism** | Proof-of-Work (PoW) | Proof-of-Stake (PoS) | Proof-of-History (PoH) + Proof-of-Stake (PoS) | Nominated Proof-of-Stake (NPoS) |
| **Transaction Speed** | ~7 transactions per second (TPS) | ~30 TPS (pre-Merge) | Up to 65,000 TPS | Up to 1,000 TPS |
| **Transaction Fees** | Relatively high | Can vary significantly | Low | Low |
| **Smart Contracts** | Limited | Supports complex smart contracts | Supports smart contracts | Supports parachains for custom blockchains |
| **Scalability** | Limited | Improving with layer-2 solutions | High | High |
| **Interoperability** | Limited | Improving with bridges | Limited | High |

**Programming**

* **Solidity** is primarily used for developing smart contracts on the **Ethereum** blockchain.
* Other blockchains, like Solana, have their own programming languages (e.g., **Rust** for Solana).
* Polkadot, being a network of interconnected blockchains (parachains), allows for diverse programming languages depending on the specific parachain.

**Open-Source Wallets**

* **Bitcoin:** Electrum, Bitcoin Core, Mycelium

```sh
#flatpak install flathub org.electrum.electrum
```

* **Ethereum:** MetaMask, MyEtherWallet, Trust Wallet
* **Solana:** Phantom, Sollet, Solflare
* **Polkadot:** Polkadot.js, Talisman

### Crypto Concepts


{{< callout type="warning" >}}
Always think twice before doing. Consult with a professional.
{{< /callout >}}


1. Impermanent Loss (IL) 

This can happen when the value of 2 assets deposited in a pool diverse: https://app.beefy.com/vault/nuri-cow-scroll-wbtc-weth-vault

> beefy is a Multichain Yield Optimizer

2. You can Stake using Smart Contract Protocols like Aave: https://app.aave.com/

* https://etherscan.io/address/0xd01607c3c5ecaba394d8be377a08590149325722

> And you receive some tokens while your assets are staked: https://etherscan.io/token/0x4d5f47fa6a74757f35c14fd3a6ef8e3c9bc514e8

3. Sample wallet

https://portfolio.metamask.io/stake?tab=pooled

> You can find your wallet address / transactions and so on at https://etherscan.io/address/

4. DeFi space is huge and full of information

* https://app.extrafi.io/farm
* https://defillama.com/yields/stablecoins?token=USDT