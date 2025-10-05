---
title: "Encryption, Captchas, OpenIDConnect and more"
date: 2025-05-20
draft: false
tags: ["Outro","Security","PoW","Clave","E-Residency","openssl","OIDC vs OAuth","Bearer JWT","Criptii"]
description: 'SHA256 Protocol vs RSA. The concept and applications: SSH, HTTPs, Bitcoin...'
url: 'encryption-101'
---

**Tl;DR**

The difference between *who you are* and *what you can do*, explained with [OIDC and OAuth](#oidc-vs-oauth)

**Intro**

Some tools and concepts regarding encryption.

I started requiring this to fill some env variables of home lab docker containers.

Decided to consolidate them into this post.

> You also have examples for how few countries handle citizen security: ES, NL and EE [below](#countries-and-users)

## Captchas

Internet is full of bots.

How about making their life harder?

### PoW Captcha

1. https://github.com/sequentialread/pow-bot-deterrent

>  A **proof-of-work based** bot deterrent. Lightweight, self-hosted and copyleft licensed. 

2. https://github.com/tiagorangel1/cap

* https://capjs.js.org/

Cap is a lightweight, modern open-source CAPTCHA alternative designed using SHA-256 proof-of-work

> I discovered it recently, [here](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/)

## The SHA256 Algorithm

* You can generate SHA256 via this static tool: https://emn178.github.io/online-tools/sha256.html

[Lately](https://jalcocert.github.io/JAlcocerT/selfhosted-apps-may-2025/#new-selfh-apps) I discovered a cool way to create unique keys:

```sh
openssl rand -base64 12 #for secrets
openssl rand -hex 32 #for apikeys
```

Those will be useful for you if you are having a [HomeLab](https://github.com/JAlcocerT/Home-Lab).

For [flask](https://jalcocert.github.io/JAlcocerT/web-apps-with-python/#flask) cookies secrets:

```sh
# ~256-bit
openssl rand -base64 32
```

Other example? For [Typebot](https://jalcocert.github.io/JAlcocerT/free-open-source-chat-bots/#typebot) we need :

```sh
openssl rand -base64 24 | head -c 32
```

Those come very handy when deploying containers.

> Let's break down the SHA-256 protocol


**What is the SHA-256 Protocol?**

SHA-256 (Secure Hash Algorithm 256-bit) is a cryptographic hash function. 

{{< details title="More about SHA256... 📌" closed="true" >}}

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

**Does Bitcoin Implement SHA-256?** Yes, Bitcoin heavily relies on the SHA-256 hash function.

It is a fundamental building block of the Bitcoin blockchain and is used in several crucial processes.

{{< details title="BTC x SHA256 📌" closed="true" >}}

* **Proof-of-Work:** Bitcoin's mining process involves repeatedly hashing block headers (which contain transaction information, a timestamp, and a reference to the previous block) along with a "nonce" (an arbitrary number). Miners compete to find a nonce that, when the entire block header is hashed using SHA-256, results in a hash value that meets a certain difficulty target (starts with a specific number of leading zeros).

* **Transaction Hashing:** Individual transactions are hashed using SHA-256 (often multiple times in a Merkle tree structure) to create a unique 
identifier for each transaction.

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
    mac = f.regexp_replace(mac, '[-:]', '') #clean regex https://it-tools.tech/regex-memo
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


No, it is not possible to know with certainty what kind of hash function was applied to a MAC address just by looking at the hash output. 

This is because cryptographic hash functions are designed to be **one-way** and produce outputs that are **indistinguishable from random**. 

The same MAC address will always produce the same hash, but it's computationally infeasible to reverse the process and get the original MAC address from the hash.

> However, you can make an educated guess by analyzing the **length and format** of the hash!

**Key Clues for Identifying a Hash**

* **Hash Length:** Each hashing algorithm produces an output of a fixed length. For example, an SHA-256 hash will always be 64 hexadecimal characters long, while an MD5 hash is always 32 characters long.
    * **MD5:** 32 hex characters
    * **SHA-1:** 40 hex characters
    * **SHA-256:** 64 hex characters
    * **SHA-512:** 128 hex characters
* **Format:** Some hashes, especially those used for passwords, include a prefix or a specific character set that can help identify them. For example, some hash formats used with a "salt" (a random string of data) may contain dollar signs ($) as delimiters. 

By comparing the length of the hash you have to the known lengths of common algorithms, you can narrow down the possibilities.

> For instance, if you have a 64-character hash, it's very likely to be SHA-256, but it could also be a different algorithm that produces a 256-bit output.

### SHA256 Online

**Can you convert with online tools or with Ubuntu CLI?**

You can definitely convert (hash) strings to their SHA-256 representation using both online tools and the Ubuntu command-line interface (CLI).

**1. Online Tools (like the one you linked):**

The website  [https://emn178.github.io/online-tools/sha256.html](https://emn178.github.io/online-tools/sha256.html), is a perfect example of an online SHA-256 calculator. You can simply:

* Enter your input string (in this case, a standardized MAC address) into the text field.
* The tool will instantly compute and display the corresponding SHA-256 hash in hexadecimal format.

**2. Ubuntu CLI:**

Ubuntu (and most other Linux distributions) comes with command-line utilities that can perform cryptographic hashing. 

The most common one for SHA-256 is `sha256sum`.

3. Via IT-Tools: https://it-tools.tech/hash-text

**How to use `sha256sum`:**

* **To hash a string directly:** You can use the `echo` command to pipe the string to `sha256sum`. Be mindful of the newline character that `echo` adds by default. 

You might want to use the `-n` option to avoid it if you need to hash the exact string without a trailing newline.

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

**Therefore, you have multiple ways to verify the SHA-256 hash of a standardized MAC address, both online and using the Ubuntu command line.** 

This can be useful for testing or confirming the output of your PySpark function for specific inputs.

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

## Conclusions

This is another rabbit-hole.

There are interesting online videos about it, like some online misteries using [Ceasar cipher](https://es.wikipedia.org/wiki/Cifrado_C%C3%A9sar).

> See https://github.com/cryptii/cryptii

> > MIT |  A web app for modular conversion, encoding, and encryption, all performed directly in your browser with no server interaction 

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

### OIDC vs OAUTH

OAuth and OpenID Connect (OIDC) are often used together but serve different purposes. 

**OAuth** is for **authorization**—granting an application permission to access a user's data on another service. **OIDC** is for **authentication**—verifying a user's identity.

* **OAuth (Open Authorization)**: Think of it as a valet key for your car. You give the valet the key (an **access token**) that only allows them to park your car, but they can't access your glove compartment or drive away with it. This is similar to how you might allow an app to access your Google Calendar to schedule an event without ever giving the app your Google password. 

The app is **authorized** to perform a specific action on your behalf, but it doesn't know who you are.

* **OIDC (OpenID Connect)**: This protocol is a layer built on top of OAuth 2.0. Its primary purpose is to verify a user's identity. In addition to the access token from OAuth, OIDC provides an **ID token** (a JSON Web Token or JWT). 

This ID token contains information about the user, like their name and email, which the application can use to confirm the user's identity.

This is what's happening when you see a "Sign in with Google" or "Log in with Facebook" button.

> You're authenticating with a trusted identity provider (like Google or Facebook), which then tells the application who you are.

The relationship between them is:* **OIDC = Authentication (Who the user is) + OAuth (What the user can do)**

#### Which Is Better?

It's not that one is better than the other; they're designed for different jobs.

* Use **OAuth** when you only need to **authorize access to resources** without authenticating the user. For example, a photo printing service may need authorization to access your photos on a cloud storage provider.

* Use **OIDC** when you need to **authenticate a user for a login flow** and may also need to authorize access to their resources. The vast majority of modern login systems, especially those using single sign-on (SSO), use OIDC because it provides a complete solution for both authentication and authorization.

#### Are They Cookie-Based Authentication?

No, OAuth and OIDC are not inherently cookie-based authentication. 

They are **token-based authentication** systems.

* **Token-Based Authentication**: After a user is authenticated or authorized, the server issues a unique token (like an access token or ID token). 

This token is then stored on the client side (e.g., in local storage, session storage, or sometimes a cookie). The client sends this token with every subsequent request to prove its identity or authorization to the server. The server can then validate the token without needing to store any session information. 

This makes them **stateless** and highly scalable.

* **Cookie-Based Authentication**: This is a more traditional method where the server creates a **session** for the user after they log in and stores a **session ID** in a cookie on the user's browser. The browser then automatically sends this cookie with every request. The server uses this session ID to look up the user's session data on the server side.

This method is **stateful**, as the server must maintain a record of all active sessions.

> While you *can* store an OAuth/OIDC token in a cookie, it's not the primary mechanism of these protocols.

The core of OAuth and OIDC is the token itself, which can be passed in different ways (e.g., via a request header), making it more flexible and suitable for modern applications like mobile apps and APIs that don't rely on traditional browser sessions.


{{< details title="Sample PB Auth Flow | OIDC 📌" closed="true" >}}

Neither **OAuth** nor **OIDC** directly handles the specific setup of a static site generator with Cloudflare Workers and PocketBase.

 However, **OIDC is the protocol you'd use for the authentication part of the solution**.

Here's how those technologies would work together to create a login-gated static site:

1. Static Site Generator (SSG)

A static site generator (like Hugo, Astro, or Next.js in static mode) pre-renders all the HTML, CSS, and JavaScript for your website. This means the content is generated once and then served as static files, making it incredibly fast. The key here is that the site itself has no dynamic server-side code to handle authentication on its own.

2. Cloudflare Workers

Cloudflare Workers act as a serverless function layer that runs on Cloudflare's global network. You'd use a Worker to act as a **middleware** or a "proxy" in front of your static site. The Worker would check for a user's login status before serving the content.

* When a user tries to access a protected page, the request first hits the Cloudflare Worker.
* The Worker checks for a valid **authentication token**.
* If the token is valid, the Worker allows the request to pass through and serves the static page.
* If the token is missing or invalid, the Worker intercepts the request and redirects the user to a login page.

3. PocketBase
PocketBase is a backend service that provides a database and, crucially for this use case, built-in **authentication management**. It handles the user accounts, passwords, and the authentication process. It would act as the identity provider.

* When a user logs in on your site (likely via a form), the Cloudflare Worker sends their credentials to PocketBase.
* PocketBase validates the credentials and, upon success, issues a **JWT (JSON Web Token)**.
* The Cloudflare Worker then receives this token and stores it in the user's browser, likely in a cookie or local storage, for future requests.

**The Authentication Flow**

The authentication flow for this setup is essentially an **OIDC-like process** driven by a custom implementation:

1.  A user navigates to `example.com/protected-page`.
2.  The Cloudflare Worker intercepts the request and checks for an authentication token. There isn't one yet.
3.  The Worker redirects the user to `example.com/login`.
4.  The user enters their credentials, which are sent via JavaScript to the PocketBase API.
5.  PocketBase validates the credentials and returns a JSON Web Token.
6.  The browser stores this token (e.g., in a secure cookie).
7.  The user is redirected back to `example.com/protected-page`.
8.  This time, the request includes the authentication token.
9.  The Cloudflare Worker validates the token against PocketBase's public key (to ensure it's authentic and not expired).
10. Since the token is valid, the Worker serves the pre-rendered static page.

In this scenario, you're building a system that replicates the core functionality of OIDC—authenticating a user and issuing a token that proves their identity—without relying on a full-blown, off-the-shelf OIDC provider.

{{< /details >}}



#### Bearer vs JWT

A **bearer token** is a cryptic string of characters that grants access to the "bearer" -whoever possesses it.

> See https://www.jwt.io/


{{< details title="JWT io tool and bearer authentication... 📌" closed="true" >}}

jwt.io is a popular online resource and tool for working with JSON Web Tokens (JWTs).

It helps developers decode, verify, and generate JWTs. JWTs are a specific token format used to securely transmit claims between parties.

Bearer tokens refer to a type of access token used in HTTP authentication, where the token is presented by the "bearer" to gain access to a resource.

JWTs are often used as bearer tokens because they are compact, self-contained tokens that can carry authenticated user information.

In practical terms, when a JWT is used as a bearer token, it is sent in the HTTP Authorization header like this:

```
Authorization: Bearer <JWT>
```

jwt.io relates to this process by providing tools and documentation to understand the contents and structure of these JWT bearer tokens, and by helping with JWT validation mechanisms such as verifying signatures and token integrity.

In summary:

- JWT is a secure token format that encapsulates claims for authentication/authorization.
- Bearer token is a concept where possession of the token grants access; JWTs are commonly used bearer tokens.
- jwt.io is a helpful resource for decoding, understanding, and validating JWTs used as bearer tokens.
- JWT bearer tokens are sent in HTTP requests in the Authorization header as "Bearer <token>".

Yes, exactly. A JWT bearer token is what you typically include in the HTTP headers of a curl request (or any HTTP client) to authenticate GET or POST requests.

Specifically, you add an Authorization header with the value:

```
Authorization: Bearer <your-jwt-token>
```

This tells the server that you are presenting a bearer token (in this case, a JWT) as proof of your authenticated identity or access rights. The server then validates the JWT (checking its signature, expiration, and claims) before allowing access to the requested resource.

So whenever an API requires JWT authentication, sending the JWT as a bearer token in the Authorization header is a common method for securing GET, POST, or other requests.

This is the standard practice for JWT authentication in APIs and web services.

[2](https://swagger.io/docs/specification/v3_0/authentication/bearer-authentication/)

JWTs and API keys are both methods used for API authentication, but they differ significantly in structure, use cases, and security.

- API keys are simple, opaque identifiers (typically just strings) issued to clients to authenticate API requests. 

**The key itself carries no embedded information**; the server stores all metadata about what the key grants access to. API keys are easy to implement and widely used in many public APIs for straightforward client identification. However, they offer limited security features, usually don’t expire unless explicitly revoked, and cannot carry fine-grained permissions within the key itself.

- JWTs (JSON Web Tokens) are self-contained tokens that embed claims (information about the user, client, scopes, expiry) and are **digitally signed**.

Because the token carries its own metadata, the API can verify the JWT signature without querying a central database, making JWTs more scalable and stateless. JWTs are often used within OAuth2 frameworks to provide fine-grained access control, short-lived credentials, and identity information.

They require more complex implementation but are better for distributed and secure environments.

To summarize in a table:

| Feature               | API Key                               | JWT                                       |
|-----------------------|-------------------------------------|-------------------------------------------|
| Structure             | Opaque string                       | JSON data with header, payload, signature |
| Contains permissions  | No (server stores them)             | Yes (embedded in token claims)            |
| Expiry                | Usually none or manual revocation   | Usually short-lived with automatic expiry |
| Validation            | Lookup in server                    | Signature verification without lookup      |
| Security              | Basic, vulnerable if leaked        | Stronger, signed and sometimes encrypted  |
| Use Case              | Simple authentication               | Stateless, fine-grained auth and authorization |
| Revocation            | Must be manually managed            | Short expiry reduces risk of misuse        |

Both API keys and JWTs can be sent in headers as bearer tokens, but JWTs offer more scalable, secure, and feature-rich authentication solutions, especially for microservices and OAuth2 based systems. API keys remain popular for simplicity and ease of use in many public-facing APIs.

> jwt.io focuses on JWTs—helping with decoding, validating, and understanding these tokens rather than opaque API keys.

This explains how JWTs relate to API keys in the context of API authentication.A JWT (JSON Web Token) is a self-contained token used for authentication that includes user or client information and is digitally signed for verification. 

An API key is a simpler, opaque identifier that serves as a secret token for client authentication but does not carry any embedded data.

JWTs and API keys both authenticate API requests but differ in complexity and capabilities: JWTs carry embedded claims (like user identity, scopes, and expiration) and can be verified without server lookups, enabling stateless and scalable security. API keys require the server to look up permissions but are easier to manage and implement.

Often, JWTs are used as bearer tokens in the Authorization header for secure API access, while API keys may be passed similarly or in query parameters.

In summary, JWTs provide richer, more secure, and scalable authentication features, while API keys offer simplicity and ease of use.

jwt.io specifically helps with JWT creation, decoding, and validation—not with API key management.

| Feature            | API Key                  | JWT (JSON Web Token)              |
|--------------------|--------------------------|---------------------------------|
| Structure          | Opaque string            | Signed JSON token with claims   |
| Contains data      | No                       | Yes (identity, permissions)     |
| Validation         | Server lookup required   | Signature verification only     |
| Expiration         | None or manual           | Typically short-lived tokens    |
| Security           | Basic                    | Stronger, using cryptographic signatures |
| Use case           | Simple APIs, easy usage  | Secure, stateless APIs with fine-grained access control |

Both can be sent as bearer tokens in HTTP headers, but JWTs are more advanced and suitable for modern secure APIs.[2][3][5][6][1]

[1](https://zuplo.com/learning-center/jwt-vs-api-key-authentication)
[2](https://www.scalekit.com/blog/apikey-jwt-comparison)
[3](https://tyk.io/learning-center/api-keys-vs-token/)
[4](https://www.youtube.com/watch?v=GcVtElYa17s)
[5](https://zapier.com/engineering/apikey-oauth-jwt/)
[6](https://zuplo.com/learning-center/top-7-api-authentication-methods-compared)
[7](https://www.gomomento.com/blog/api-keys-vs-tokens-whats-the-difference/)


{{< /details >}}


It's the most common type of credential used to secure protected API endpoints. 

Here's how it relates to protected endpoints:

**How It Works**

1.  **Authentication**: When a user logs in (e.g., with a username and password), the server verifies their credentials.
2.  **Token Issuance**: After a successful login, the server generates a **unique bearer token** and sends it back to the client. This token is often a **JSON Web Token (JWT)**, which is a self-contained token that includes user data and an expiration time.

> See https://it-tools.tech/jwt-parser

> > Parse and decode your JSON Web Token (jwt) and display its content.


{{< details title="JWT is a type of Bearer and it works via SHA256! 📌" closed="true" >}}

A **JSON Web Token (JWT)** is a type of bearer token and the SHA-256 is the cryptographic workhorse that provides the security for many JWTs.

**How They're Related 🤝**

The relationship lies in the JWT's **signature**. A JWT has three parts:
1.  **Header:** Contains metadata about the token, including the signature algorithm being used.
2.  **Payload:** Contains the claims (user data, expiration time, etc.).
3.  **Signature:** This is what makes the JWT secure.

The signature is created by taking the encoded header, the encoded payload, and a secret key, then running them through a cryptographic algorithm. **SHA-256 is a common algorithm used for this exact purpose.**

A very common algorithm for signing a JWT is **HS256**. In this name:
* **HS** stands for **HMAC** (Hash-based Message Authentication Code).
* **256** refers to **SHA-256**.

When the server receives a JWT, it performs the same calculation using the header, payload, and the secret key it holds.

It then compares the signature it just created with the signature provided in the token. 

If they match, the token is considered valid and has not been tampered with.

Remember: SHA-256 (Secure Hash Algorithm 256-bit) is a **cryptographic hash function**. 

It's a one-way function that takes an input (of any size) and produces a fixed-size, 256-bit (32-byte) output called a **hash value** or **digest**.

Hash functions are designed to be:

* **One-way**: You can't reverse the process to get the original input from the hash.
* **Deterministic**: The same input will always produce the same hash.
* **Unique**: A small change to the input will produce a completely different hash.

Because of these properties, SHA-256 is perfect for ensuring the integrity of a JWT's data.

If an attacker modifies the payload of a JWT, the signature validation will fail, and the protected endpoint will reject the request.

{{< /details >}}


{{< details title="JWT Bearer and Authentication Working | Example PB vs FastAPI 📌" closed="true" >}}

An authentication flow using a JWT bearer token.

Here's a step-by-step breakdown of what happens **under the hood when you use PocketBase** for this process.

**The Authentication Flow**

1.  **Client Sends Credentials**: The user enters their username (or email) and password on your login page. When they click "submit," your frontend code sends a `POST` request to PocketBase's authentication endpoint (`/api/collections/users/auth-with-password`). This is a standard, un-protected endpoint that's designed to accept credentials.

2.  **Server Validates Credentials**: PocketBase receives the request. It looks up the user in its embedded SQLite database, verifies that the password is correct, and checks for any other security conditions (e.g., if the account is active).

3.  **Server Issues the JWT**: If the credentials are valid, PocketBase does a few things:
    * It generates a **JSON Web Token (JWT)**. This token contains a header, a payload (with claims like the user's ID, email, and a token expiration time), and a signature.
    * It packages this JWT and some user information into a JSON response.
    * It sends this response back to your browser. The JWT is the **bearer token**.

4.  **Client Stores the Token**: Your frontend code receives the response. It extracts the JWT from the JSON payload and stores it somewhere on the client side, typically in **local storage** or a **cookie**. From this point on, the browser "bears" the token.

5.  **Client Accesses Protected Content**: When you try to view a protected page or access a protected endpoint, your frontend automatically includes the stored JWT in the `Authorization` header of the request, formatted as `Authorization: Bearer <token>`.

6.  **Server Validates the Token**: PocketBase receives the new request. It extracts the bearer token from the header, validates its signature (using the secret key it holds), and checks if it's expired. If the token is valid, PocketBase knows who the user is without having to look them up in the database again. It then grants access to the requested content. If the token is invalid, it denies the request with a `401 Unauthorized` error.

This process allows your user to stay logged in and access private content across multiple pages without having to enter their credentials every single time.

{{< /details >}}


3.  **Accessing Protected Endpoints**: For every subsequent request to a protected endpoint, the client must include this token in the `Authorization` header of the HTTP request, in the format `Authorization: Bearer <token>`.
4.  **Authorization**: The server receives the request, extracts the bearer token, and validates it. If the token is valid, the server grants access to the endpoint. If not, it rejects the request, typically with a **401 Unauthorized** status code.

**Bearer Tokens with PocketBase vs. Flask/FastAPI**

The relationship is the same across all three, but the implementation is very different.

* **PocketBase:** PocketBase handles the entire process for you. When a user authenticates, PocketBase automatically generates and returns a JWT. Then, when you define a protected collection with an API rule, it automatically validates the bearer token in the `Authorization` header for you on every request. You never have to write any code to handle token issuance or validation.

* **Flask/FastAPI:** In these frameworks, you must manually implement the entire bearer token flow. You would need to:
    * Write a login endpoint that generates and returns a JWT after successful authentication (using a library like `PyJWT`).
    * Add middleware or a dependency to your protected routes that checks for the `Authorization: Bearer <token>` header.
    * Validate the token's signature and expiration time to ensure it hasn't been tampered with or expired.

{{< callout type="info" >}}
A bearer token is the standard key for a protected endpoint, and while PocketBase gives you the key automatically, Flask and FastAPI make you build the lock and key system yourself.
{{< /callout >}}

### RSA vs SHA256

SHA-256 and RSA are both cryptographic tools, but they serve fundamentally different purposes. The key difference is that **SHA-256 is a hashing algorithm**, while **RSA is an encryption algorithm.**

Let's break down what that means.

#### SHA-256: Hashing 🔒

**SHA-256** (Secure Hash Algorithm 256-bit) is a one-way mathematical function. It takes any input—a text file, an image, or a long password—and produces a fixed-length string of 256 bits (or 64 hexadecimal characters), called a **hash** or **digest**.

* **One-Way:** You can easily calculate the hash from the original data, but it's computationally infeasible to reverse the process and get the original data back from the hash. This makes it perfect for verifying data integrity.
* **Unique Fingerprint:** Even a tiny change to the original data will result in a completely different hash. This property is used to verify that a file hasn't been tampered with.
* **Example Use:** Password storage. A website stores the SHA-256 hash of your password instead of the password itself. When you log in, it hashes the password you enter and compares the new hash to the stored one. If they match, you're authenticated. Even if the database is breached, the attacker only gets the hashes, not the actual passwords.

#### RSA: Encryption 🔑

**RSA** (Rivest-Shamir-Adleman) is a two-way **asymmetric encryption** algorithm. It uses a **pair of keys**—a public key and a private key—to encrypt and decrypt data.

* **Asymmetric:** The public key can be shared with anyone and is used for encryption, but only the corresponding private key can decrypt the data. This is the core of its security.
* **Two-Way:** It's designed to be reversible. Data encrypted with the public key can be decrypted with the private key, and data encrypted with the private key can be decrypted with the public key.
* **Example Use:** Secure communication. When you visit a secure website (using HTTPS), your browser uses the website's public key to encrypt a secret session key. That encrypted key is sent to the server, which is the only one with the private key to decrypt it. This allows for a secure, private communication channel. 

---

The Combination: Digital Signatures ✍️

In many real-world applications, SHA-256 and RSA are used together to create a **digital signature**. This process ensures both **data integrity** and **sender authenticity**.

1.  **Hashing:** The sender takes a document and generates a SHA-256 hash of it. This creates a unique "fingerprint" of the document.
2.  **Encryption:** The sender then **encrypts this hash using their own private RSA key**. The result is the digital signature.
3.  **Verification:** The sender sends the original document and the digital signature to the recipient.
4.  **Decryption & Comparison:** The recipient uses the sender's public RSA key to decrypt the signature, which reveals the original hash. The recipient then independently generates a new SHA-256 hash of the received document.
5.  **Authenticity Check:** The recipient compares the two hashes. If they match, they can be sure that the document hasn't been tampered with and that it came from the rightful owner of the private key.

---

## Countries and Users

La principal diferencia entre el certificado digital y el sistema Cl@ve del Gobierno de España radica en su **función principal y en el tipo de seguridad que ofrecen**. 

> Aunque ambos permiten realizar trámites con la Administración Pública, no son lo mismo.

Aquí tienes un desglose de las diferencias clave:

### 1. Certificado Digital

* **¿Qué es?** Es un documento digital que te identifica de forma segura en internet. Es un fichero informático (o un chip en el caso del DNIe) que vincula tus datos de identidad a una persona física o jurídica.
* **Función principal:** Además de la identificación, su característica más importante es la **firma digital**. Permite firmar documentos electrónicamente con la misma validez legal que una firma manuscrita.
* **Seguridad y validez:** Ofrece un nivel de seguridad muy alto. Su validez es de varios años y su uso no está limitado a un solo trámite.
* **Uso:** Es ideal para trámites que requieren un alto grado de seguridad o la firma de documentos, como la presentación de impuestos, recursos, reclamaciones o la firma de contratos.
* **Obtención:** Requiere un proceso de acreditación de identidad, que puede ser presencial en una oficina (como las de la Fábrica Nacional de Moneda y Timbre, FNMT) o mediante videoidentificación. El DNIe es un tipo de certificado digital.

### 2. Sistema Cl@ve

* **¿Qué es?** Es una plataforma de identificación electrónica para acceder a los servicios de la Administración Pública, pero que no sirve para la firma de documentos.
* **Función principal:** Facilita el acceso a trámites electrónicos de forma sencilla, sin necesidad de instalar software o tener un dispositivo adicional. Se basa en el uso de un código de usuario (tu DNI/NIE) y una contraseña.
* **Modalidades:** Existen dos tipos principales:
    * **Cl@ve PIN:** Es una clave temporal, válida por un tiempo limitado (unos minutos), que se utiliza para un trámite específico. Es útil para gestiones puntuales.
    * **Cl@ve Permanente:** Es una contraseña de larga duración (24 meses) que se usa de forma recurrente para acceder a los servicios. A menudo, se refuerza con un código de un solo uso (OTP) enviado por SMS.
* **Seguridad y validez:** Su seguridad se basa en la combinación de usuario y contraseña, y en algunos casos, un código de un solo uso. No permite la firma digital de documentos.
* **Uso:** Es muy cómodo para realizar consultas o gestiones sencillas con la Agencia Tributaria, la Seguridad Social, el SEPE, etc. Es una buena opción para usuarios que no necesitan firmar documentos de forma habitual.
* **Obtención:** El registro es más simple que el del certificado digital, y se puede hacer de forma online (con carta de invitación o videoidentificación) o presencial.

**En resumen:**

| Característica | Certificado Digital | Cl@ve |
| :--- | :--- | :--- |
| **Función principal** | Identificación y **firma digital** | Identificación y autenticación |
| **Tipo de documento** | Fichero informático o chip (DNIe) | Sistema de contraseñas |
| **Usos** | Trámites que requieren firma (impuestos, recursos, contratos) | Trámites de consulta o gestiones sencillas |
| **Validez** | Varios años, no limitado a un solo trámite | Cl@ve PIN (temporal), Cl@ve Permanente (24 meses) |
| **Nivel de seguridad** | Alto, incluye firma legalmente válida | Alto para acceso, pero no para firma |
| **Obtención** | Requiere acreditación presencial o videoidentificación | Registro más sencillo, online o presencial |

En conclusión, si necesitas firmar documentos electrónicos de manera legal, el **certificado digital** es la herramienta adecuada.

Si solo buscas una forma ágil y segura de acceder y realizar consultas en las sedes electrónicas de las administraciones, el sistema **Cl@ve** es una opción más cómoda y sencilla.

El modelo de Estonia, con su programa de e-Residency y las e-cards, es un referente mundial en la digitalización de la administración pública y los negocios.

Se diferencia del sistema español en varios aspectos clave, especialmente en su enfoque y en la tecnología utilizada.

### ¿Qué es la e-Residency?

La "e-Residency" (residencia electrónica) de Estonia es un programa único que permite a cualquier persona del mundo, sin importar su nacionalidad, obtener una identidad digital emitida por el gobierno estonio.

**No es una residencia física, ni una ciudadanía, ni un permiso de viaje.** 

Es una identidad digital que te da acceso al ecosistema digital de Estonia.

### ¿Qué son las "e-cards"?

La "e-card" (tarjeta electrónica) es la tarjeta de identidad física que se entrega a los e-residents. Es similar a una tarjeta de crédito, con un chip inteligente incorporado. Es el equivalente estonio del DNIe español. 

Su función es la de un **dispositivo de autenticación segura y de firma digital**.

### Diferencias clave con el modelo español (Certificado Digital y Cl@ve)

1.  **Enfoque de negocios global:** El programa de e-Residency de Estonia está diseñado principalmente para emprendedores, freelancers y nómadas digitales que quieren crear y gestionar una empresa en la Unión Europea de forma 100% remota. El objetivo es atraer inversión y talento global. El sistema español, en cambio, está enfocado en facilitar los trámites a los ciudadanos y residentes de España.

2.  **Tecnología y usabilidad:**
    * **Estonia:** La e-card se basa en una infraestructura de clave pública (PKI) y se usa con un lector de tarjetas y un software específico. El sistema es robusto y permite la **firma digital cualificada**, que tiene la misma validez legal que una firma manuscrita en toda la UE (gracias al reglamento eIDAS). La clave es que la tarjeta física te da una identidad digital que puedes usar para todo, desde firmar contratos hasta declarar impuestos, desde cualquier lugar del mundo.
    * **España:** El DNIe (que es un tipo de certificado digital) funciona de manera similar a la e-card, pero su uso no está tan extendido o integrado en el día a día. Cl@ve, por su parte, es un sistema basado en contraseñas y códigos SMS, más sencillo de usar pero sin la capacidad de firma digital cualificada. El modelo estonio se centra en la "e-card" como la única llave maestra para un vasto ecosistema de servicios digitales.

3.  **Integración de servicios:** El gobierno estonio ha integrado casi todos sus servicios públicos en su plataforma digital. Con la e-card, un e-resident puede:
    * Crear una empresa en la UE en un solo día.
    * Firmar documentos y contratos con validez legal.
    * Declarar impuestos online.
    * Acceder a servicios bancarios y de pago.
    * Participar en la toma de decisiones de su empresa.
    * Y mucho más.

    En España, aunque la digitalización ha avanzado mucho (con la Sede Electrónica de la AEAT, la Seguridad Social, etc.), todavía hay una fragmentación de servicios. El certificado digital te da acceso a muchos de ellos, pero el nivel de integración no es tan completo ni transparente como el de Estonia.

**Resumen de la diferencia**

Mientras que en España tienes dos herramientas (certificado digital para trámites complejos y firma, y Cl@ve para acceso sencillo), en Estonia, la **e-card de e-Residency es una única llave maestra y de uso universal** para el mundo de los negocios digitales. Su enfoque es un "todo-en-uno" que no solo te identifica, sino que te permite operar de manera remota en un entorno de negocios digital, transparente y legalmente reconocido a nivel de la UE.

En esencia, la gran diferencia es que Estonia no solo digitalizó su administración, sino que la diseñó desde cero para ser global, atrayendo a emprendedores y capital de todo el mundo a través de un simple documento de identidad digital.

El caso de los Países Bajos con su sistema **DigiD** (que significa "Identidad Digital") es otro ejemplo interesante de cómo un país ha abordado la identificación electrónica, y tiene similitudes y diferencias con los modelos de España y Estonia.

### ¿Qué es DigiD?

DigiD es el sistema de identificación en línea que usan los ciudadanos y residentes de los Países Bajos para acceder a servicios gubernamentales, de salud, educación y pensiones.

Es una herramienta esencial para la vida diaria en los Países Bajos.

Su principal propósito es **identificar al usuario de forma segura** para que las organizaciones puedan estar seguras de con quién están tratando.

¿Cómo se compara con el modelo español?

El sistema DigiD se parece mucho al modelo español de **Cl@ve Permanente**. Al igual que Cl@ve, se basa en la combinación de un nombre de usuario y una contraseña, a lo que se añade un factor de autenticación adicional (como un código enviado por SMS o una app móvil).

**Similitudes con el modelo español (Cl@ve):**

* **Autenticación en lugar de firma:** Al igual que Cl@ve, la función principal de DigiD es la autenticación segura para acceder a servicios, no la firma digital de documentos con validez legal. Si se requiere una firma, a menudo se utilizan otros métodos o el propio sistema lo indica.
* **Basado en contraseñas y códigos:** El acceso a DigiD se realiza a través de un usuario y una contraseña, complementado con un código de verificación por SMS o un PIN de la app. Esto lo hace muy accesible y fácil de usar, sin necesidad de hardware adicional como un lector de tarjetas.
* **Uso generalizado:** DigiD es el estándar de facto para la interacción con la administración pública holandesa, de la misma manera que Cl@ve se ha convertido en una herramienta muy popular en España.

**Diferencias con el modelo español:**

* **Enfoque de la seguridad:** DigiD tiene diferentes "niveles de confianza" (LoA - Levels of Assurance). Para trámites menos sensibles, basta con el usuario y la contraseña. Para información más privada, como registros médicos, se requiere una verificación más alta, que a menudo se consigue con la app de DigiD y la lectura del chip del pasaporte o tarjeta de identidad, lo que le da un nivel de seguridad similar al de un certificado digital. En España, tienes dos herramientas separadas (Cl@ve y certificado digital), mientras que DigiD intenta consolidar diferentes niveles de seguridad en una sola plataforma.
* **Integración con otros sectores:** Aunque en España el certificado digital y Cl@ve se usan para la salud y la seguridad social, en los Países Bajos, DigiD está muy integrado con el sector privado y semipúblico (aseguradoras de salud, fondos de pensiones, etc.), lo que lo convierte en una herramienta aún más centralizada para la vida del ciudadano.

¿Cómo se compara con el modelo estonio?

Aquí las diferencias son más significativas. El modelo holandés es muy diferente del de Estonia, que es el líder en el campo de la e-identidad.

**Diferencias con el modelo estonio (e-Residency):**

* **Identidad digital vs. negocio digital:** El sistema DigiD está diseñado para los **ciudadanos y residentes holandeses**, y su propósito es facilitar la vida y los trámites administrativos dentro del país. El sistema de e-Residency de Estonia está diseñado para **emprendedores globales** que quieren hacer negocios de forma remota, sin importar dónde vivan. Es un servicio de exportación de la identidad digital.
* **Firma legal cualificada:** La e-card de Estonia (y su certificado digital asociado) permite la **firma digital cualificada** con validez legal en toda la Unión Europea. La capacidad de DigiD para la firma es más limitada y no tiene la misma validez legal que una firma cualificada en un contexto transfronterizo o comercial.
* **Tecnología:** El modelo estonio se basa en un chip de tarjeta inteligente (en la e-card) que contiene un certificado digital, requiriendo un lector de tarjetas. El modelo holandés está más centrado en la **usabilidad y la comodidad del móvil**, con una app que facilita la mayoría de los trámites. Esto lo hace más accesible pero, en general, con un nivel de seguridad más bajo que la firma cualificada de Estonia.
En resumen:

El sistema **DigiD de los Países Bajos** se sitúa en un punto intermedio entre los modelos español y estonio.

* Es más parecido a **Cl@ve** en su enfoque de ser una herramienta de autenticación cómoda y basada en contraseñas y apps.
* A diferencia del modelo dual español, DigiD intenta ofrecer diferentes niveles de seguridad bajo un mismo paraguas, incluyendo la capacidad de usar un documento de identidad con chip para los trámites más sensibles.
* Se diferencia claramente de **Estonia** en su enfoque: no está diseñado como una herramienta para negocios globales o para la firma digital de documentos con la máxima validez legal, sino como una solución práctica y centralizada para la gestión de la vida diaria de los residentes en el país.