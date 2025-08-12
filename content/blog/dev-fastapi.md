---
title: "FastAPI"
date: 2025-08-13
draft: false
tags: ["Dev"]
description: 'FastAPI'
url: 'fast-api'
---

```sh
curl -X GET "http://localhost:3900/healthcheck" -H "accept: application/json"
```

Yes, you're absolutely right - we have the PUT endpoint for updates, which can handle all user settings modifications including resetting to defaults if needed.

📚 What is an API Endpoint?
An API endpoint is a specific URL where an API can be accessed by a client application. Think of it as a "digital address" where your application can send requests to get or modify data.

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