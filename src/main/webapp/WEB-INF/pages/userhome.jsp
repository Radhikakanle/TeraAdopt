<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.techm.adopt.bean.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adopt: Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">

<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/blackdash2.css" rel="stylesheet"> 
<link href='https://fonts.googleapis.com/css?family=Fredoka+One'
	rel='stylesheet' type='text/css' />
<link rel="icon" type="image/png" href="resources/img/adopt.png">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/dash/portfolio.js"></script> 
<script type="text/javascript" src="resources/js/dash/projectstatusgraph.js"></script> 
<script type="text/javascript" src="resources/js/dash/openissues.js"></script>  

<style>
/* body{
	background-color: white;
} */

.cust {
height: 10%;
}
 #issuestable td {
	color: black;
} 

#modaltitle {
	color: black;
}

.table {
  border: 0.5px solid #000000;
}
.table-bordered > thead > tr > th,
.table-bordered > tbody > tr > th,
.table-bordered > tfoot > tr > th,
.table-bordered > thead > tr > td,
.table-bordered > tbody > tr > td,
.table-bordered > tfoot > tr > td {
   border: 0.5px solid #000000;
   text-align: center;
}
</style>
</head>

<body>
	<div class="loader"></div>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<a  id="homeUrl" class="navbar-brand" href="${pageContext.request.contextPath}/userhome"><img
				  style="margin-top: -12px; height: 44px;" src="resources/img/adopt.png" /></a>
			</div>
			
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><form name="projectform" id="projectform"
							action="projectformsubmit" method="post"
							class="navbar-form navbar-right">
							<div class="form-group">
								<select id="ProjectList" class="form-control" name="projectname"></select>
							</div>
						</form></li> 
				</ul>
				
				
				
				<ul class="nav navbar-nav navbar-right">
					<%-- <li style="color: grey; margin-top: 15px; margin-right: 10px;">Last Login:(${username.lastLogin})</li> --%> 
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <jsp:useBean id="loginUser"
								scope="application" class="com.techm.adopt.bean.LoginBean"></jsp:useBean>
							<jsp:getProperty property="userDisplayName" name="loginUser" /> <b
							class="caret"></b></a>
						  <ul role="menu" class="dropdown-menu">
						<li id="dropdowncondition">
							<a href="${pageContext.request.contextPath}/selectrole">Switch Role</a>
							<a href="${pageContext.request.contextPath}/logout">Logout</a>
						</li> 
						</ul> 
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-5 col-sm-6 col-xs-12 col-md-offset-1">
				<div id="portfoliochart" class="borders">
					<h2>Program Report</h2>
					<canvas id="portfolio"></canvas>
				</div>
				<div id="portfoliochart2" class="borders">
					<h2></h2>
					<canvas id="portfolio2"></canvas>
				</div>
				<div id="portfoliochart3" class="borders">
					<h2></h2>
					<canvas id="portfolio3"></canvas>
				</div>
				<div id="portfoliochart4" class="borders">
					<h2></h2>
					<canvas id="portfolio4"></canvas>
				</div>
			</div>
			<div class="col-md-5 col-sm-6 col-xs-12 ">
				<div id="projectstatuschart" class="borders">
					<h2>Project Status (Based on Code Analysis)</h2>
					<div id="projectstatustable" style="height : 265px;"></div>
			    </div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-5 col-sm-6 col-xs-12 col-md-offset-1">
				<div id="releasestatuschart" class="borders">
					<h2>Release Status of Projects</h2>
					<canvas id="releasestatus"></canvas>
				</div>
			</div>
		
			<div class="col-md-5 col-sm-6 col-xs-12">
				<div id="openissuesdiv" class="borders">
				<h2 id="oih">Open Issues</h2>
					<canvas id="openissues"></canvas>
				</div>
			</div>
		</div>
	</div>
	
	<div id="IssuesModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3 id="modaltitle" class="modal-title">Issues</h3>
				</div>
				<div class="modal-body">
					<div id="issuestablearea"></div>
				</div>
			</div>

		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ajaxComplete(function(){
			$(".loader").delay(5000).fadeOut();
		});
		
		$.get('projectlist', function(response){
			var projectlist = [];
			var projectlist1 = [];

			projectlist.push("PROJECTS");
			for( var i in response ){
				projectlist.push(response[i]);
			}
			
			var sel = document.getElementById('ProjectList');
			for (var i = 0; i < projectlist.length; i++) {
				var opt = document.createElement('option');
			  	opt.innerHTML = projectlist[i];
			  	opt.value = projectlist[i];
			  	sel.appendChild(opt);
			}

			for( var i in response ){
				projectlist1.push(response[i]);
			}			 
		});
		
		if('${loginUser.accessControl.programLevelAccess}' == 'true'){
			$("#homeUrl").attr("href", "#");
		}
		
		$('#ProjectList').change(function() {
			if('${loginUser.accessControl.projectLevelAccess}' == 'true'){
				$('#projectform').submit();
			}
		});
		
	</script>
</body>
</html>