#' R Markdown output formats for using Scrollama
#'
#' Include the Scrollama JS library in the HTML output from R Markdown.
#' @param ...,template Arguments to be passed to
#'   \code{bookdown::\link{html_document2}()}.
#' @references The Scrollama library:
#'   \url{https://github.com/russellgoldenberg/scrollama}.
#' @return \code{scrollama()} and \code{scrollama_sidebar()} return R Markdown
#'   output formats; \code{scrollama_setup()} is a helper function to return the
#'   JavaScript code for initializing Scrollama.
#' @importFrom htmltools htmlDependency tags HTML
#' @export
scrollama <- function(...) {
  html_format(..., .dependencies = list(
    htmlDependency(
      'scrollama', '2.0.0', pkg_resource('scrollama'), script = 'scrollama.min.js')
  ))
}

#' @rdname scrollama
#' @export
scrollama_sidebar <- function(..., template = pkg_resource('html', 'scrollama-side.html')) {
  scrollama(..., template = template)
}

#' @param options A list of initialization options for Scrollama.
#' @rdname scrollama
#' @export
#' @examples rolldown::scrollama_setup(list(step = '.level1', offset = .2))
scrollama_setup <- function(
  options = list(step = '.section, img, video, embed', offset = .5)
) {
  init = sprintf('(function() {
  var scroller = scrollama();
  scroller.setup(%s)
    .onStepEnter(res => {
      res.element.classList.add("is-active");
    })
    .onStepExit(res => {
      res.element.classList.remove("is-active");
    });
  window.addEventListener("resize", scroller.resize);
})();', to_json(options))
  tags$script(HTML(init))
}
