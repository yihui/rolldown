# a helper function return the paths to resource dirs/files in this package
pkg_resource <- function(...) {
  system.file('resources', ..., package = 'rolldown', mustWork = TRUE)
}

# a wrapper function around bookdown::html_document2() to add extra dependencies
html_format <- function(..., .dependencies = NULL) {
  html_document2 = function(..., extra_dependencies = list()) {
    bookdown::html_document2(..., extra_dependencies = c(
      extra_dependencies, .dependencies
    ))
  }
  html_document2(...)
}

to_json <- function(...) {
  jsonlite::toJSON(..., auto_unbox = TRUE, null = 'null')
}
