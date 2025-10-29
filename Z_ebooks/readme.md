Created few pdf ebooks for expanding knowledge in few topics Ive found interesting. 

I have created them as per the [learnings of this repo](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-rmd)

This is happening thanks to the magic of R language:

```sh
# Rscript Z_ebooks/render.R --input Z_ebooks/content-test.md --output Z_ebooks/content-test.pdf --cover Z_ebooks/cover-selfhosting@300dpi.png

# From the repo root or from Z_ebooks/
Rscript Z_ebooks/render.R \
  --input Z_ebooks/dna-ebook.md \
  --output Z_ebooks/dna-ebook.pdf \
  --cover Z_ebooks/sample-cover.png
```