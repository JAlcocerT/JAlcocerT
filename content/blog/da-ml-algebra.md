---
title: "Understanding Algebra (again)"
date: 2025-12-22T23:20:21+01:00
draft: false
tags: ["DSc","Outro","Math","STEM"]
description: 'It takes something more than blindly multiplying matrixes to get to known them.'
url: 'algebra-101'
math: true
---



**Tl;DR**

Most likely you got bored in math classes, you will love this post though.

**Intro**

Algebra was one of my favourite subjects in my first year of uni studies.

> And blindly multiplying matrixes was the most painful and procrastinated task for me to do in high school.

And its been a while since I have had the chance to do cool stuff with it.

Until today.

## The core of Lineal Algebra

<!-- https://www.youtube.com/watch?v=m3hxPxPgSIY -->

{{< youtube "m3hxPxPgSIY" >}}

### EigenValues and EigenVectors

These were pretty crazy concepts.

---

<!-- https://www.youtube.com/watch?v=e50Bj7jn9IQ -->

{{< youtube "e50Bj7jn9IQ" >}}



---

## Conclusions


### Outro

As I plan to write about less new things next year, but gain depth: *meaning, I will do more volume, less variety.*

Couldnt avoid to finish with some...lets call it STEM recap series.

```sh
#du -sh .
#find ./content/blog -maxdepth 1 -type f -name "*.md" | wc -l #~339 posts and counting

find content/blog -name '*.md' -print0 |
xargs -0 awk '
  FNR==1 { post_date=""; printed=0 }

  /^date:/ && !printed {
    gsub(/^date:[[:space:]]*/, "", $0)
    post_date = substr($0, 1, 10)
    if (post_date > "2025-12-08") {
      print FILENAME ": " post_date
      printed=1
      count++
    }
  }

  END {
    print "TOTAL:", count
  }
'
#find static/blog_img -type f | wc -l
```

As of now I have 'just' planned ~33 posts for JAlcocerT for the rest of 2025/2026.

Have migrated some of them [here](https://github.com/JAlcocerT/canvas/tree/main/content/en/articles) to what is going to be the center of a more...branded tinkering?

```sh
#git clone https://github.com/JAlcocerT/canvas

```

Yes, i mean the blog.jalcocertech thing.

But before starting that, all the content that Ive created here has to go properly to the `/docs` and from there to the `web/ooks` / ebooks or whatever name ill put in place.

You can sneak peek at the ebooks Im cooking [here](https://github.com/JAlcocerT/JAlcocerT/tree/master/Z_ebooks)

Lets see how that adventure goes!