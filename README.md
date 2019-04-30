# rolldown

[![Travis build status](https://travis-ci.com/yihui/rolldown.svg?branch=master)](https://travis-ci.com/yihui/rolldown)
![Lifecycle: Experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)

**Rolldown** is an [R Markdown](https://rmarkdown.rstudio.com) extension that builds scroll-driven HTML documents for storytelling, a.k.a _scrollytelling_, powered by JavaScript libraries. Currently, only [Scrollama](https://github.com/russellgoldenberg/scrollama) is supported. 

## Installation
  
```r
# Install from GitHub
remotes::install_github("uncoast-unconf/rolldown")
```

## A minimal example

````
---
title: "Scrollama Document"
output:
  rolldown::scrollama_sidebar
---

```{r echo = FALSE}
# include this code block in the beginning to specify a style
rolldown:::rolldown_style_default()
```

# Level-One

Use level-one heading to designate scrolling sections. 

## Level-Two

Level-two and below headings...

### Level-Three

...are all contained in the same section.


# Text

Texts are displayed in the sidebar area.


# Plot

Plots are displayed in the exhibit area.  
You may include more than one plots in any section.

```{r}   
plot(cars)
plot(pressure)
```


# Image

Images are treated the same with plots. Use Markdown syntax to insert them in texts.   

Local news [reported](https://www.desmoinesregister.com/story/news/2018/04/27/rubber-duck-des-moines-yess-duck-derby/558852002/) a giant inflatable rubber duck rolling down the street of Des Moines, where this package is conceived.  

![The Rolling Duck](https://www.gannett-cdn.com/-mm-/29c397077fc2506ed005328c6d03b4cc695265f2/c=3-0-483-361/local/-/media/2018/04/27/IAGroup/DesMoines/636604380015350378-duck.JPG?width=534&height=401&fit=crop)  


# HTML Widgets

Support for HTML Widgets is under development. 
````
