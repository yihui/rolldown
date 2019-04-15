#' Convert to Scrollama
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
html_scroll = function(...) {
 rmarkdown::html_document(...,
                          extra_dependencies = htmltools::htmlDependencies(
                            list(
                            htmltools::htmlDependency(
                              name = "intersection_observer",
                              version = "0.5.1",
                              src = "resources",
                              script = "intersection-observer.js"),
                            htmltools::htmlDependency(
                             name = "scrollama",
                             version = "2.0.0",
                             src = "resources",
                             script = "scrollama.js")
                            ))
                          )
}

# add Scrollama css class & attrs to rmd sections
# <div class = "section step", data-step: , data-scrollama-...>
#
