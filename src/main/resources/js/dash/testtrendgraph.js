$(document).ready(function() {
	$.get('testtrend', drawChart);
	$.get('testtrendtable', drawTable);
	
	function drawChart(response) {		
		if(response == ""){
			document.getElementById("testtrendtable").innerHTML = '<p style="font-size: 12px; padding-top: 90px; padding-left: 150px; padding-bottom: 93px;">No Data Present</p>';
		}
		
		else{
			var output = "";
		
			output +='<table class="table table-bordered" id="testtrendtable" style="font-size: 12px">';
			output += '<thead>';
			output += '<tr>';
			output += '<th>Build Number</th>';
			output += '<th>No. of Test Cases</th>';
			output += '<th>Passed</th>';
			output += '<th>Failed</th>';
			output += '<th>Status</th>';
			output += '</tr>';
			output += '</thead>';
			output += '<tbody>';
			for ( var i in response) {
				var status="";
				output += '<tr>';
				output += '<td>' + response[i].buildNumber+'</td>';
				output += '<td>' + response[i].totalCount +'</td>';
				output += '<td>' + response[i].passedCount +'</td>';
				output += '<td>' + response[i].failedCount +'</td>';
			
				if (response[i].failedCount==0){
					status="Passed";
					output += '<td style="color:green"><b>' + status +'</b></td>';	
				}
				else{
					status="Failed";
					output += '<td><b>' + status +'</b></td>';	
				}			
		
				output += '</tr>';
			
			}
			output += '</tbody>';
			output += ' </table>';
			
			document.getElementById("testtrendtable").innerHTML = output;
		}
	}

	function drawTable(data){
		if(data == ""){
			document.getElementById("testtrendreport").innerHTML ='<p style="padding-top:10px;">No Data Present.</p>';
		}
		else{
			var output = "";
			output += ' <table class="table table-bordered table-striped">';
			output += '<thead>';
			output += '<tr>';
			output += '<th>Build Number</th>';
			output += '<th>No. of Test Cases</th>';
			output += '<th>Passed</th>';
			output += '<th>Failed</th>';
			output += '<th>Duration</th>';
			output += '<th>Environment</th>';
			output += '<th>Status</th>';
			output += '</tr>';
			output += '</thead>';
			output += '<tbody>';
			
			for ( var i in data) {
				var status="";
				output += '<tr>';
				output += '<td>' + data[i].buildNumber+'</td>';
				output += '<td>' + data[i].totalCount +'</td>';
				output += '<td>' + data[i].passedCount +'</td>';
				output += '<td>' + data[i].failedCount +'</td>';
				output += '<td>' + data[i].duration +'</td>';
				output += '<td>' + data[i].environment +'</td>';
			
				if (data[i].failedCount==0){
					status="Passed";
					output += '<td style="color:green">' + status +'</td>';	
				}
				else{
					status="Failed";
					output += '<td>' + status +'</td>';	
				}			
		
				output += '</tr>';
			}
			
			output += '</tbody>';
			output += ' </table>';
			
			document.getElementById("testtrendreport").innerHTML = output;
		}		
	}
	
});
