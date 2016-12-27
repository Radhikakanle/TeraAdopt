$(document).ready(function() {
	$.get('codeanalysisissuegraph', drawChart);
	$.get('codeanalysistable', codeanalysis)
	
	function codeanalysis(data) {
			var output = "";
			var count = 0;
			output += ' <table class="table table-bordered table-striped">';
			output += '<thead>';
			output += '<tr>';
			output += '  <th>Build Number</th>';
			output += '  <th>Lines of Code</th>';
			output += '  <th>Technical Debt</th>';
			output += '  <th>Complexity</th>';
			output += '  <th>Unit Test Coverage</th>';
			output += '</tr>';
			output += '</thead>';
			output += '<tbody>';
			for ( var i in data) {
				output += '  <tr>';
				output += '<td>' + data[i].build_details.name
						+ '</td>';
				output += '<td>' + data[i].loc + '</td>';
				output += '<td>' + data[i].technical_debt + '</td>';
				output += '<td>' + data[i].complexity + '</td>';
				output += '<td>' + data[i].unit_test_coverage + '</td>';
				output += '</tr>';
				count++;
			}
			
			output += '</tbody>';
			output += ' </table>';
			
			document.getElementById("codeanalysistable").innerHTML = output;
			
		};

	
	function drawChart(response) {

		var buildnumberarr = [];
		var blockerarr = [];
		var criticalarr = [];
		var majorarr = [];
		var minorarr = [];
		for ( var i in response) {
			buildnumberarr.push(response[i].build_display_name);
			blockerarr.push(Number(response[i].blocker));
			criticalarr.push(Number(response[i].critical));
			majorarr.push(Number(response[i].major));
			minorarr.push(Number(response[i].minor));
		}

	    var barChartData = {
	            labels: buildnumberarr,
	            datasets: [{
	                label: 'Blocker',
	                backgroundColor: "red",
	                data: blockerarr
	            }, {
	                label: 'Critcal',
	                backgroundColor: "yellow",
	                data: criticalarr
	            },  {
	                label: 'Major',
	                backgroundColor: "orange",
	                data: majorarr
	            }, {
	                label: 'Minor',
	                backgroundColor: "green",
	                data: minorarr
	            }]

	     };
	    draw()
	    function draw() {
	          var ctx = document.getElementById("codeanalysiscanvas").getContext("2d");
	          window.myBar = new Chart(ctx, {
	              type: 'bar',
	              data: barChartData,
	           
	              options: {
	                    // Elements options apply to all of the options unless overridden in a dataset
	                    // In this case, we are setting the border of each bar to be 2px wide and green
	                    elements: {
	                        rectangle: {
	                            borderWidth: 2,
	                            borderColor: 'rgba(255,255,255,0)',
	                            borderSkipped: 'bottom'
	                        }
	                    },
	                  
	                    responsive: true,
	                    legend: {
	                        position: 'bottom',
	                    },
	                    scales: {
	                        xAxes: [{
	                        	 gridLines: {
	                                 color: "rgba(255,255,255,0)"
	                             }  
	                        }],
	                        yAxes: [{
	                               
	                        }]
	                    }
	                }
	            });

	        };
	}

});
