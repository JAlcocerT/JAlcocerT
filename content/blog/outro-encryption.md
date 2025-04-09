---
title: "Encryption."
date: 2025-07-10
draft: false
tags: ["Dev"]
description: ''
url: 'encryption-101'
---

https://emn178.github.io/online-tools/sha256.html


Let's break down the SHA-256 protocol and its relation to Bitcoin, as well as analyze your Python function.

**What is the SHA-256 Protocol?**

SHA-256 (Secure Hash Algorithm 256-bit) is a cryptographic hash function. Here's what that means:

* **Cryptographic:** It's designed with security in mind, making it very difficult to reverse the process (find the original input from the output) or to find two different inputs that produce the same output (collision resistance).
* **Hash Function:** It takes an input of any arbitrary length (a message, a file, data, etc.) and produces a fixed-size output called a "hash" or "digest." For SHA-256, this output is always 256 bits long (which is 32 bytes or 64 hexadecimal characters).
* **Deterministic:** The same input will always produce the exact same output.

**Key Properties of SHA-256:**

* **One-way:** It's computationally infeasible to reverse the hashing process to find the original input from the hash value.
* **Collision-resistant:** It's extremely difficult (practically impossible with current technology) to find two different inputs that produce the same hash output.
* **Avalanche effect:** A small change in the input data will result in a drastically different hash output. This makes it very sensitive to even minor alterations.
* **Fixed output size:** Regardless of the size of the input, the output is always 256 bits.

**Does Bitcoin Implement SHA-256?**

**Yes, Bitcoin heavily relies on the SHA-256 hash function.** It is a fundamental building block of the Bitcoin blockchain and is used in several crucial processes:

* **Proof-of-Work:** Bitcoin's mining process involves repeatedly hashing block headers (which contain transaction information, a timestamp, and a reference to the previous block) along with a "nonce" (an arbitrary number). Miners compete to find a nonce that, when the entire block header is hashed using SHA-256, results in a hash value that meets a certain difficulty target (starts with a specific number of leading zeros).
* **Transaction Hashing:** Individual transactions are hashed using SHA-256 (often multiple times in a Merkle tree structure) to create a unique identifier for each transaction.
* **Merkle Trees:** Blocks in the Bitcoin blockchain organize transactions into a Merkle tree. SHA-256 is used to hash pairs of transaction IDs, and then hash the resulting hashes, and so on, up to the Merkle root. This provides an efficient way to verify if a specific transaction is included in a block.
* **Address Generation (Indirectly):** While Bitcoin addresses are not directly SHA-256 hashes, SHA-256 is used in the process of creating them (along with other hashing algorithms like RIPEMD-160).

**Is This Function Also Doing It?**

Let's analyze your Python function:

```python
def hash_mac(mac):
    mac = f.upper(mac)
    mac = f.regexp_replace(mac, '[-:]', '')
    mac = f.sha2(mac, 256)
    return mac
```

Assuming `f` is a library or module that provides string manipulation and hashing functions, here's what the function does:

1.  **`mac = f.upper(mac)`:** Converts the input `mac` address to uppercase.
2.  **`mac = f.regexp_replace(mac, '[-:]', '')`:** Removes any hyphens (`-`) or colons (`:`) from the `mac` address string. This likely aims to standardize the MAC address format before hashing.
3.  **`mac = f.sha2(mac, 256)`:** This is the crucial part. It appears to be using a function (presumably from the library `f`) called `sha2` and passing the processed `mac` address and the integer `256` as arguments. **If this `f.sha2` function is indeed an implementation of the SHA-256 algorithm, then yes, this line is performing a SHA-256 hash on the modified MAC address.**

**In summary:**

* The function takes a MAC address as input.
* It standardizes the MAC address by converting it to uppercase and removing hyphens or colons.
* It then applies a hash function named `sha2` with a parameter `256`. **If `f.sha2` with the `256` parameter correctly implements the SHA-256 algorithm, then the function is indeed performing a SHA-256 hash.**

To be absolutely sure, you would need to know the specific library or module that `f` refers to and consult its documentation to confirm that `f.sha2(data, 256)` is a standard SHA-256 implementation. However, the naming convention strongly suggests that it is.


Ah, with the clarification that `f` comes from `pyspark.sql.functions`! Let's re-evaluate.

**Regarding `pyspark.sql.functions as f`:**

Yes, in PySpark SQL functions, `f.sha2(column, numBits)` is indeed the function used to compute the SHA-2 family of hash functions.

* **`column`**: This would be the PySpark DataFrame column containing the string data you want to hash (in your case, the processed MAC address).
* **`numBits`**: This parameter specifies the desired bit length of the hash. When you use `f.sha2(mac, 256)`, you are explicitly telling PySpark to compute the **SHA-256 hash** of the data in the `mac` column.

**Therefore, with `import pyspark.sql.functions as f`, the function you provided:**

```python
def hash_mac(mac):
    mac = f.upper(mac)
    mac = f.regexp_replace(mac, '[-:]', '')
    mac = f.sha2(mac, 256)
    return mac
```

**is indeed performing a SHA-256 hash on the standardized MAC address within a PySpark DataFrame context.** Keep in mind that in a real PySpark application, `mac` here would likely be the name of a column in your DataFrame, and you would apply these transformations using PySpark DataFrame operations (e.g., `df.withColumn('hashed_mac', hash_mac(df['mac_column']))`).

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

### SSH

Yes, the SSH (Secure Shell) protocol can and often does use the SHA-256 hashing algorithm, but it's not the *only* hashing algorithm it employs. SHA-256 is used in various parts of the SSH protocol for different purposes, contributing to its security.

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

While SSH uses a variety of cryptographic algorithms for different aspects of the secure connection (including encryption ciphers like AES, key exchange algorithms like Diffie-Hellman and ECDH, and MAC algorithms), **SHA-256 is a significant and widely used hashing algorithm within the SSH protocol, particularly in modern and secure configurations.** It plays a crucial role in key exchange, host key verification, and ensuring data integrity.

It's important to note that the specific algorithms used by an SSH connection are negotiated between the client and the server during the initial handshake. The availability and preference of SHA-256 depend on the SSH client and server software and their configuration. Modern systems are generally configured to prefer stronger algorithms like those using SHA-256 over older, less secure options like SHA-1.