# rolldown

[![Travis build status](https://travis-ci.com/yihui/rolldown.svg?branch=master)](https://travis-ci.com/yihui/rolldown)
![Lifecycle: Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

**Rolldown** is an [R Markdown](https://rmarkdown.rstudio.com) extension that builds scroll-driven HTML documents for storytelling, a.k.a _scrollytelling_, powered by JavaScript libraries. Currently, only [Scrollama](https://github.com/russellgoldenberg/scrollama) is supported. 

## Installation
  
```r
# Install from GitHub
remotes::install_github("yihui/rolldown")
```

## Get started

You can get started with some built-in R Markdown templates in this package. If you use the RStudio IDE, you can create a new R Markdown document from `File -> New File -> R Markdown -> From Template`. Then find a **rolldown** template from the list. If you do not use RStudio, you may use the `rmarkdown::draft()` function to create a new R Markdown document, e.g.,

```r
rmarkdown::draft('story.Rmd', template = 'scrollama-document', package = 'rolldown')
```
