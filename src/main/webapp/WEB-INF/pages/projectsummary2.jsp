<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adopt: Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">

<!--Basic Styles-->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link href="resources/assets/css/font-awesome.min.css" rel="stylesheet" />
<link href="resources/assets/css/weather-icons.min.css" rel="stylesheet" />

<!--Fonts-->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300"
	rel="stylesheet" type="text/css">
<link href='http://fonts.googleapis.com/css?family=Roboto:400,300'
	rel='stylesheet' type='text/css'>

<!--Beyond styles-->
<link id="beyond-link" href="resources/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="resources/assets/css/demo.min.css" rel="stylesheet" />
<link href="resources/assets/css/typicons.min.css" rel="stylesheet" />
<link href="resources/assets/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="resources/assets/css/skins/darkblue.css"
	rel="stylesheet" type="text/css" />
<link href="resources/assets/css/dataTables.bootstrap.css"
	rel="stylesheet" />

<link rel="icon" type="image/png" href="resources/img/adopt.png">

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="resources/assets/js/skins.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	
<style>

.iclass {
	width: 96%;
	height: 75vh;
	border: 0px;
	margin-top: 1px;
	margin-left: 12px;
	border: 2px solid #ddd;
	border-radius: 6px;
}

.diviId {
	border: 0px;
	height: 75vh;
	background-color: white;
	margin-top: 1px;
	margin-left: 12px;
	border: 2px solid #ddd;
	border-radius: 6px;
}

#planningDiv {
	width: 100%;
}
</style>

<link rel="stylesheet" href="resources/css/scrolltabs.css">
<link rel="stylesheet" href="resources/css/intab.css">	
</head>
<body>




	<!-- <div class="loading-container">
        <div class="loader"></div>
    </div>  -->

	<!-- Navbar -->
	<div class="navbar navbar-custom navbar-fixed-top">
		<div class="navbar-inner">
			<div class="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand"> <small> <img
							src="resources/img/adopt.png" alt="" />
					</small>
					</a>
				</div>
				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="collapse-icon fa fa-bars"></i>
				</div>
				<div align="center">
					<!-- <a id="ABP" class="btn btn-md btn-success" data-toggle="modal"
						target="content">AutoBuild Promotion</a> -->
				</div>
				<div class="navbar-header pull-right">
					<div class="navbar-account">
						<ul class="account-area">
							<li><a class="login-area dropdown-toggle"
								data-toggle="dropdown"> <section>
									<h2>
										<span class="profile"><span><i
												class="fa fa-user"></i>&nbsp;<jsp:useBean id="loginUser"
													scope="application" class="com.techm.adopt.bean.LoginBean"></jsp:useBean>
												<jsp:getProperty property="userDisplayName" name="loginUser" /></span></span>
									</h2>
									</section>
							</a>
								<ul
									class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
									<li><a href="${pageContext.request.contextPath}/logout">Sign
											out</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</div>








	</div>

	<!-- Main Container -->
	<div class="main-container container-fluid">
		<!-- Page Container -->
		<div class="page-container">
			<!-- <ul>
            	<li>
            		<button>Home</button>
            	</li>
            </ul> -->

			<!-- Page Sidebar -->
			<div class="page-sidebar" id="sidebar">
				<!-- Page Sidebar Header-->
				<div class="sidebar-header-wrapper">
					<h4 class="menu-text"
						style="color: red; width: 100px; margin: 0px auto"><%=session.getAttribute("currentProject").toString()%></h4>
				</div>
				<!-- Sidebar Menu -->
				<ul class="nav sidebar-menu">
					<li class="active open"><a href="#" class="menu-dropdown">
							<i class="menu-icon fa fa-desktop"></i> <span class="menu-text">All
								Projects</span> <i class="menu-expand"></i>
					</a>
						<ul class="submenu" id="projectsList"></ul></li>
					<li><a href="#" class="menu-dropdown"> <span
							class="menu-text"> </span>
					</a></li>
					<c:forEach var="rp" items="${reportpage}">
						<li class="reportsLi" data-report-page="${rp.pageName}">
							<%-- <a href="${pageContext.request.contextPath}/${rp.pageName}" class="menu-dropdown"> --%>
							<a href="#" class="menu-dropdown"> <span class="menu-text">${rp.name}</span>
						</a>
						</li>
					</c:forEach>

				</ul>
			</div>
			<!-- Page Content -->






			<div class="page-content">
				<nav class="navbar navbar-inverse">
				<div class="container-fluid">
					<div class="navbar-header">
						<!-- <a class="navbar-brand" href="#">Tools Integrated</a> -->
					</div>
					<ul class="nav navbar-nav">
						<li><a id="jira" href="#"
							target="iframe">Jira</a></li>
						<li><a id="jenkins"
							href="#"
							target="iframe">Jenkins</a></li>
						<!-- <li><a id="sonar" href="#"
							target="iframe">Sonar</a></li> -->
						<li><a id="bitbucket" href="#"
							target="iframe">Bit Bucket</a></li>
							<li><a id="sonar" href="#"
							target="iframe">Sonarqube</a>
						<li><a id="tomcat" href="#"
							target="iframe"><%=session.getAttribute("currentProject").toString()%></a></li>
							
							<li><a id="testlink" href="#"
							target="iframe">Test link</a></li>
							
							<li><a id="ABP" data-toggle="modal"
						target="content">AutoBuild Promotion</a></li>
							
							
<li> ${rp.pageName}</li>
					</ul>

				</div>
				</nav>
			</div>



			<div id="BUILDModal" hidden align="center">

				<form action="buildpipeline" id="myForm" >
					<p>
					</p>
					<div id="buildIdsTable" class="styled-select green rounded"></div>
					<div id="progressbar-4"></div>

					<div id="score"
						style="resize: both; border: 2px solid green; overflow: auto; height: 300px;"
						hidden></div>
						<div id="buildIdsTable" width=100>
					
						</div>

					<input type="submit" id="subPromotion" name="startBuild"
						value="Promote" class="btn btn-primary"
						onClick="return confirm('Are you sure you want to deploy the selected build ?')">
						
				</form>
				
				<form id="form-id" action = "taskHistory">
				<div id="predeploys" style="width:650px"> </div>
				</form>
			</div>


	
			<div id="iframe" class="horizontal" hidden>
				<iframe name="iframe"  width=1100 height=600
					align="right"></iframe>
			</div>
			

			<div class="page-content" id="reports">
				<!-- Page Breadcrumb -->
				<div class="page-breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="fa fa-home"></i> <a href="#">Home</a></li>
					</ul>
				</div>
				<!-- Page Header -->

				<div class="page-header position-relative">
					<div class="header-title">
						<h1>
							Project Dashboard -
							<%=session.getAttribute("currentProject").toString()%></h1>
					</div>
				</div>
				<!-- Page Body -->
				<div class="page-body">
					<!-- <iframe class="iclass" name="iframePage" scrolling="no"></iframe> -->

					<div class="row">
						<div class="col-xs-12">

							<div id="planningDiv">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="sprintReport">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Active Sprint Burndown</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="burndowncanvas"></canvas>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="velocityChart">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Velocity Chart</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="canvassprintvelocity"></canvas>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"
										id="sprintSummary">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Sprints Summary</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<div class="table-responsive" id="sprintreport"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="releaseBurndown">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Release Burndown</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="canvasreleaseburndownchart"></canvas>
												</div>
											</div>
										</div>
									</div>									
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Deployment Summary</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<div class="table-responsive" id="tabledeployment"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="buildDiv">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="buildDetails">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Build Summary</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<div id="buildtable"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="buildGraph">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Day wise Build Count</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="canvas"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="codeQualityDiv">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="cASummaryTable">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Code Analysis Summary</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<div id="codeanalysistable"></div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="cASummaryGraph">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Code Analysis Issue
													Summary</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="codeanalysiscanvas"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="deploymentDiv">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="deploymentDaywise">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Day wise Deployment
													count</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="canvasdeploymentdaily"></canvas>
												</div>
											</div>
										</div>
									</div>
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="deploymentEnvironment">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Day wise Deployment
													count on each Environment</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<canvas id="canvasdeploymentenv"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="testingDiv">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"
										id="testTrend">
										<div class="widget">
											<div class="widget-header ">
												<span class="widget-caption">Test Trend</span>
												<div class="widget-buttons">
													<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
													<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
													<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
													<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
													<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
												</div>
											</div>
											<div class="widget-body">
												<div class="chartcontainer">
													<div id="testtrendreport"></div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				</frame>
			</div>
		</div>






	</div>

	<!--Basic Scripts-->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

	<!--Beyond Scripts-->
	<script src="resources/assets/js/beyond.min.js"></script>

	<script type="text/javascript" src="resources/js/Chart.bundle.min.js"></script>
	<script type="text/javascript"
		src="resources/js/dash/projectburndowngraph.js"></script>
	<script type="text/javascript" src="resources/js/dash/buildgraph.js"></script>
	<script type="text/javascript" src="resources/js/dash/codeanalysis.js"></script>
	<script type="text/javascript"
		src="resources/js/dash/deploymentgraph.js"></script>
	<script type="text/javascript"
		src="resources/js/dash/testtrendgraph.js"></script>
	<script type="text/javascript" src="resources/js/dash/accesscontrol.js"></script>

	<script type="text/javascript">
		var reportpagename = $('.reportsLi').first().data('report-page');
		$('.reportsLi').first().addClass('active');
		$('#planningDiv').show();
		$('#buildDiv').hide();
		$('#codeQualityDiv').hide();
		$('#deploymentDiv').hide();
		$('#testingDiv').hide();

		var projects;
		$.get('projectlist', function(response) {
			projects = response;
			var uList = $('#projectsList');
			$.each(response, function(i) {
				var span = $('<span />').attr({
					'class' : 'menu-text'
				}).html(response[i]);
				var a = $('<a/>').attr('href', '#').attr('onclick',
						'submitFunction(' + i + ')').append(span);
				if (response[i] == "${currentProject}")
					var li = $('<li/>').addClass('active').append(a).appendTo(
							uList);
				else
					var li = $('<li/>').append(a).appendTo(uList);
			})
		});

		function submitFunction(index) {
			var form = $(document.createElement('form'));
			$(form).attr("action", "projectformsubmit");
			$(form).attr("method", "POST");
			var input = $("<input>").attr("type", "hidden").attr("name",
					"projectname").val(projects[index]);
			$(form).append($(input));
			form.appendTo(document.body);
			$(form).submit();
		}

		$('.reportsLi').click(function() {
			$('.reportsLi.active').removeClass('active');
			$(this).addClass('active');
			var pagename = $(this).data('report-page');

			if (pagename == 'projectsummary') {
				$('#planningDiv').show();
				$('#buildDiv').hide();
				$('#codeQualityDiv').hide();
				$('#deploymentDiv').hide();
				$('#testingDiv').hide();
				$('#iframe').hide();
				$("#BUILDModal").hide();
				$("#reports").show();
			} else if (pagename == 'buildreports') {
				$('#planningDiv').hide();
				$('#buildDiv').show();
				$('#codeQualityDiv').hide();
				$('#deploymentDiv').hide();
				$('#testingDiv').hide();
				$('#iframe').hide();
				$("#BUILDModal").hide();
				$("#reports").show();
			} else if (pagename == 'codequalityreports') {
				$('#planningDiv').hide();
				$('#buildDiv').hide();
				$('#codeQualityDiv').show();
				$('#deploymentDiv').hide();
				$('#testingDiv').hide();
				$('#iframe').hide();
				$("#BUILDModal").hide();
				$("#reports").show();
			} else if (pagename == 'deploymentreports') {
				$('#planningDiv').hide();
				$('#buildDiv').hide();
				$('#codeQualityDiv').hide();
				$('#deploymentDiv').show();
				$('#testingDiv').hide();
				$('#iframe').hide();
				$("#BUILDModal").hide();
				$("#reports").show();
			} else if (pagename == 'testingreports') {
				$('#planningDiv').hide();
				$('#buildDiv').hide();
				$('#codeQualityDiv').hide();
				$('#deploymentDiv').hide();
				$('#testingDiv').show();
				$('#iframe').hide();
				$("#BUILDModal").hide();
				$("#reports").show();
			}
		});
	</script>
	<script>
		$(document)
				.ready(
						function() {
							$
									.get(
											'deploymenttable',
											function(data) {
												var output = "";
												var count = 0;
												output += ' <table class="table table-bordered table-striped">';
												output += '<thead>';
												output += '<tr>';
												output += '  <th>Build Number</th>';
												output += '  <th>Deployed Environment</th>';
												output += '  <th>Deployment Status</th>';
												output += '  <th>Deployment Date</th>';
												/* output += '  <th>Duration</th>'; */
												output += '</tr>';
												output += '</thead>';
												output += '<tbody>';
												for ( var i in data) {
													output += '  <tr>';
													output += '<td><a href="#popup1" id="buildname'+i+'">'
															+ data[i].buildDisplayName
															+ '</a></td>';
													output += '<td>'
															+ data[i].deployedEnvironment
															+ '</td>';
													if(data[i].deploymentStatus == true){
														output += '<td>Success</td>';
													}
													else{
														output += '<td>Failure</td>';
													}
															
															
													output += '<td>'
															+ data[i].deploymentStartDate
															+ '</td>';
													/* output += '<td>'
															+ data[i].deploymentDuration
															+ '</td>'; */
													output += '</tr>';
													count++;
												}

												output += '</tbody>';
												output += ' </table>';

												document
														.getElementById("tabledeployment").innerHTML = output;
												$('a')
														.on(
																'click',
																function() {
																	var outputtask = "";
																	for ( var i in data) {
																		if ($(
																				this)
																				.text() == data[i].buildDisplayName) {
																			outputtask += '  <tr>';
																			outputtask += '<td>'
																					+ data[i].taskName
																					+ '</a></td>';
																			outputtask += '<td>'
																					+ data[i].taskParent
																					+ '</td>';
																			outputtask += '<td>'
																					+ data[i].taskUrl
																					+ '</td>';
																			outputtask += '</tr>';
																		}
																	}
																	document
																			.getElementById("popupbody").innerHTML = outputtask;
																});

											});
						});

		if ('${loginUser.accessControl.sprintReportAccess}' == 'false') {
			$('#sprintReport').css('display', 'none');
		}

		if ('${loginUser.accessControl.velocityChartAccess}' == 'false') {
			$('#velocityChart').css('display', 'none');
		}

		if ('${loginUser.accessControl.sprintSummaryAccess}' == 'false') {
			$('#sprintSummary').css('display', 'none');
		}

		if ('${loginUser.accessControl.releaseBurndownAccess}' == 'false') {
			$('#releaseBurndown').css('display', 'none');
		}

		if ('${loginUser.accessControl.deploymentSummaryAccess}' == 'false') {
			$('#deploymentSummary').css('display', 'none');
		}

		if ('${loginUser.accessControl.buildGraph}' == 'false') {
			$('#buildGraph').css('display', 'none');
		}

		if ('${loginUser.accessControl.buildDetails}' == 'false') {
			$('#buildDetails').css('display', 'none');
		}

		if ('${loginUser.accessControl.cASummaryGraph}' == 'false') {
			$('#cASummaryTable').css('display', 'none');
		}

		if ('${loginUser.accessControl.cASummaryAccess}' == 'false') {
			$('#cASummaryGraph').css('display', 'none');
		}

		if ('${loginUser.accessControl.deploymentDaywiseAccess}' == 'false') {
			$('#deploymentDaywise').css('display', 'none');
		}

		if ('${loginUser.accessControl.deploymentEnvironmentAccess}' == 'false') {
			$('#deploymentEnvironment').css('display', 'none');
		}

		if ('${loginUser.accessControl.testTrendAccess}' == 'false') {
			$('#testTrend').css('display', 'none');
		}
	</script>
	
	
	
<script>
$(document).ready( function() {
	

	
 $.getJSON( "resources/properties/json_data.json", function(obj) { 
  $.each(obj, function(key, value) { 
	  $('#jira').attr('href',value.jira);
	  $('#jenkins').attr('href',value.jenkins);
	  $('#bitbucket').attr('href',value.bitbucket);
	  $('#sonar').attr('href',value.sonar);
	  $('#tomcat').attr('href',value.tomcat+"<%=session.getAttribute("currentProject").toString()%>");
	  $('#testlink').attr('href',value.testlink);
  });
 });
});
</script>



	<script>
		$(document).ready(function() {

			$("#jira").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			$("#sonar").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			$("#jenkins").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			$("#bitbucket").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			$("#tomcat").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			$("#testlink").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});
			
			$("#pipe").click(function() {
				$("#iframe").show();
				$("#reports").hide();
				$("#BUILDModal").hide();
			});

			$("#ABP").click(function() {
				$("#BUILDModal").show();
				$("#reports").hide();
				$("#iframe").hide();
			});
		});
	</script>


</body>
</html>