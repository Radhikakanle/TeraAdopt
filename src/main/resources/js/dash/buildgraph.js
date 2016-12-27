$(document).ready(function() {
	$.get('buildgraph', drawChart);
	$.get('buildtable', build);
	$.get('buildIDs',buildIDs);
	
	function buildIDs(data){
		var output="";
		output += '<select id="buildIDstable" name="buildid"  class="form-control" data-style="btn-primary" onchange="this.form.submit()">';
		output += '<option selected disabled> Build Id</option>';
		for( var i in data){
			output += '<option value='+data[i].build_details.name+'> '+data[i].build_details.name+'</option>';	
		}
		output += '</select>'		
		output += '</tbody>';

		document.getElementById("buildIdsTable").innerHTML = output;		
	}
	
	function build(data) {
		var output = "";
		output += ' <table class="table table-bordered table-striped">';
		output += '<thead>';
		output += '<tr>';
		output += '  <th>Build Number</th>';
		output += '  <th>Build Status</th>';
		output += '  <th>Build Start Date</th>';
		output += '  <th>Build Duration</th>';
		output += '</tr>';
		output += '</thead>';
		output += '<tbody>';
		for ( var i in data) {
			output += '  <tr>';
			output += '<td><a href="'+data[i].url+'">' + data[i].buildDisplayName
					+ '</td>';
			output += '<td>' + data[i].status + '</td>';
			var date=new Date(data[i].startDate);
			var month=date.getMonth()+1;
			
			output += '<td>' + date.getDate()+'-'+ month +'-'+date.getFullYear() + '</td>';
			output += '<td>' + data[i].duration + '</td>';
			output += '</tr>';
		}
		
		output += '</tbody>';
		output += ' </table>';
		
		document.getElementById("buildtable").innerHTML = output;
		
	};
	
	function drawChart(response) {
		var datearray = [];
		var passedarray = [];
		var failedarray = [];
		for ( var i in response) {
			datearray.push(response[i].startDate);
			passedarray.push(Number(response[i].passedCount));
			failedarray.push(Number(response[i].failedCount));
		}
	
	     var barChartData = {
	            labels: datearray,
	            datasets: [{
	                label: 'Passed',
	                backgroundColor: "green",
	                data: passedarray
	            }, {
	                label: 'Failed',
	                backgroundColor: "red",
	                data: failedarray
	            }]

	        };
	      draw()
	      function draw() {
	          var ctx = document.getElementById("canvas").getContext("2d");
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
	                    }
	                }
	            });

	        };
	}

})
