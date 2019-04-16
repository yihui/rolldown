#' @param
#' @export
#' @examples
#'
#' library(plotly)
#' library(leaflet)
#'
#' rolldown() %>%
#'   add_step("Look here", plot_ly()) %>%
#'   add_step("Another one", leaflet())

rolldown <- function() {
  structure(list(), class = "rolldown")
}

#' @param
#' @export

add_step <- function(x, sidebar, main) {
  id <- basename(tempfile())
  x[[length(x) + 1]] <- list(
    sidebar = tags$div(id = id, class = "step", sidebar),
    main = tags$div(id = paste0("main-", id), class = "is-not-active", main)
  )
  x
}

#' @export
print.rolldown <- function(x, ...) {
  content <- tags$main(tags$section(
    id = "scrolly",
    do.call(tags$article, lapply(x, function(x) x$sidebar)),
    do.call(figure_div, lapply(x, function(x) x$main))
  ))

  content <- tagList(
    content,
    rolldown_deps(),
    tags$script(paste(readLines("inst/resources/rolldown.js"), collapse = "\n"))
  )

  print(browsable(content))

  invisible(content)
}

figure_div <- function(...) {
  tags$div(..., class = "figure")
}


rolldown_deps <- function() {
    list(
      htmltools::htmlDependency(
        name = "jquery",
        version = "0.5.1",
        src = "resources",
        package = "rolldown",
        script = "jquery.min.js"
      ),
      htmltools::htmlDependency(
        name = "d3",
        version = "5.9.1",
        src = "resources",
        package = "rolldown",
        script = "d3.min.js"
      ),
      htmltools::htmlDependency(
        name = "intersection_observer",
        version = "0.5.1",
        src = "resources",
        package = "rolldown",
        script = "intersection-observer.js"
      ),
      htmltools::htmlDependency(
        name = "scrollama",
        version = "2.0.0",
        src = "resources",
        package = "rolldown",
        script = "scrollama.js"
      ),
      htmltools::htmlDependency(
        name = "rolldown-css",
        version = "0.0.0",
        src = "resources",
        package = "rolldown",
        stylesheet = "rolldown.css"
      )
    )
}
