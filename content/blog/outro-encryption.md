---
title: "Encryption. Captchas and more"
date: 2025-05-20
draft: false
tags: ["Outro","Security"]
description: 'SHA256 Protocol. The concept and applications: SSH, HTTPs, Bitcoin...'
url: 'encryption-101'
---

Some tools and concepts regarding encryption.

I started requiring this to fill some env variables of home lab docker containers.

Decided to consolidate them into this post.

## Captchas

### PoW Captcha

1. https://github.com/sequentialread/pow-bot-deterrent

>  A **proof-of-work based** bot deterrent. Lightweight, self-hosted and copyleft licensed. 

## The SHA256 Algorithm

* https://emn178.github.io/online-tools/sha256.html

[Lately](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#new-selfh-apps) I discovered a cool way to create unique keys:

```sh
openssl rand -base64 12 #for secrets
openssl rand -hex 32 #for apikeys
```

Those come very handy when deploying containers.

> Let's break down the SHA-256 protocol


**What is the SHA-256 Protocol?**

SHA-256 (Secure Hash Algorithm 256-bit) is a cryptographic hash function. 


{{< details title="More about SHA256 📌" closed="true" >}}


* **Cryptographic:** It's designed with security in mind, making it very difficult to reverse the process (find the original input from the output) or to find two different inputs that produce the same output (collision resistance).
* **Hash Function:** It takes an input of any arbitrary length (a message, a file, data, etc.) and produces a fixed-size output called a "hash" or "digest." For SHA-256, this output is always 256 bits long (which is 32 bytes or 64 hexadecimal characters).
* **Deterministic:** The same input will always produce the exact same output.

**Key Properties of SHA-256:**

* **One-way:** It's computationally infeasible to reverse the hashing process to find the original input from the hash value.
* **Collision-resistant:** It's extremely difficult (practically impossible with current technology) to find two different inputs that produce the same hash output.
* **Avalanche effect:** A small change in the input data will result in a drastically different hash output. This makes it very sensitive to even minor alterations.
* **Fixed output size:** Regardless of the size of the input, the output is always 256 bits.

{{< /details >}}

> Easy to encrypt, hard to decrypt!

**Does Bitcoin Implement SHA-256?**

**Bitcoin heavily relies on the SHA-256 hash function.**

It is a fundamental building block of the Bitcoin blockchain and is used in several crucial processes.

{{< details title="BTC x SHA256 📌" closed="true" >}}


* **Proof-of-Work:** Bitcoin's mining process involves repeatedly hashing block headers (which contain transaction information, a timestamp, and a reference to the previous block) along with a "nonce" (an arbitrary number). Miners compete to find a nonce that, when the entire block header is hashed using SHA-256, results in a hash value that meets a certain difficulty target (starts with a specific number of leading zeros).
* **Transaction Hashing:** Individual transactions are hashed using SHA-256 (often multiple times in a Merkle tree structure) to create a unique identifier for each transaction.
* **Merkle Trees:** Blocks in the Bitcoin blockchain organize transactions into a Merkle tree. SHA-256 is used to hash pairs of transaction IDs, and then hash the resulting hashes, and so on, up to the Merkle root. This provides an efficient way to verify if a specific transaction is included in a block.
* **Address Generation (Indirectly):** While Bitcoin addresses are not directly SHA-256 hashes, SHA-256 is used in the process of creating them (along with other hashing algorithms like RIPEMD-160).


{{< /details >}}

### SHA256 Python

**Can we has via Python Function?**

You might need to hash customer identifiable data or [PII](https://jalcocert.github.io/JAlcocerT/nlp-tools/) in many industries, like in [telco](https://jalcocert.github.io/JAlcocerT/telecom-concepts-101/)

```py
#from pyspark.sql import functions as f

def hash_mac(mac):
    mac = f.upper(mac)
    mac = f.regexp_replace(mac, '[-:]', '')
    mac = f.sha2(mac, 256)
    return mac
```

1.  **`mac = f.upper(mac)`:** Converts the input `mac` address to uppercase.
2.  **`mac = f.regexp_replace(mac, '[-:]', '')`:** Removes any hyphens (`-`) or colons (`:`) from the `mac` address string. This likely aims to standardize the MAC address format before hashing.
3.  **`mac = f.sha2(mac, 256)`:** This is the crucial part. It appears to be using a function (presumably from the library `f`) called `sha2` and passing the processed `mac` address and the integer `256` as arguments. **If this `f.sha2` function is indeed an implementation of the SHA-256 algorithm, then yes, this line is performing a SHA-256 hash on the modified MAC address.**

**In summary:**

* The function takes a MAC address as input.
* It standardizes the MAC address by converting it to uppercase and removing hyphens or colons.
* It then applies a hash function named `sha2` with a parameter `256`. **If `f.sha2` with the `256` parameter correctly implements the SHA-256 algorithm, then the function is indeed performing a SHA-256 hash.**


### SHA256 Online

**Can you convert with online tools or with Ubuntu CLI?**

**Yes, you can definitely convert (hash) strings to their SHA-256 representation using both online tools and the Ubuntu command-line interface (CLI).**

**1. Online Tools (like the one you linked):**

The website you provided, [https://emn178.github.io/online-tools/sha256.html](https://emn178.github.io/online-tools/sha256.html), is a perfect example of an online SHA-256 calculator. You can simply:

* Enter your input string (in this case, a standardized MAC address) into the text field.
* The tool will instantly compute and display the corresponding SHA-256 hash in hexadecimal format.

**2. Ubuntu CLI:**

Ubuntu (and most other Linux distributions) comes with command-line utilities that can perform cryptographic hashing. The most common one for SHA-256 is `sha256sum`.

**How to use `sha256sum`:**

* **To hash a string directly:** You can use the `echo` command to pipe the string to `sha256sum`. Be mindful of the newline character that `echo` adds by default. You might want to use the `-n` option to avoid it if you need to hash the exact string without a trailing newline.

```bash
echo -n "YOUR_STRING_HERE" | sha256sum
```

    Replace `"YOUR_STRING_HERE"` with the standardized MAC address you want to hash. The output will be the SHA-256 hash followed by a hyphen (`-`).

```bash
echo -n "0123456789AB" | sha256sum
# Output (example): a8fdc205a9f1939e69028f5c16191399c71a01d276c8a0d12c9c8769341286c7 -
```

* **To hash the content of a file:**

```bash
sha256sum your_file.txt
```

This will output the SHA-256 hash of the contents of `your_file.txt` along with the filename.

**Therefore, you have multiple ways to verify the SHA-256 hash of a standardized MAC address, both online and using the Ubuntu command line.** This can be useful for testing or confirming the output of your PySpark function for specific inputs.

### SSH x SHA256

[The SSH (Secure Shell) protocol](#faq) can and often does use the SHA-256 hashing algorithm, but it's not the *only* hashing algorithm it employs. 

SHA-256 is used in various parts of the SSH protocol for different purposes, contributing to its security.

Here's a breakdown of how SHA-256 is involved in SSH:

**1. Key Exchange Algorithms:**

* During the initial key exchange phase, the client and server negotiate a shared secret key. Several key exchange algorithms are used, and some of the modern and recommended ones utilize SHA-256 (or even stronger hashes like SHA-512) as part of their process.
* Examples of key exchange algorithms that use SHA-256 include:
    * `curve25519-sha256` (as defined in RFC 8731)
    * `diffie-hellman-group-exchange-sha256`
    * `ecdh-sha2-nistp256`

**2. Host Key Algorithms:**

* The SSH server authenticates itself to the client by presenting a host key. The client verifies this key to ensure it's connecting to the correct server and to prevent man-in-the-middle attacks.
* SHA-256 is used in newer host key formats for generating fingerprints of the host keys. For example, when you generate an SSH key pair using `ssh-keygen`, the fingerprint displayed often uses SHA-256. This fingerprint provides a shorter, more manageable way to identify and verify the host key.
* Newer RSA key formats like `rsa-sha2-256` and `rsa-sha2-512` also use SHA-256 and SHA-512 respectively for signing.

**3. Message Authentication Codes (MACs):**

* To ensure the integrity of the data transmitted over the SSH connection and to detect any tampering, SSH uses Message Authentication Codes (MACs).
* SHA-256 is a common and recommended hashing algorithm used in MAC algorithms for SSH. Examples include `hmac-sha2-256` and its Encrypt-then-MAC (ETM) variant `hmac-sha2-256-etm@openssh.com`.

**In summary:**

While SSH uses a variety of cryptographic algorithms for different aspects of the secure connection (including encryption ciphers like AES, key exchange algorithms like Diffie-Hellman and ECDH, and MAC algorithms), **SHA-256 is a significant and widely used hashing algorithm within the SSH protocol, particularly in modern and secure configurations.** 

It plays a crucial role in key exchange, host key verification, and ensuring data integrity.

It's important to note that the specific algorithms used by an SSH connection are negotiated between the client and the server during the initial handshake. 

The availability and preference of SHA-256 depend on the SSH client and server software and their configuration. 

Modern systems are generally configured to prefer stronger algorithms like those using SHA-256 over older, less secure options like SHA-1.

---

## FAQ

### Other Security Tools

If thinking about SSH made you wonder about security...


* **[Fail2Ban](https://fossengineer.com/setup-fail2ban-with-docker):** Your server's automated bouncer, kicking out repeat offenders based on log analysis.
* **[Endlessh](https://github.com/skeeto/endlessh):** Your server's sticky trap, wasting attackers' time on a fake service.
* **[Watchtower](https://fossengineer.com/setup-watchtower-with-docker/):** Your server's automated update manager for Docker containers.


{{< cards cols="1" >}}
  {{< card link="https://github.com/JAlcocerT/Docker/tree/main/Security" title="Security Docker | Container Config 🐋 ↗" >}}
{{< /cards >}}


{{< callout type="info" >}}
They serve completely different purposes in a self-hosted environment. One is about slowing down malicious actors, and the other is about maintaining your deployed services.
{{< /callout >}}


**Endlessh Project:**

* **What it is:** Endlessh is an **SSH tarpit**. Its purpose is to waste the time and resources of attackers who are trying to brute-force or scan your SSH server.
* **How it works:** When an attacker connects to Endlessh (which you'd typically run on your standard SSH port, like 22, while moving your *real* SSH server to a different, less common port), Endlessh doesn't immediately close the connection or present a standard SSH banner. Instead, it very slowly sends an endless, random stream of data that looks like an SSH banner. This keeps the attacker's client "stuck" for hours or even days, effectively bogging down their attack tools.
* **Goal:** To annoy, slow down, and ultimately deter automated scanning and brute-force attempts on your SSH server. It's a defensive security tool.
* **Self-hostable:** Yes, it's designed to be self-hosted. You run it on your own server.

**Watchtower Project:**

This name can refer to a few different things, but in the context of self-hosting and Docker, the most common "Watchtower" project you're likely referring to is:

* **Watchtower (containrrr/watchtower):** This is a **Docker container update automation tool**.
* **How it works:** Watchtower runs as a Docker container itself. It monitors your other running Docker containers and checks if the base images they are built from have newer versions available on Docker Hub or other registries. If a new version is found, Watchtower can automatically pull the new image, stop the old container, remove it, and then restart a new container with the updated image and the same parameters as the old one.
* **Goal:** To keep your Docker containers updated with the latest versions of their underlying images, which can include security patches, bug fixes, and new features, without manual intervention.
* **Self-hostable:** Yes, it's designed to be self-hosted and is itself a Docker container you deploy.

**Are they similar? No, not at all.**

* **Endlessh** is a **security tool** that acts as a decoy to defend against SSH brute-force attacks.
* **Watchtower** (the Docker one) is an **automation tool** for managing and updating Docker containers.


**Fail2ban** is another excellent security tool for self-hosted environments.

And it's quite different from both Endlessh and Watchtower, although it shares some defensive goals with Endlessh.

* **What it is:** Fail2ban is an **intrusion prevention framework** that scans log files (e.g., `/var/log/auth.log`, web server logs, mail server logs, etc.) for malicious patterns and then automatically blocks the IP addresses that exhibit suspicious behavior.
* **How it works:**
    1.  You define "jails" (configurations) for different services (SSH, web servers like Nginx/Apache, FTP, mail servers, etc.).
    2.  Each jail has a "filter" that defines the patterns to look for in log files (e.g., multiple failed SSH login attempts from the same IP, too many HTTP 404 errors, etc.).
    3.  When an IP address matches the predefined patterns within a specified time window, Fail2ban takes an action. The most common action is to **temporarily ban** the IP address using the server's firewall (like `iptables` or `ufw`).
    4.  After a defined ban time, the IP address is automatically unbanned.
* **Goal:** To mitigate brute-force attacks, dictionary attacks, and other automated scanning attempts against various network services by blocking the attacking IP addresses at the firewall level. It prevents attackers from making repeated attempts.
* **Self-hostable:** Yes, absolutely. It's a fundamental security tool often installed directly on Linux servers.


**Fail2Ban Project:**

* **What it is:** Fail2Ban is an **intrusion prevention software framework** that protects your server from brute-force attacks and other malicious activities by monitoring log files and automatically banning IP addresses that show suspicious behavior.
* **How it works:**
    1.  **Log Monitoring:** Fail2Ban continuously scans various log files on your server (e.g., `/var/log/auth.log` for SSH, Apache access logs, Nginx logs, mail server logs, etc.).
    2.  **Pattern Matching:** It uses regular expressions (defined in "filters") to identify specific patterns that indicate failed login attempts, port scans, or other unwanted actions.
    3.  **Jails:** These filters are grouped into "jails," where you define the service to monitor (e.g., `sshd` for SSH, `apache-auth` for Apache login attempts), the maximum number of failed attempts (`maxretry`), and the time window (`findtime`) within which those attempts must occur.
    4.  **Banning:** If an IP address exceeds the defined `maxretry` within the `findtime`, Fail2Ban takes an "action." The most common action is to update your server's firewall rules (like `iptables` or `nftables`) to temporarily block that IP address for a specified duration (`bantime`).
    5.  **Unbanning:** After the `bantime` expires, Fail2Ban automatically unbans the IP address, allowing it to connect again. This prevents permanent lockouts for legitimate users who might have simply mistyped their password a few times.
* **Goal:** To prevent automated brute-force attacks, reduce server load from malicious traffic, and secure various services by dynamically blocking abusive IP addresses.
* **Self-hostable:** Yes, it's a daemon designed to be installed and run on your Linux server.

**How Fail2Ban compares to Endlessh and Watchtower:**

They are all valuable for self-hosting, but they serve distinct purposes and operate at different layers:

1.  **Fail2Ban vs. Endlessh:**
    * **Fail2Ban:** *Reactive* security. It waits for failed attempts to appear in logs and then blocks the IP. It's for services you want to keep available (like your real SSH, web server, etc.) but want to protect from abuse.
    * **Endlessh:** *Proactive/Deceptive* security. It acts as a fake SSH server to endlessly tie up attackers' resources *before* they even interact with your real services. You'd typically run Endlessh on port 22 and your real SSH on a different port.
    * **Synergy:** They can actually work together! Some setups use Fail2Ban to detect IPs that connect to Endlessh (or other services) and then ban those IPs from *all* your services, including your *real* SSH or web server. This adds another layer of defense, ensuring that persistent attackers who hit your tarpit are then blocked from everything else.
