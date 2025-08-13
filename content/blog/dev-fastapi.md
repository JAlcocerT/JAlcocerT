---
title: "FastAPI"
date: 2025-08-13
draft: false
tags: ["Dev","Python"]
description: 'FastAPI'
url: 'fast-api'
---

```sh
curl -X GET "http://localhost:3900/healthcheck" -H "accept: application/json"
```

**TL;DR** Ive been working with [PB](https://jalcocert.github.io/JAlcocerT/pocketbase-redux/), [DBs](https://jalcocert.github.io/JAlcocerT/databases-101/) lately, within a FastAP Python BE and wanted to write about few new concepts

**Intro**


## FastAPI




## Concepts


### What is an API Endpoint?

An API endpoint is a specific URL where an API can be accessed by a client application.

 Think of it as a "digital address" where your application can send requests to get or modify data.

Anatomy of an Endpoint
[HTTP METHOD] [BASE_URL][PATH] 
     ↓           ↓        ↓
   GET    http://localhost:3900/api/settings
Components:

HTTP Method: GET, POST, PUT, DELETE (defines the action)
Base URL: http://localhost:3900 (where the server lives)
Path: /api/settings (specific resource location)
Real-World Analogy
Think of endpoints like addresses in a city:

🏠 Physical World:          🌐 API World:
   "123 Main St"     →        "GET /api/settings"
   "456 Oak Ave"     →        "PUT /api/settings" 
   "789 Pine Rd"     →        "GET /api/settings/health"
Each address serves a different purpose:

GET /api/settings = "Go get the user's settings"
PUT /api/settings = "Go update the user's settings"
GET /api/settings/health = "Go check if the service is working"
HTTP Methods Explained
Method	Purpose	Example
GET	Retrieve data	Get user settings
PUT	Update/replace data	Update user settings
POST	Create new data	Create new user
DELETE	Remove data	Delete user account

---

## Conclusions

### Proper Py and uv

Make your Python have the version you want to: *in my case, I wanted 3.12.11*

```sh
sudo apt update
sudo apt install -y build-essential wget \
  libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev

wget https://www.python.org/ftp/python/3.12.11/Python-3.12.11.tgz
tar -xzf Python-3.12.11.tgz
cd Python-3.12.11
./configure --enable-optimizations
make -j"$(nproc)"
sudo make altinstall   # installs as /usr/local/bin/python3.12
python3.12 --version
python3.12 -m pip install --upgrade pip setuptools wheel
```

If you are using uv, do:

```sh
#uv lock --python 3.12.11
```

If you had another one, **change the default python** to the new installed:

```sh
# verify current PATH order (expect /usr/local/bin before /usr/bin)
echo "$PATH"
which -a python3

# create symlink (adjust source if you installed under /opt)
sudo ln -s /usr/local/bin/python3.12 /usr/local/bin/python3

# verify it takes precedence
which -a python3
python3 --version   # should show 3.12.11
```

