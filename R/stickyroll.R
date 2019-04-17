#' @param
#' @export
#' @examples
#'
#' library(plotly)
#'
#' p1 <- ggplotly(qplot(1:10))
#' p2 <- ggplotly(qplot(1:10, 1:10))
#'
#' rolldown() %>%
#'   add_step("Look here", p1) %>%
#'   add_step("Another one", p2)

stickyroll <- function() {
  structure(list(), class = "stickyroll")
}

#' Add a 'step' to the
#' @param
#' @export

add_step <- function(x, sidebar, main) {
  sidebar <- as_html(sidebar)
  main <- htmltools::as.tags(main)
  if (!inherits(main, c("htmlwidget", "shiny.tag", "shiny.tag.list"))) {
    warning("main content must be an htmlwidget or html content")
  }

  id <- basename(tempfile())
  x[[length(x) + 1]] <- list(
    sidebar = htmltools::tags$div(id = id, class = "step", sidebar),
    main = htmltools::tags$div(
      id = paste0("main-", id),
      style = "opacity: 0",
      main
    )
  )

  x
}

#' @export
print.stickyroll <- function(x, ...) {
  content <- htmltools::tags$main(htmltools::tags$section(
    id = "scrolly",
    do.call(htmltools::tags$article, lapply(x, function(x) x$sidebar)),
    do.call(figure_div, lapply(x, function(x) x$main))
  ))

  content <- htmltools::tagList(
    content,
    rolldown_deps(),
    htmltools::tags$script(paste(readLines("inst/resources/rolldown.js"), collapse = "\n"))
  )

  print(htmltools::browsable(content))

  invisible(content)
}

figure_div <- function(...) {
  htmltools::tags$div(..., class = "figure")
}

as_html <- function(x) {
  if (!file.exists(x)) stop("File does not exist")
  tmpfile <- tempfile(fileext = ".html")
  rmarkdown::render(x, output_file = tmpfile, output_format = rmarkdown::html_document())
  htmltools::HTML(paste(readLines(tmpfile), collapse = "\n"))
}


rolldown_deps <- function() {
    list(
      htmltools::htmlDependency(
        name = "d3",
        version = "5.9.1",
        src = "resources",
        package = "rolldown",
        script = "d3.min.js"
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
