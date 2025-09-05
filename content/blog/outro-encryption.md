---
title: "Encryption, Captchas and more"
date: 2025-05-20
draft: false
tags: ["Outro","Security","PoW","Clave","E-Residency","openssl"]
description: 'SHA256 Protocol. The concept and applications: SSH, HTTPs, Bitcoin...'
url: 'encryption-101'
---

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

* https://emn178.github.io/online-tools/sha256.html

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

### En resumen:

| Característica | Certificado Digital | Cl@ve |
| :--- | :--- | :--- |
| **Función principal** | Identificación y **firma digital** | Identificación y autenticación |
| **Tipo de documento** | Fichero informático o chip (DNIe) | Sistema de contraseñas |
| **Usos** | Trámites que requieren firma (impuestos, recursos, contratos) | Trámites de consulta o gestiones sencillas |
| **Validez** | Varios años, no limitado a un solo trámite | Cl@ve PIN (temporal), Cl@ve Permanente (24 meses) |
| **Nivel de seguridad** | Alto, incluye firma legalmente válida | Alto para acceso, pero no para firma |
| **Obtención** | Requiere acreditación presencial o videoidentificación | Registro más sencillo, online o presencial |

En conclusión, si necesitas firmar documentos electrónicos de manera legal, el **certificado digital** es la herramienta adecuada. Si solo buscas una forma ágil y segura de acceder y realizar consultas en las sedes electrónicas de las administraciones, el sistema **Cl@ve** es una opción más cómoda y sencilla.

El modelo de Estonia, con su programa de e-Residency y las e-cards, es un referente mundial en la digitalización de la administración pública y los negocios. Se diferencia del sistema español en varios aspectos clave, especialmente en su enfoque y en la tecnología utilizada.

### ¿Qué es la e-Residency?

La "e-Residency" (residencia electrónica) de Estonia es un programa único que permite a cualquier persona del mundo, sin importar su nacionalidad, obtener una identidad digital emitida por el gobierno estonio. **No es una residencia física, ni una ciudadanía, ni un permiso de viaje.** Es una identidad digital que te da acceso al ecosistema digital de Estonia.

### ¿Qué son las "e-cards"?

La "e-card" (tarjeta electrónica) es la tarjeta de identidad física que se entrega a los e-residents. Es similar a una tarjeta de crédito, con un chip inteligente incorporado. Es el equivalente estonio del DNIe español. Su función es la de un **dispositivo de autenticación segura y de firma digital**.

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

### Resumen de la diferencia

Mientras que en España tienes dos herramientas (certificado digital para trámites complejos y firma, y Cl@ve para acceso sencillo), en Estonia, la **e-card de e-Residency es una única llave maestra y de uso universal** para el mundo de los negocios digitales. Su enfoque es un "todo-en-uno" que no solo te identifica, sino que te permite operar de manera remota en un entorno de negocios digital, transparente y legalmente reconocido a nivel de la UE.

En esencia, la gran diferencia es que Estonia no solo digitalizó su administración, sino que la diseñó desde cero para ser global, atrayendo a emprendedores y capital de todo el mundo a través de un simple documento de identidad digital.

El caso de los Países Bajos con su sistema **DigiD** (que significa "Identidad Digital") es otro ejemplo interesante de cómo un país ha abordado la identificación electrónica, y tiene similitudes y diferencias con los modelos de España y Estonia.

### ¿Qué es DigiD?

DigiD es el sistema de identificación en línea que usan los ciudadanos y residentes de los Países Bajos para acceder a servicios gubernamentales, de salud, educación y pensiones. Es una herramienta esencial para la vida diaria en los Países Bajos. Su principal propósito es **identificar al usuario de forma segura** para que las organizaciones puedan estar seguras de con quién están tratando.

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