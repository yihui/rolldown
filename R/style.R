#' Default Rolldown Style
#' @export
#'
rolldown_style_default <- function (...) {
  style <- "
  .level1 {
    min-height: 400px;
    border: 1px solid;
    margin-bottom: 4em;
    padding: 1em 2em 2em;
  }
  .is-active {
    background-color: yellow;
  }"
  tags$style(HTML(style))
}

