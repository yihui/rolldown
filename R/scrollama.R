#' Convert to Scrollama
#'
#' @param extra_dependendcies
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
scroll_document <- function(
  extra_dependendcies = htmltools::htmlDependency(
    name = "scrollama",
    version = "xxx",
    src = c(filepath = "./scrollama.html"), # ???
    script = "/scrollama_v123.js"),
  ...) {
 rmarkdown::html_document(extra_dependencies = extra_dependencies, ...)
}

# add Scrollama css class & attrs to rmd sections
# <div class = "section step", data-step: , data-scrollama-...>
#
