#' Convert to Scrollama Document
#'
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
html_scroll = function(...) {
 rmarkdown::html_document(...,
                          extra_dependencies =
                            list(
                            htmltools::htmlDependency(
                              name = "intersection_observer",
                              version = "0.5.1",
                              src = "resources",
                              package = "rolldown",
                              script = "intersection-observer.js"),
                            htmltools::htmlDependency(
                             name = "scrollama",
                             version = "2.0.0",
                             src = "resources",
                             package = "rolldown",
                             script = "scrollama.js")
                            )
                          )
}

# add Scrollama css class & attrs to rmd sections
# <div class = "section step", data-step: , data-scrollama-...>



#' Scrollama Initilization Script
#'
#' @param params `list` of elements step, debug, offset
#'
#' @return `list`
#' @export
#'
#' @examples
scrollama_init_setup <- function(params = list(step = ".level1",
                                               debug = "true",
                                               offset = "0.5")
  ){
  init_script <- paste0(
    "var scroller = scrollama();
    function handleStepEnter(response) {
      console.log(response);
    	response.element.classList.add('is-active');
    }
    function handleStepExit(response) {
    	response.element.classList.remove('is-active');
    }

    function init() {
    	scroller.setup({
    		step: '", params$step, "',
    		debug: ", params$debug,"
    		offset: ", params$offset,"
    	})
    		.onStepEnter(handleStepEnter)
    		.onStepExit(handleStepExit);
    	window.addEventListener('resize', scroller.resize);
    }"
  )

  htmltools::tags$script(init_script)
}
