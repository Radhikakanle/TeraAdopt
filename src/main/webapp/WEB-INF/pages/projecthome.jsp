<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.techm.adopt.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adopt: Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">

<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/blackdash2.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/Chart.bundle.min.js"></script>

<script type="text/javascript" src="resources/js/dash/buildgraph.js"></script>
<script type="text/javascript" src="resources/js/dash/deploymentgraph.js"></script>
<script type="text/javascript" src="resources/js/dash/codeanalysis.js"></script>
<script type="text/javascript" src="resources/js/dash/projectburndowngraph.js"></script>
<script type="text/javascript" src="resources/js/dash/testtrendgraph.js"></script> 

<link href='https://fonts.googleapis.com/css?family=Fredoka+One'
	rel='stylesheet' type='text/css' />
<link rel="icon" type="image/png" href="resources/img/adopt.png">

<style>
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
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a id="side-btn"><i class="glyphicon glyphicon-plus"></i></a> <a
					id="homeUrl" class="navbar-brand" href="${pageContext.request.contextPath}/userhome"><img
					style="margin-top: -12px; height: 44px;" src="resources/img/adopt.png" /></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
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
						<li
						style="color: grey; margin-top: 10px; margin-left: 10px; margin-right: 10px; font-size: 1.5em; font-family: Rockwell;"><%=session.getAttribute("currentProject").toString()%></li>
					<li><a id="moreInfo" href="projectdashboard?projectname=${currentProject}">More Info</a></li>
					<%-- <li><form name="buildform" id="buildform" action="buildPromotion">
					<a href="#ABPModal" class="btn btn-md btn-success" data-toggle="modal">AutoBuildPromotion</a>
					</form></li> --%>

				</ul>
				
				<a id="autoBuild" href="#BUILDModal" class="btn btn-md btn-success" data-toggle="modal">AutoBuild Promotion</a>

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <jsp:useBean id="loginUser"
								scope="application" class="com.techm.adopt.bean.LoginBean"></jsp:useBean>
							<jsp:getProperty property="userDisplayName" name="loginUser" /> <b
							class="caret"></b></a>
						  <ul role="menu" class="dropdown-menu">
						<li id="dropdowncondition">
							<a href="${pageContext.request.contextPath}/logout">Logout</a>
						</li> 
						</ul> 
					</li> 
				</ul>
			</div>
		</div>
	</nav>
	
	<div id="sidebar">
	    <h2>My Projects</h2>
	    <div class="list-group">
			<form id="listofprojects" action="projectformsubmit" method="post"></form>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
				<div class="col-md-4 col-sm-6 col-xs-12">

				<div id="projectburndown" class="borders">
					<h2>Active Sprint Burndown</h2>
					<canvas id="burndowncanvas"></canvas>
				</div>
			</div>
			
			<div class="col-md-4 col-sm-6 col-xs-12">

				<div id="build" class="borders">
					<h2>BUILD</h2>
					<canvas id="canvas"></canvas>
				</div>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">

				<div id="deploymentdaily" class="borders">
					<h2>DEPLOYMENT</h2>
					<canvas id="canvasdeploymentdaily"></canvas>
				</div>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">


				<div id="deploymentenv" class="borders">
					<h2>DEPLOYMENT PER ENVIRONMENT</h2>
					<canvas id="canvasdeploymentenv"></canvas>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-xs-12">

				<div id="codeanalysis" class="borders">
					<h2>CODE ANALYSIS</h2>
					<canvas id="codeanalysiscanvas"></canvas>
				</div>
			</div>
		
			<div class="col-md-4 col-sm-6 col-xs-12">

				<div id="testtrend" class="borders">
					<h2>TEST TREND</h2>
					<div id="testtrendtable"></div>
				</div>
			</div>
		</div>
	</div>

	<script>
	$(document).ajaxComplete(function(){
		$(".loader").delay(2000).fadeOut();
	});
	
	$(document).ready(function() {
		$("#sidebar").hide();
		$("#side-btn").click(function() {
			$(this).find('i').toggleClass('glyphicon-plus').toggleClass('glyphicon-remove');
			$("#sidebar").animate({width : "toggle"});
		});
		
		if('${loginUser.accessControl.projectDashboardAccess}' == 'false'){
			$("#moreInfo").hide();
		}
		
		if('${loginUser.accessControl.autoBuildAccess}' == 'false'){
			$("#autoBuild").hide();
		}
	
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

			var sel = document.getElementById('listofprojects');
		 	for (var i = 0; i < projectlist1.length; i++) {
		 		var opt1 = document.createElement('input');
		 	
		 		opt1.setAttribute("name","projectname");

				opt1.setAttribute("type","submit");
			  	opt1.setAttribute("value", projectlist1[i]);
			  	opt1.setAttribute("class","list-group-item btn-block");
		     	sel.appendChild(opt1);
			 }

		 	var proj='${currentProject}';
			$('#listofprojects input').each(function(){
				if(proj == $(this).val()){
					$(this).addClass('active').siblings().removeClass('active');
					$(this).prop('disabled', true);
					}
				});
			 
		});
		
		$('#ProjectList').change(function() {
			$('#projectform').submit();
		});
	});
	
	if('${loginUser.accessControl.programLevelAccess}' == 'false'){
		$("#homeUrl").attr("href", "#");
		var dropdown=document.getElementById("dropdowncondition");
		var opt=document.createElement("a");
		opt.setAttribute("href","${pageContext.request.contextPath}/selectrole");
		opt.innerHTML="Switch Role";
		dropdown.insertBefore(opt,dropdown.lastElementChild); 
	}
	
	$(document).ajaxComplete(function(){
		$(".loader").delay(2000).fadeOut();
	});
	</script>
	
	<div id="BUILDModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">Delivery Pipeline</h4>
				</div>
				<div class="modal-body">
					<form action="buildpipeline" method="post">
						<p> Select the Build Id to trigger Pipeline <p>
						<div id="buildIdsTable" class="styled-select green rounded"></div>
					</form>
				</div>	
			</div>
		</div>
	</div>
	
</body>
</html>