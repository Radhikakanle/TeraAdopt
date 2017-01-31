$(document).ready(function() {
	$.get('deploymentdailygraph', drawDeploymentDailyGraph)
	$.get('deploymentenvgraph', drawDeploymentEnvGraph)
	
	function drawDeploymentDailyGraph(response) {
	
		var datearray = [];
		var dailyarray = [];
		for ( var i in response) {
			datearray.push(response[i].deployedDate);
			dailyarray.push(Number(response[i].dailyCount));
		}
		 var barChartData = {
		            labels: datearray,
		            datasets: [{
		                label: 'Count',
		                backgroundColor: "rgb(124, 181, 236)",
		                data: dailyarray
		            }]

		     };
		    draw()
		    function draw() {
		          var ctx = document.getElementById("canvasdeploymentdaily").getContext("2d");
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
		                        	ticks: {
	                        		beginAtZero:true,
	                        		//stepSize: 1
	                                }
		                        }]
		                    }
		                }
		            });

		        };
	}
	
	function drawDeploymentEnvGraph(response) {
		var datearray = [];
		var devarray = [];
		var qaarray = [];
		var prodarray = [];
		for ( var i in response) {
			datearray.push(response[i].deployedDate);
			devarray.push(Number(response[i].devCount));
			qaarray.push(Number(response[i].qaCount));
			prodarray.push(Number(response[i].prodCount));
		}
		 var barChartData = {
		            labels: datearray,
		            datasets: [{
		                label: 'UAT',
		                backgroundColor: "orange",
		                data: devarray
		            }, {
		                label: 'PREPROD',
		                backgroundColor: "yellow",
		                data: qaarray
		            },  {
		                label: 'PROD',
		                backgroundColor: "blue",
		                data: prodarray
		            }]

		     };
		    draw()
		    function draw() {
		          var ctx = document.getElementById("canvasdeploymentenv").getContext("2d");
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
		                        	ticks: {
		                        		beginAtZero:true,
		                        		//stepSize: 1
		                                }
		                        }]
		                    }
		                }
		            });

		        };
	}
});
