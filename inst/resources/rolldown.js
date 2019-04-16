var main = d3.select('main');
var scrolly = main.select('#scrolly');
var figure = scrolly.select('div.figure');
var article = scrolly.select('article');
var step = article.selectAll('.step');

// initialize the scrollama
var scroller = scrollama();

// generic window resize listener event
function handleResize() {
	 // 1. update height of step elements
	 var stepH = Math.floor(window.innerHeight);
	 step.style('min-height', stepH + 'px');

	  // 3. tell scrollama to update new element dimensions
	  scroller.resize();
}

// scrollama event handlers
function handleStepEnter(response) {
	console.log("enter", response);
  var id = "main-" + response.element.id;
  var height = document.getElementById(id).clientHeight;
  var top = (window.innerHeight - height) / 2;

  var el = d3.select("#" + id);
  el.style("top", top + "px");

  el
    .transition(400)
    .style("opacity", 1)
}

function handleStepExit(response) {
  console.log("exit", response);
  var id = "main-" + response.element.id;
  var el = d3.select("#" + id);

  el
    .transition(400)
    .style("opacity", 0)
}

function init() {
	// 1. force a resize on load to ensure proper dimensions are sent to scrollama
	handleResize();

	// 2. setup the scroller passing options
	// 		this will also initialize trigger observations
	// 3. bind scrollama event handlers (this can be chained like below)
	scroller.setup({
		step: '#scrolly article .step',
		offset: 0.33
	})
	  .onStepEnter(handleStepEnter)
		.onStepExit(handleStepExit);

		// setup resize event
	 window.addEventListener('resize', handleResize);
}


// kick things off
setTimeout(function() { init(); }, 10);
