<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/fonts/font-awesome.css" rel="stylesheet">
<link href="resources/css/theme.css" rel="stylesheet">
<link href="resources/css/adopt.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.min.js"></script>

<script type="text/javascript" src="resources/js/dash/projectburndowngraph.js"></script>
</head>
<body id="tab_body">
	<div class="loader"></div>
	<div class="glow">
  		<h2>Active Sprint, Burndown</h2>
  		<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
  		<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
  		<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
  		<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
  		<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
  		<div id="projectburndown">
    		<div class="dropdown pull-right" style="margin:5px;"></div>
			<br/>
  			<canvas id="burndowncanvas"></canvas>
  		</div>
	</div>
	
	<div class="glow">
		<h2>Velocity Chart</h2>
		<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
		<div id="velocitychart">
  			<canvas id="canvassprintvelocity"></canvas>
  		</div>
	</div>	
	
	<div class="glow">
		<h2>Sprints Summary</h2>
		<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
		<div class="table-responsive" id="sprintreport"></div>
	</div>
	
	<div class="glow">
		<h2>Release Burndown</h2>
		<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
		<div id="releaseburndown"></div>
		<br/>
  		<canvas id="canvasreleaseburndownchart"></canvas>
  </div>
  
  <div class="glow">
		<h2>Deployment Summary</h2>
		<a href="#" id="pdf-btn2"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn2"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn2"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn2"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn2"><i class="fa fa-floppy-o"></i></a>
		<div class="table-responsive" id="tabledeployment"></div>
  </div>
  
  <script>
	$(document).ready(function(){
		$.get('deploymenttable', function(data) {
			var output = "";
			var count = 0;
			output += ' <table class="table table-bordered table-striped">';
			output += '<thead>';
			output += '<tr>';
			output += '  <th>Build Number</th>';
			output += '  <th>Deployed Environment</th>';
			output += '  <th>Deployment Status</th>';
			output += '  <th>Deployment Date</th>';
			output += '  <th>Duration</th>';
			output += '</tr>';
			output += '</thead>';
			output += '<tbody>';
			for ( var i in data) {
				output += '  <tr>';
				output += '<td><a href="#popup1" id="buildname'+i+'">' + data[i].buildDisplayName
					+ '</a></td>';
				output += '<td>' + data[i].deployedEnvironment + '</td>';
				output += '<td>' + data[i].deploymentStatus + '</td>';
				output += '<td>' + data[i].deploymentStartDate + '</td>';
				output += '<td>' + data[i].deploymentDuration + '</td>';
				output += '</tr>';
				count++;
			}
		
			output += '</tbody>';
			output += ' </table>';
		
			document.getElementById("tabledeployment").innerHTML = output;
			$('a').on('click', function(){
				var outputtask = "";
				for(var i in data) {
					if($(this).text() == data[i].buildDisplayName) {
						outputtask += '  <tr>';
						outputtask += '<td>' + data[i].taskName
							+ '</a></td>';
						outputtask += '<td>' + data[i].taskParent + '</td>';
						outputtask += '<td>' + data[i].taskUrl + '</td>';
						outputtask += '</tr>';
					}
				}
				document.getElementById("popupbody").innerHTML = outputtask;
			});

		});
	});
	
	$(document).ajaxComplete(function(){
		$(".loader").delay(2000).fadeOut();
	});
</script>

<div id="popup1" class="overlay">
	<div class="popup">
		<a class="close" href="#">&times;</a>
		<div class="content">
			<table class="table table-striped pop-tab">
				<thead>
					<tr>
						<th>Task Name</th>
						<th>Story Name</th>
						<th>Task Url</th>
					</tr>
				</thead>
				<tbody id="popupbody">
				
				</tbody>
			</table>
		</div>
	</div>
</div>

</body>
</html>