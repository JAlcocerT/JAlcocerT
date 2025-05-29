---
title: "Software for Servers"
date: 2025-05-31T01:20:21+01:00
draft: false
tags: ["PaaS","HomeLab"]
description: 'Selfhosted Apps that simplify my workflow as of May 2025: Termix, CheckMate, LibreChat'
url: 'selfhosted-server-paas'
---

### LocalStack

LocalStack is a tool designed for developers who want to test AWS functionalities locally. 

It provides an emulated environment of AWS services, solving issues related to unpredictable billing and resource management during development. 

- **Purpose**: LocalStack emulates AWS API functionality.
- **Problem Solved**: Allows local testing without involving AWS services directly.
- **Installation**: 
  - Sign up with a GitHub account.
  - Use `brew install localstack/tap/localstack-cli` for installation on macOS.
  - Requires Docker to function as a local “mini-cloud” operating system.
- **Basic Use**: 
  - Set environment variables for AWS access.
  - Create services like S3 buckets using standard AWS commands.
  - Offers a Community Image for free usage.
- **Limitations**:
  - Not all AWS services are fully emulated; some are available only in the Pro version.
  - Works with a single API endpoint unlike AWS's regional separation.
- **Key Features**: 
  - Supports essential services like EC2.
  - Allows basic CRUD operations.
  - Requires understanding of feature coverage before use.

### Dokploy


{{< details title="How could I not summarize the video... 📌" closed="true" >}}



{{< /details >}}