---
title: "Networking - Understanding Domains and DNS Setup"
date: 2025-09-24
draft: false
tags: ["HomeLab","DNS vs ENS","Web2 vs Web3 vs Crypto","DNSMap","PolyMarket & OO","dnsmap"]
description: 'How to Setup DNS for your Domains. Also UDs.'
url: 'web-domain-basics'
---

**Tl;DR**

More goodies for your homelab.

+++ and [why and how](#faq) we can interact with SC's and web3 from regular web2 domains.

**Intro**

You can buy a TLD via any of these (and many more):

1. Porkbun
2. Cloudflare
3. SquareSpace - Forced to use it after Google said bye to Google Domains

* https://pypi.org/project/porkbun-api/
    * Buy Domains - https://porkbun.com/api/json/v3/documentation#Domain%20Pricing
    * Or update DNS Settings - 

* https://github.com/cloudflare/cloudflare-python
    * https://developers.cloudflare.com/api

To point a subdomain to an IPv4 or IPv6 address, you need to create specific DNS records.

Here’s what you need to do:

1. **Pointing to an IPv4 Address**

- **Record Type:** `A`
- **Name:** `subdomain.yourdomain.com`
- **Value:** The IPv4 address you want to point to.

Example:

If your subdomain is `app.example.com` and the IPv4 address is `192.168.1.1`, your DNS record should look like:

| Type | Name            | Value        |
|------|-----------------|--------------|
| A    | app.example.com | 192.168.1.1  |

2. Pointing to an IPv6 Address

- **Record Type:** `AAAA`
- **Name:** `subdomain.yourdomain.com`
- **Value:** The IPv6 address you want to point to.

Example:

If your subdomain is `app.example.com` and the IPv6 address is `2001:0db8:85a3:0000:0000:8a2e:1234:5678`, your DNS record should look like:

| Type  | Name            | Value                                   |
|-------|-----------------|-----------------------------------------|
| AAAA  | app.example.com | 2001:0db8:85a3:0000:0000:8a2e:1234:5678 |

**Summary:**

- Use an `A` record to point a subdomain to an IPv4 address.
- Use an `AAAA` record to point a subdomain to an IPv6 address.

Make sure to replace `subdomain.yourdomain.com` with your actual subdomain, and `yourdomain.com` with your actual domain name.


> Remember, how to get Local SSL and https: NGINX, DuckDNS

### DNS Review

1. https://dnsmap.io/

> Provides free dns lookup service for checking domain name server records against a randomly selected list of DNS servers in different corners of the world.

## ENS and UD

What are web3 domains?

https://www.youtube.com/watch?v=Jklj3lY8J3I

https://support.unstoppabledomains.com/support/solutions/articles/48001181690-what-are-web3-domains-

The main concepts explained in the content relate to the fundamentals and benefits of Web3 domains, how they differ from traditional (DNS) domains, and practical information about their use and storage.

Key Concepts

- **Web3 Domains:** Blockchain-based domain names (like .crypto or .nft) that function as digital assets. They are fully owned by the purchaser, stored in a crypto wallet, and are not controlled by any central registrar.[1]

- **Ownership and Control:** Once purchased (and except .eth), Web3 domains are owned forever with no renewals required and cannot be taken away by any authority.[1]

- **Utility:** Web3 domains can replace crypto wallet addresses, making transactions with hundreds of cryptocurrencies simpler and more secure. They can be used for logging into dApps, hosting decentralized websites on IPFS, and as unique identifiers in digital profiles.[1]

- **Supported Platforms and Integration:** They work with many apps and wallets (e.g., Brave Browser, Trust Wallet, MetaMask) but only resolve natively in some browsers. Browser extensions expand compatibility, and there are ongoing efforts to integrate with traditional browser DNS systems.[1]

- **Storage and Security:** Domains can be stored in either self-custody wallets (like MetaMask) or custodial accounts provided by Unstoppable Domains. Ownership and management are always enforced by blockchain smart contracts, and private keys control all changes.[1]

- **Blockchain Networks:** Domains are minted on several blockchains, such as Polygon, Ethereum, Solana, Base, and Sonic, with Unstoppable usually covering gas fees except on Ethereum.[1]

- **Support Resources:** Extensive documentation and FAQs help explain features like badges, login options, and on-chain domain management, as well as offering specific solutions for issues and how-to guides.[1]

In summary, the content heavily emphasizes Web3 domain ownership, decentralization, blockchain integration, practical management, and their expanding ecosystem and utility.

---

## Conclusions

So now, you have learnt not only about regular TLD domains and DNS for your homelab.

But also on ENS and how they relate with crypto.

Which is...a totally different world.

**Seed Phrase and Wallet Recovery**

- The seed phrase (typically 12 or 24 words) is the master key to your wallet. It is used to deterministically generate all private keys and addresses your wallet controls.
- From this single seed phrase, wallets derive a hierarchy of private keys (HD wallet standard) to generate many Bitcoin addresses.
- This enables easy backup and recovery: restoring a wallet only requires this seed phrase.

**Private and Public Keys**

- **The seed generates a master private key**, which is used with chain codes to derive child private keys.
- Private keys pair with public keys through elliptic curve cryptography (secp256k1).
- Each public key corresponds to a Bitcoin address where funds reside.
- Having the seed phrase means control over all related private keys and funds across multiple addresses.
    - Just **dont be scared** if you created a new wallet from the same seed and get a different address to see on `btcscan.org` or `blockchain.com`

**Encryption and Security in Electrum**

- Electrum encrypts private keys and wallet files locally on your device using AES-256-CBC encryption.
- The wallet password is required to decrypt these keys for signing transactions.
- Encryption protects your wallet data from unauthorized access on your computer.
- Private keys never leave your device and are needed to sign transactions or messages securely.

**Transactions and Sending Bitcoin**

- When sending Bitcoin, Electrum consolidates all unspent outputs (UTXOs) from your different addresses into one transaction.
- Transaction fees depend on the size of the transaction (number of inputs/outputs).
- Electrum allows managing addresses and coins for efficient fee handling.

**Message Signing and Encryption**

- Electrum enables signing messages with your private keys, [proving ownership of an address](https://pocketbitcoin.com/faq/why-must-I-confirm-my-bitcoin-address) without exposing keys.
- It also supports encrypting and decrypting messages using public-key cryptography based on the Bitcoin elliptic curve, allowing secure communication tied to wallet addresses.

**Use Cases and Benefits**

- The seed phrase backup simplifies wallet recovery and security management.
- Multiple addresses improve privacy by avoiding address reuse.
- Strong encryption and local private key storage enhance security.
- Message signing and encryption add layers of authentication and private communication.

In short, Electrum and Bitcoin wallets rely on your seed phrase to generate all keys and addresses, use strong cryptographic methods to secure private keys and transactions locally, and provide features for both sending Bitcoin and secure messaging—all while maintaining user control and privacy.




---

## FAQ

Using a regular Web2 domain like polymarket.com to interact with Polygon smart contracts via MetaMask is possible due to the layered architecture of decentralized applications (dApps) that combine Web2 frontends with Web3 backends. Here’s how it works:

### How Web2 Domain and MetaMask Interface with Polygon Smart Contracts

- **Web2 Frontend:** The website (polymarket.com) is a traditional web server hosting a frontend interface built with modern web technologies (JavaScript, React, etc.). This frontend provides a user-friendly experience to browse markets, place bets, and view positions.

- **Web3 Integration in the Browser:** The frontend integrates Web3 libraries like **ethers.js** or **web3.js** that connect the website to blockchain networks through MetaMask or other wallet browser extensions.

- **MetaMask as Wallet & Signer:** MetaMask acts as a bridge between the user's browser and the blockchain. It holds the user’s private keys locally and signs transactions to the Polygon network when requested by the website.

- **Smart Contract Interaction:** When a user performs an action (e.g., placing a bet), the frontend sends a transaction request to MetaMask, which prompts the user to approve it. Upon approval, MetaMask signs and submits the transaction to the Polygon blockchain, interacting with Polymarket’s smart contracts.

- **Blockchain Backend:** The actual data and state changes happen on Polygon’s blockchain, where Polymarket’s smart contracts manage bets, funds, and outcomes in a decentralized and trustless manner.

### Why a Web2 Domain Is Used

- Using a regular domain allows easy access and familiar navigation for users on standard browsers without requiring specialized software.
- The frontend acts as a convenient interface to interact with underlying decentralized smart contracts, making blockchain functionality accessible without complex direct calls.
- MetaMask and similar wallet extensions enable secure cryptographic signing without exposing private keys to the web server.

### Summary

The Web2 website serves as a user-friendly interface that connects via Web3 protocols (through MetaMask) directly to Polymarket’s smart contracts on Polygon. The domain or server is a frontend layer only—user funds and actions are secured and executed on the blockchain, not by the website itself. This hybrid architecture is common to many dApps today, blending traditional web usability with decentralized trust and control.[1][2][3]

[1](https://rocknblock.io/blog/how-polymarket-works-the-tech-behind-prediction-markets)
[2](https://101blockchains.com/best-dapp-browsers/)
[3](https://docs.polymarket.com/developers/proxy-wallet)

Yes, it can be concluded that a Web3 domain is not strictly necessary to interact with smart contracts (SCs). Many popular decentralized applications (dApps) like Polymarket or Aave operate entirely over traditional Web2 domains while enabling users to connect their Web3 wallets, such as MetaMask, to interact with smart contracts on blockchains like Ethereum or Polygon.[1][2][3]

### Examples Like Aave Protocol
- Aave, a leading DeFi protocol, uses regular Web2 domains (e.g., aave.com) as the frontend interface.
- Users connect their MetaMask (or other wallet) through the website to interact with smart contracts deployed on Ethereum and other blockchains.
- The website is a Web2 portal that calls blockchain smart contracts off-chain via Web3 libraries without needing a blockchain-based domain.[2][1]

### Do You Need a Web3-Compatible Domain to Connect MetaMask?
- No, a Web3-compatible domain (like .crypto, .eth, or .brave) is not required for MetaMask or other wallets to connect and interact with smart contracts.
- MetaMask and wallets connect to dApps based on the website domain and Web3 libraries loaded in the browser, not exclusively on domain type.
- However, Web3 domains can improve the user experience by providing human-readable blockchain addresses and enabling seamless blockchain-native navigation in compatible browsers like Brave.[4][5][6]

### Web3 Domain and Browser Compatibility

- Browsers like Brave support Web3 domains natively, allowing seamless access to blockchain-based sites without extensions.
- But standard Web2 domains can still use browser extensions like MetaMask to enable full Web3 dApp functionality.
- So, using a Web3 domain is optional and enhances decentralization features but is not a necessity for interacting with smart contracts or connecting wallets.[5][6]

In summary, while Web3 domains enhance the decentralized web experience, interaction with smart contracts via MetaMask and dApps like Polymarket or Aave can fully function through traditional Web2 domains.


### PolyMarket

https://polygonscan.com/address/0x4d97dcd97ec945f40cf65f87097ace5ea0476045

<!-- 
twitter
https://x.com/Polymarket/status/1968374742844588469?t=iL9luRfaVkLctynB91JHaw&s=35 -->

{{< tweet user="Polymarket" id="iL9luRfaVkLctynB91JHaw" >}}


#### Optimistic Oracle

Polymarket uses **UMA's Optimistic Oracle** (OO) to validate the outcomes of its prediction markets. This system is designed as an escalation game to ensure accurate and timely resolutions.

**How it Works**

1.  **Proposing an Outcome**: When a market ends, anyone can propose a resolution by staking a bond in a cryptocurrency like USDC. This proposal is essentially a claim about what the correct outcome is.
2.  **Challenge Period**: After a proposal is made, there's a set "liveness" period (a challenge window). If no one disputes the proposed outcome during this time, the proposal is accepted as correct, and the market is settled.
3.  **Dispute Mechanism**: If someone disagrees with the proposed outcome, they can dispute it by staking an equal bond. This escalates the issue to UMA's **Data Verification Mechanism (DVM)**.
4.  **Token Holder Vote**: The DVM is a decentralized system where UMA token holders vote on the correct outcome. Voters are incentivized to be truthful because they lose their staked tokens if their vote is not with the majority. The decision of the DVM is considered the final, on-chain truth for the market's outcome.

More recently, Polymarket has started integrating **Chainlink oracles** for specific types of markets, such as those based on cryptocurrency prices. 

This allows for automated, tamper-resistant settlement without the need for human input, which helps to minimize disputes and accelerate payouts for these clear-cut events.

Yes, both **UMA's Optimistic Oracle (OO)** and **Chainlink** are designed to be decentralized, but they achieve that in very different ways and pull data from different sources.

UMA's Optimistic Oracle (OO)

UMA's system is a **human-powered oracle**. 

It doesn't "pull" data from a specific API or data feed in the traditional sense. Instead, it relies on a decentralized, human-based process.

* **Decentralization**: The decentralization comes from its core mechanism, the **Data Verification Mechanism (DVM)**. The DVM is a dispute resolution system secured by UMA token holders. Anyone can propose an outcome (the "asserter"), and anyone can challenge it (the "disputer"). If a dispute is raised, the decision is escalated to UMA's token holders, who vote on what the correct outcome is. The economic incentives are designed to ensure that voters act honestly and in the interest of the protocol. If you vote with the minority, you lose your staked tokens; if you vote with the majority, you are rewarded. This system makes it highly resistant to a single point of failure or corruption, as long as the cost to corrupt the vote (by acquiring over 51% of the UMA tokens) is higher than the potential profit from a fraudulent outcome.

* **Data Source**: The data is not "pulled" from a predefined source. It's an **"off-chain reality"** that's subject to verification. For a bet on an election, the proposed outcome would be based on real-world news and election results. For a bet on a sports match, it would be the official score. The system's strength is that it can resolve any "knowable truth" that can be verified by a human, even if the data isn't available from a structured API.

Chainlink Oracles

Chainlink's approach is also decentralized, but it's built around a network of node operators that pull data from external sources.

* **Decentralization**: Chainlink's decentralization is based on its **network of independent node operators**. Instead of relying on a single oracle, a smart contract can request data from multiple, geographically distributed nodes. This prevents any one node from being a single point of failure or censorship.

* **Data Source**: Chainlink nodes pull data from a variety of sources.
    * **Premium APIs**: They source data from multiple premium data providers.
    * **Data Aggregation**: The nodes aggregate this raw data from many sources (like different exchanges for a crypto price feed), eliminating outliers and potential manipulation from a single source.
    * **Proof of Reserve**: For stablecoins or other tokenized assets, Chainlink nodes can also pull data from public blockchain addresses to cryptographically verify that reserves exist.
    * **Generalized Data**: The system is flexible enough to pull data from a wide range of external sources, including weather data, sports scores, and other real-world information.

In summary, **UMA's Optimistic Oracle** is a human-centric, "optimistic" system that assumes a proposed outcome is correct unless proven otherwise by a decentralized community of token holders.

**Chainlink** is a network of machines that pulls data from multiple external, trusted sources and aggregates it to provide a single, reliable data point.

Both are decentralized, but they achieve security and data integrity through different architectural models.