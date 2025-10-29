Created few pdf ebooks for expanding knowledge in few topics Ive found interesting. 

I have created them as per the [learnings of this repo](https://github.com/JAlcocerT/ebook-ideas/tree/master/x-rmd)

This is happening thanks to the magic of [the R language](https://jalcocert.github.io/JAlcocerT/useful-r-stuff/): *Example of the D&A ebook*

```sh
# Rscript Z_ebooks/render.R --input Z_ebooks/content-test.md --output Z_ebooks/content-test.pdf --cover Z_ebooks/cover-selfhosting@300dpi.png

# From the repo root or from Z_ebooks/
Rscript Z_ebooks/render.R \
  --input Z_ebooks/dna-ebook.md \
  --output Z_ebooks/dna-ebook.pdf \
  --cover Z_ebooks/sample-cover.png
```

Then add the **link to download** the pdf, right from your public github: https://github.com/JAlcocerT/JAlcocerT/raw/main/Z_ebooks/dna-ebook.pdf

---

Generated with R 4.1.2:

```sh
R --version
# R version 4.1.2 (2021-11-01) -- "Bird Hippie"
# Copyright (C) 2021 The R Foundation for Statistical Computing
# Platform: x86_64-pc-linux-gnu (64-bit)

# R is free software and comes with ABSOLUTELY NO WARRANTY.
# You are welcome to redistribute it under the terms of the
# GNU General Public License versions 2 or 3.
# For more information about these matters see
# https://www.gnu.org/licenses/.
```


---

## IoT

```sh
Rscript Z_ebooks/render.R \
  --input Z_ebooks/iot-ebook.md \
  --output Z_ebooks/iot-ebook.pdf \
  --cover Z_ebooks/IoT-ebook.png
```