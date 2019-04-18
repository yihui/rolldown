# rolldown

[![Travis build status](https://travis-ci.com/yihui/rolldown.svg?branch=master)](https://travis-ci.com/yihui/rolldown)
![](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

An extension to [R Markdown](https://rmarkdown.rstudio.com/) that builds scroll-driven HTML documents for storytelling, a.k.a _scrollytelling_, powered by JavaScript libraries. Try here:
```r
## Install from GitHub
remotes::install_github("uncoast-unconf/rolldown")
```

To apply Scrollama to the document, use `scrollama` or `scrollama_sidebar` in the `output` field of the document heading; Include `scrollama_setup()` in an R code block at the end of the document to adjust specifications.
