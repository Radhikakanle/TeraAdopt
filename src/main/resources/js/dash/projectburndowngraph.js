$(document).ready(function() {
	/*var output = ""; */
	$.get('releaselist', function(response) {
		var array = Object.keys(response);
		for(var i in array) {
			output += '<li><a href="#">'+array[i]+'</a></li>';
		}
	});
		/*document.getElementById("releaselist").innerHTML = output;
		$.get('releaseburndown', {releasename: "Release 2"}, drawReleaseBurndownChart);
		$("#releaselist li").on('click', function(){
		//	alert(1);
			//$.get('releaseburndown', {releasename: $(this).text()}, drawReleaseBurndownChart);
		});
	});*/
	
	$.get('projectburndown', drawChart);
	$.get('sprintreport', sprinttable);
	$.get('sprintreport', drawBarChart);
	$.get('releaseburndown', drawReleaseBurndownChart);
	
	function sprinttable(data) {
		var output = "";
		var count = 0;
		output += ' <table class="table table-bordered table-striped">';
		output += '<thead>';
		output += '<tr>';
		output += '  <th>Sprint Name</th>';
		output += '  <th>Start Date</th>';
		output += '  <th>End date</th>';
		output += '  <th>Story points closed</th>';
		output += '  <th>Total Story points</th>';
		output += '</tr>';
		output += '</thead>';
		output += '<tbody>';
		for ( var i in data) {
			output += '  <tr>';
			output += '<td>' + data[i].sprintname+ '</td>';
			output += '<td>' + data[i].startdate + '</td>';
			output += '<td>' + data[i].enddate + '</td>';
			output += '<td>' + data[i].storypointsclosed + '</td>';
			output += '<td>' + data[i].storypointstotal + '</td>';
			output += '</tr>';
			count++;
		}
		
		output += '</tbody>';
		output += ' </table>';
		
		document.getElementById("sprintreport").innerHTML = output;
	}
	
	function drawChart(response) {
		response.splice(-1,1);
		
		var datearray = [];
		var estimatearray = [];
		var ideallinearray = [];
		var count = 0;
		var yInit=(Number(response[0].estimate)/60);
		var prevCount=yInit;
		for (var i in response) {
		/*for(var i=0; i<(response.length-1); i++){*/
			var now=new Date();
			datearray.push(response[i].date);
			if(Number(response[i].estimate) != 0){
				estimatearray.push(Number(response[i].estimate)/60);
				prevCount=(Number(response[i].estimate)/60);
				if((Number(response[i].estimate)/60) > count) {
					count = Number(response[i].estimate)/60;
				}
			}
			else if(Number(response[i].estimate) == 0 && Date.parse(response[i].date)<now){
				estimatearray.push(prevCount);
			}
			
			/* m is to calculate the slope of the line. This is being done to calculate the ideal line x, y points
			 * Equation to calcuate the slope of the line is, m =  change in y/change in x   =   yA − yB/xA − xB
			 */
			
			var dateC=new Date(response[i].date);
			if(dateC.getDay() == 0 || dateC.getDay() == 6){
				var y=yInit;
			}			
			else{
				var m = (0 - Number(response[0].estimate)/60) / (Object.keys(response).length - 1);
			/*
			 * Once we get slope i.e m from above equation. We can get the equation of the line
			 * i.e y − y1 = m(x − x1)
			 * so to calculate y values for every correspoding x values equation becomes
			 * in this case x1 will be lenth of the array, x will be "i" value of each iteration
			 * y = m*(x - x1.length)
			 * 
			 */
				var y = m*(i - (Object.keys(response).length - 1));
				y=Math.round(y);
				yInit=y;
			}
			ideallinearray.push(y);
		}

		 var lineChartData = {
		            labels: datearray,
		            datasets: [{
		                label: 'Open Estimate',
		                backgroundColor: "red",
		                borderColor: "red",
		                fill: false,
		                lineTension: 0.5,
		                data: estimatearray
		            }, {
		                label: 'Ideal Line',
		                backgroundColor: "green",
		                borderColor: "green",
		                fill: false,
		                data: ideallinearray
		            }]

		        };
		      draw()
		      function draw() {
		          var ctx = document.getElementById("burndowncanvas").getContext("2d");
		          window.myLine = new Chart(ctx, {
		              type: 'line',
		              data: lineChartData,
		              options: {
		                    // Elements options apply to all of the options unless overridden in a dataset
		                    // In this case, we are setting the border of each bar to be 2px wide and green
		               
		                    
		                    responsive: true,
		                    legend: {
		                        position: 'bottom',
		                    },
		                    scales: {
		                        xAxes: [{
		                        	gridLines: {
		                                 color: "rgba(255,255,255,0)"
		                             },
		                             scaleLabel: {
			                                display: true,
			                                labelString: 'Date'
			                         }
		                        }],
		                        yAxes: [{
		                        	scaleLabel: {
		                                display: true,
		                                labelString: 'Story Points'
		                              }
		                        }]
		                    }
		                }
		            });
		        };
	}
	
	function drawBarChart(data) {
		
		var sprintnamearray = [];
		var storypointsclosedarray = [];
		var storypointstotalarray = [];
		for ( var i in data) {
			sprintnamearray.push(data[i].sprintname);
			storypointsclosedarray.push(data[i].storypointsclosed);
			storypointstotalarray.push(data[i].storypointstotal);
		}
		 var barChartData = {
		            labels: sprintnamearray,
		            datasets: [{
		                label: 'Commitment',
		                backgroundColor: "rgba(220,220,220,0.5)",
		                data: storypointstotalarray
		            },
		            {
		                label: 'Completed',
		                backgroundColor: "green",
		                data: storypointsclosedarray
		            }]

		     };
		    draw()
		    function draw() {
		          var ctx = document.getElementById("canvassprintvelocity").getContext("2d");
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
		                             }, 
		                        	scaleLabel: {
		                        		display: true,
		                        		labelString: 'Sprint'
		                        	}
		                        }],
		                        yAxes: [{
		                        	ticks: {
	                        		beginAtZero:true,
	                        		//stepSize: 1
	                                },
	                                scaleLabel: {
		                                display: true,
		                                labelString: 'Story Points'
	                                }
		                 
		                        }]
		                    }
		                }
		            });

		        };
	}
	
	function drawReleaseBurndownChart(data) {
		
		var sprintnamearray = [];
		var workaddedarray = [];
		var workremainingarray = [];
		var workcompletedarray = [];
		var remainingsprintsarray = [];
		var remainingsprintsworkcompletearray = [];
		console.log(data);
		for (var i in data) {
			sprintnamearray.push(data[i].sprintname);
			workaddedarray.push(data[i].workadded);
			workremainingarray.push(data[i].workremaining);
			workcompletedarray.push(data[i].workcompleted);
			remainingsprintsarray.push(0);
			remainingsprintsworkcompletearray.push(0);
		}
		
		var velocitysum = 0;
		if(workcompletedarray.length > 3) {
			for(var i = workcompletedarray.length - 1; i > workcompletedarray.length-4; i--) {
				velocitysum = velocitysum + workcompletedarray[i];
			}
		}
		var averageVelocity = 0;
		if(velocitysum==0){
			averageVelocity = 0;
		}else{
		 averageVelocity = velocitysum/3;
		var workremsprints = workremainingarray[workremainingarray.length-1];
		while(workremsprints != 0) {
			workremsprints = workremsprints - parseInt(averageVelocity);
			remainingsprintsarray.push(workremsprints);
			remainingsprintsworkcompletearray.push(parseInt(averageVelocity));
			sprintnamearray.push("");
		} 
		}
	
		var barChartData = {
		            labels: sprintnamearray,
		            datasets: [{
		                label: 'Work added',
		                backgroundColor: "#4a6785",
		                data: workaddedarray
		            },
		            {
		                label: 'Work Remaining',
		                backgroundColor: "#6C96C3",
		                data: workremainingarray
		            },
		            {
		                label: 'Work Completed',
		                backgroundColor: "#D4DFC1",
		                data: workcompletedarray
		            },
		            {
		                label: 'ForecastedWorkRemaining',
		                backgroundColor: "#D9D9D9",
		                data: remainingsprintsarray
		            },
		            {
		                label: 'ForecastedWorkComplete',
		                backgroundColor: "#EEEEEE",
		                data: remainingsprintsworkcompletearray
		            }]

		     };
		   	draw()
		    function draw() {
		          var ctx = document.getElementById("canvasreleaseburndownchart").getContext("2d");
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
		                             },
		                             stacked: true
		                        }],
		                        yAxes: [{
		                        	ticks: {
	                        		beginAtZero:true,
	                        		//stepSize: 1
	                                },
	                                stacked: true
		                        } ]
		                    }
		                }
		            });

		        };
	}

});
