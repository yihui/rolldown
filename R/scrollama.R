scroll_document <- function(
  extra_dependendcies = htmltools::htmlDependency(
    name = "scrollama",
    version = "xxx",
    src = c(filepath = "./scrollama.html"), # ???
    script = "/scrollama_v123.js"),
  ...) {
 rmarkdown::html_document(extra_dependencies = extra_dependencies, ...)
}
