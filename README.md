# rolldown

<!-- badges: start -->

[![R-CMD-check](https://github.com/yihui/rolldown/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/yihui/rolldown/actions/workflows/R-CMD-check.yaml)
[![rolldown status
badge](https://yihui.r-universe.dev/rolldown/badges/version)](https://yihui.r-universe.dev/rolldown)
![Lifecycle:
Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

<!-- badges: end -->

**Rolldown** is an [R Markdown](https://rmarkdown.rstudio.com) extension that
builds scroll-driven HTML documents for storytelling, a.k.a *scrollytelling*,
powered by JavaScript libraries. Currently, only
[Scrollama](https://github.com/russellsamora/scrollama) is supported.

## Installation

``` r
install.packages("rolldown", repos = c("https://yihui.r-universe.dev", "https://cloud.r-project.org"))
```

## Get started

You can get started with some built-in R Markdown templates in this package. If
you use the RStudio IDE, you can create a new R Markdown document from
`File -> New File -> R Markdown -> From Template`. Then find a **rolldown**
template from the list. If you do not use RStudio, you may use the
`rmarkdown::draft()` function to create a new R Markdown document, e.g.,

``` r
# the basic style
rmarkdown::draft('story.Rmd', template = 'scrollama-document', package = 'rolldown')

# the sidebar layout
rmarkdown::draft('story.Rmd', template = 'scrollama-sidebar', package = 'rolldown')
```
