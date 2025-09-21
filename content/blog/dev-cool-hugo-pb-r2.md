---
title: "HUGO Photo Galleries with User photo uploads"
date: 2025-09-20
draft: false
tags: ["Web","SSG","Photo-Gallery","Pocketbase CMS","R2 vs s3","Firebase Auth"]
description: 'Using a HUGO Theme with Pocketbase Auth and Cloudflare R2 + Workers. A nextjs-r2-demo.'
url: 'hugo-pocketbase-and-r2'
---


**TL;DR**

I got to know about Cloudflare R2 as object storage.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/nextjs-r2-demo" title="NEW Fork of a NextJS + R2 WebApp" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of a webapp that pushes data to CF R2 via CF Workers" >}}
{{< /cards >}}

{{< callout type="warning" >}}
Remember to place costs alerts (because its not possible set a limit).
{{< /callout >}}

![alt text](/blog_img/web/agujapunto-r2-firebase/cf-notification-alerts.png)



**Intro**

We now, [HUGO can also be cool](https://jalcocert.github.io/JAlcocerT/cool-hugo-themes/).

And few weeks ago I was created some kind of HUGO Flasked version to be edited via ~ FlaskCMS.

But as Pocketbase happened in the meantime, I thought, **do I really need Flask** for this CMS like edits?

I just want to have images placed into some folders, and pocketbase can do that, even relate it to object storage like R2 thanks to its minio compatibility.

{{< cards >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-pocketbased" title="NEW Hugo Theme Gallery x PB" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Pocketbase CMS" >}}
  {{< card link="https://github.com/JAlcocerT/hugo-theme-gallery-flasked" title="Hugo Theme Gallery Forked" image="/blog_img/apps/gh-jalcocert.svg" subtitle="Source Code of Hugo Gallery x Custom Flask CMS" >}}
{{< /cards >}}

Also, I saw **CF R2**: https://github.com/harshil1712/nextjs-r2-demo

>  Upload images to Cloudflare R2 via the Workers API, Pre-signed URL, or Temporary Credentials 

```sh
git clone https://github.com/JAlcocerT/nextjs-r2-demo

git init
git branch -m main
git config user.name
git config --global user.name "JAlcocerT"
git config --global user.name
git add .
git commit -m "Initial commit: Starting test-r2"

#sudo apt install gh
```

ofc I needed to test the i configured the `.env.local` properly: https://github.com/JAlcocerT/nextjs-r2-demo/blob/main/env.sample

```sh
npm run list-bucket
```

At first, I could see the one I uploaded via cf UI:

![Testing nextjs app to upload files to cf R2 buckets](/blog_img/web/agujapunto-r2-firebase/testing.png)

> Upload images to Cloudflare R2 via the Workers API, Pre-signed URL, or Temporary Credentials 

I was **very impressed** when this worked [as per this .md](https://github.com/JAlcocerT/nextjs-r2-demo/blob/main/z-pages-workers-r2.md)

```sh
#https://github.com/JAlcocerT/nextjs-r2-demo
#npx wrangler whoami

#npm run deploy
make deploy
make list-bucket
```

{{< callout type="info" >}}
The [full setup looks like](https://github.com/JAlcocerT/nextjs-r2-demo/blob/main/z-z-full-setup.md): Deployment to CF Pages https://talk-demo-afb.pages.dev/ -> Workers -> R2
{{< /callout >}}


{{< callout type="info" >}}
I could not avoid to ask how to [bring Firebase Auth to the CF Setup](https://github.com/JAlcocerT/nextjs-r2-demo/blob/main/z-z-cloudflare-firebase.md) we just saw.
{{< /callout >}}

## The Hugo Gallery Stack

Some other photo galleries I made:

{{< cards cols="1" >}}
  {{< card link="https://whilecyclingthere.web.app/" title="Cycling There Photo Gallery" >}}
  {{< card link="https://entreagujaypunto.com/" title="Portfolio Aguja&Punto Gallery SSG" >}}
{{< /cards >}}

### Cloudflare R2

We can say its a object storage (like aws s3 or GCS) and a data catalogue:

* https://dash.cloudflare.com
    * https://developers.cloudflare.com/r2/pricing/
    * https://r2-calculator.cloudflare.com/

> R2 provides you with **S3-compatible** object storage with zero egress fees.

As of now, they provide 10GB free, but be careful as you need to provide CC details.

Just recently I got to know: https://github.com/sjackp/r2-gallery

> A minimalist web UI to manage a Cloudflare R2 bucket 

Cloudflare R2 offers a free tier that includes 10 GB of storage per month, 1 million Class A operations (uploads, modifies) per month, and 10 million Class B operations (reads/downloads) per month. 

Plus, it has zero egress fees, so data downloaded from R2 is free of charge during this free tier usage, which is quite generous for testing or small projects.

Regarding API and integration, Cloudflare R2 provides an S3-compatible API that allows secure upload, download, and management of objects.

For a Next.js app, you can utilize this API to implement an upload button that sends files securely to R2.

Common approaches include:

- Using AWS SDK compatible libraries in the backend API routes of Next.js to upload files to R2.
- Generating presigned URLs on the server side that the frontend can use to upload files directly to R2 securely.
- Integrating with Cloudflare Workers for custom logic between your app and R2 storage.

There are open-source Next.js projects and examples available showing how to upload, download, and delete files from Cloudflare R2 with progress indication and secure handling.

In short, yes, Cloudflare R2 offers a beginner-friendly free tier plus a robust API suitable for securely uploading guest photos/videos directly from your Next.js wedding app.

[1](https://developers.cloudflare.com/r2/pricing/)
[2](https://www.reddit.com/r/CloudFlare/comments/1ic51x1/r2_pricing_serving_filesimages_is_not_free/)
[3](https://themedev.net/blog/cloudflare-r2-pricing)
[4](https://github.com/diwosuwanto/cloudflare-r2-with-nextjs-upload-download-delete)
[5](https://github.com/harshil1712/nextjs-r2-demo)
[8](https://www.cloudflare.com/developer-platform/products/r2/)
[16](https://developers.cloudflare.com/r2/objects/upload-objects/)

**How i Setup CLoduflare R2 Buckets**

Went to: https://dash.cloudflare.com/ and hit `R2 object storage`

![alt text](/blog_img/web/agujapunto-r2-firebase/r2-101.png)

![alt text](/blog_img/web/agujapunto-r2-firebase/cf-r2-1.png)

![alt text](/blog_img/web/agujapunto-r2-firebase/cf-r2-2.png)

![alt text](/blog_img/web/agujapunto-r2-firebase/cf-r2-3.png)

![alt text](/blog_img/web/agujapunto-r2-firebase/cf-r2-4.png)


Once you have created a buck for your app, you can customize its settings (CORS, custom domains, Object Lifecycle Rules to delete after some number of days, even Apache Iceberg tables, yes the data catalogue!)

#### R2 vs S3


{{< details title="Cloudflare R2 vs s3 for the wedding idea... 📌" closed="true" >}}


Here is an estimated pricing overview for storing and transferring 20GB, 100GB, and 1,000TB on Cloudflare R2, AWS S3, and MinIO in 2025, assuming 30 days active storage with one upload and one download of each amount:

Cloudflare R2 Pricing:
- Storage: $0.015/GB/month
- Class A operations (upload): $4.50 per million requests
- Class B operations (download): $0.36 per million requests
- Data egress: Free (no download fees)

AWS S3 Pricing (Standard storage class in US East):
- Storage: $0.023/GB/month for first 50TB; $0.021-$0.022 above 50TB
- PUT request: ~$0.00113 per 1000 requests (S3 Express One Zone as of 2025)
- GET request: ~$0.00003 per 1000 requests
- Data upload cost: ~$0.0032 per GB
- Data retrieval cost: ~$0.0006 per GB

MinIO Pricing:
- Self-hosted MinIO has no API or egress fees but requires paying for hosting/infrastructure
- Hosting prices vary widely but start around $1500/month for high-performance bare-metal servers (can be cheaper on cloud VPS)
- No direct per-GB or operation fees if self-hosted; costs mostly fixed infra

Estimates for 1 upload + 1 download for each storage size on Cloudflare R2 and AWS S3:

| Storage  | Cloudflare R2 (USD)                 | AWS S3 Standard (USD)                           |
|----------|-----------------------------------|------------------------------------------------|
| 20 GB    | Storage: $0.30                    | Storage: $0.46                                  |
|          | Class A ops (~1 upload req): Negligible | PUT req: ~$0.0023                             |
|          | Class B ops (~1 download req): Negligible | GET req: ~$0.00006                            |
|          | Egress: Free                     | Upload: ~$0.064                                  |
|          | Total approx: $0.30              | Total approx: $0.53                             |
| 100 GB   | Storage: $1.50                   | Storage: $2.30                                  |
|          | Ops + Egress: Negligible         | PUT req: ~$0.0113                               |
|          |                                 | GET req: ~$0.0003                               |
|          |                                 | Upload: ~$0.32                                  |
|          | Total approx: $1.50              | Total approx: $2.63                             |
| 1,000 TB | Storage: $15,360                 | Storage: $21,000 (approx)                        |
|          | Ops + Egress: Negligible         | PUT req: ~$113                                  |
|          |                                 | GET req: ~$3                                    |
|          |                                 | Upload: ~$3,200                                 |
|          | Total approx: $15,360            | Total approx: $24,316                            |

MinIO costs will vary depending on hosting platform and scale but expect fixed monthly infrastructure costs likely exceeding thousands if self-hosted on enterprise-grade servers; no per-request or egress fees apply.[1][2][3][4][5][6]

Thus, Cloudflare R2 offers strong cost savings on egress and operations compared to AWS S3 for workloads with large downloads like photo albums. MinIO is economical if infrastructure is already managed.


[1](https://developers.cloudflare.com/r2/pricing/)
[3](https://costq.ai/blog/aws-s3-cost-calculator-2025/)
[4](https://bare-metal.io/minio-s3-compatible-object-store-hosting/)
[6](https://aws.amazon.com/s3/pricing/)
[7](https://www.cloudflare.com/developer-platform/products/r2/)
[9](https://r2-calculator.cloudflare.com)


{{< /details >}}


#### Other Contenders

Among all the options—Cloudflare R2, AWS S3, MinIO, Wasabi, Backblaze B2, and DigitalOcean Spaces—the best choice for photo and video uploads from guests depends primarily on expected usage patterns, especially storage size, frequency of uploads, and how often the media will be viewed or downloaded.

### Best Overall for Guest Photo and Video Uploads

- **Wasabi** stands out as the best all-around choice if uploads and downloads are frequent and involve large amounts of data. Its simple flat-rate pricing with no egress fees makes it very cost-effective for heavy download workloads often encountered with photo and video sharing apps. It provides strong durability and scales well while keeping billing predictable.

### Good Alternative Choices

- **Cloudflare R2** is excellent if your app benefits from global CDN integration and zero data egress fees. It’s optimized for read-heavy workloads with fast delivery to guests worldwide and competitive pricing on storage and operations.
- **Backblaze B2** is a strong choice for cost savings with moderate downloads, letting you benefit from very low storage prices and free egress up to a threshold. It’s suitable if you expect bursts but relatively controlled download volumes.
- **DigitalOcean Spaces** works well for smaller or medium-scale deployments integrated with DigitalOcean's cloud ecosystem, but egress costs can rise with large downloads.

### When to Pick AWS S3 or MinIO

- **AWS S3** is best when advanced compliance, enterprise features, and integration into broader AWS services are necessary but is more expensive for egress-heavy workloads.
- **MinIO** is good only if full control over infrastructure and costs is preferred and you can manage the operational complexity.

 Recommendation Summary:

| Use Case                         | Recommended Storage Option          | Why                                                    |
|---------------------------------|-----------------------------------|--------------------------------------------------------|
| Frequent large uploads & downloads | Wasabi                           | Flat fees, no egress cost, strong durability           |
| Global delivery & CDN needed     | Cloudflare R2                     | Zero egress fees + global CDN                           |
| Budget with controlled downloads | Backblaze B2                     | Low storage cost + reasonable free egress              |
| Small/medium scale with cloud ecosystem | DigitalOcean Spaces       | Simple pricing & integration but watch transfer costs  |
| Enterprise or AWS ecosystem      | AWS S3                           | Advanced features, compliance, high reliability         |
| Full self-host control           | MinIO (self-hosted)              | Full control, no API fees, but operational overhead    |

For a wedding photo and video album app, especially if guests will upload and view/download many images/videos, **Wasabi** likely offers the best mix of cost and performance with minimal surprises on bills.

Cloudflare R2 is a close choice if CDN integration and ultra-low latency global delivery matter most.


---

## Conclusions

I plan to use this new **CF R2 knowledge** with my next iteration of the weddings microSaaS :)


And photo galleries...are really **overpowered**.

And along the way, I saw this astro free theme https://recipes-starter.thebcms.com/recipes/omelette

> A cool Recipe page, that might resonate with this user!