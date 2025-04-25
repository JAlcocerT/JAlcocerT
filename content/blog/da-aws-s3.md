---
title: "How to Query s3 buckets with Python"
date: 2023-08-19
draft: false
tags: ["Self-Hosting","Web"]
description: 'Understanding how to use boto to query aws s3 buckets information.'
url: 'aws-s3-python-boto-queries'
---


## Using AWS CLI

You will be able to see the content, which folders there are and so on

```sh
#Install aws CLI 
#https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html

#Check that it is installed with:
aws --version

#Configure it with the credentials:
aws configure

#Explore the buckets with: 
aws s3 ls
```

But we came here to query the data, right?

## How to Query s3 with Boto and Python

Make sure that you have a solid understanding about Python Dependencies and PySpark:

{{< cards cols="2" >}}
  {{< card link="https://github.com/JAlcocerT/Streamlit-MultiChat" title="MultiChat Project ↗" >}}
  {{< card link="https://github.com/JAlcocerT/Data-Chat" title="Data Chat RAG project ↗" >}}
{{< /cards >}}


1. Get your AWS credentials


2. Install Python dependencies


```sh
pip install boto3
```