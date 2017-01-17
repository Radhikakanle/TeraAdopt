<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300" rel="stylesheet" type="text/css">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300' rel='stylesheet' type='text/css'>   

<!--Beyond styles-->
<link id="beyond-link" href="resources/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="resources/assets/css/demo.min.css" rel="stylesheet" />
<link href="resources/assets/css/typicons.min.css" rel="stylesheet" />
<link href="resources/assets/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="resources/assets/css/skins/darkblue.css"
	rel="stylesheet" type="text/css" />

<link href="resources/css/dataTables.bootstrap.min.css" rel="stylesheet" />
<link href="resources/assets/css/jquery.dataTables.min.css" rel="stylesheet" />
	
<link rel="icon" type="image/png" href="resources/img/adopt.png">
<!-- <link href="resources/css/bootstrap.css" rel="stylesheet"> -->

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<script src="resources/assets/js/skins.min.js"></script>


<style>
	body.modal fade{
   		padding-right: 0 !important; // not important
   		position: relative;
	}
</style>
</head>
<body>
	<!-- <div class="loading-container">
        <div class="loader"></div>
    </div>  -->
    
    <!-- Navbar -->
	<div class="navbar navbar-custom  navbar-fixed-top">
		<div class="navbar-inner">
			<div class="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand"> <small> <img
							src="resources/img/adopt.png" alt="" />
					</small>
					</a>
				</div>
				<!-- <div class="sidebar-collapse" id="sidebar-collapse">
                    <i class="collapse-icon fa fa-bars"></i>
                </div> -->
                <div class="navbar-header pull-right">
                	<div class="navbar-account">
                		<ul class="account-area">
                			<li>
                				<a class="login-area dropdown-toggle" data-toggle="dropdown">
                					<section>
                                        <h2><span class="profile"><span><i class="fa fa-user"></i>&nbsp;<jsp:useBean id="loginUser"
											scope="application" class="com.techm.adopt.bean.LoginBean"></jsp:useBean>
											<jsp:getProperty property="userDisplayName" name="loginUser" /></span></span></h2>
                                    </section>                					
                				</a>
                				<ul class="pull-right dropdown-menu dropdown-arrow dropdown-login-area">
                					<li><a href="${pageContext.request.contextPath}/logout">Sign out</a></li>                					
                				</ul>
                			</li>
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
        	<!-- Page Sidebar -->
            <div class="page-sidebar" id="sidebar">
            	<!-- Page Sidebar Header-->
                <div class="sidebar-header-wrapper">
            		Projects
            	</div>
            	<!-- Sidebar Menu -->
                <ul class="nav sidebar-menu">
                	<li>
                		<a href="#" class="menu-dropdown">
                            <i class="menu-icon fa fa-desktop"></i>
                            <span class="menu-text"> Projects </span>
                            <i class="menu-expand"></i>
                        </a>                	
                		<ul class="submenu" id="projectsList">
                			
                		</ul>
                	</li>
            	</ul>
        	</div>
        	<!-- Page Content -->
            <div class="page-content">
        		<!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                	<ul class="breadcrumb">
                		<li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>                		
                	</ul>
        		</div>
        		<!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                    	<h1>Program Dashboard</h1>
        			</div>
        		</div>
        		<!-- Page Body -->
                <div class="page-body">
                	<div class="row">
                		<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                			<div class="widget">
								<div class="widget-header">
									<span id="widget-caption-id" class="widget-caption">Program Report</span>
									<!-- <div class="widget-buttons">
										<a href="#" data-toggle="collapse">
                                        	<i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                        	<i class="fa fa-times"></i>
                                        </a>										
									</div> -->
								</div>
								<div class="widget-body">
									<div id="portfoliochart" class="chartcontainer">
										<canvas id="portfolio"></canvas>										
									</div>
									<div id="portfoliochart2" class="chartcontainer">
										<canvas id="portfolio2"></canvas>
									</div>
									<div id="portfoliochart3" class="chartcontainer">
										<canvas id="portfolio3"></canvas>
									</div>
									<div id="portfoliochart4" class="chartcontainer">
										<canvas id="portfolio4"></canvas>
									</div>
								</div>
							</div>
                		</div>
    					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
    						<div class="widget">
								<div class="widget-header">
									<span class="widget-caption">Release Status of Projects</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="collapse">
                                        	<i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                        	<i class="fa fa-times"></i>
                                        </a>										
									</div>
								</div>
								<div class="widget-body">
									<div class="chartcontainer">
										<canvas id="releasestatus"></canvas>										
									</div>
								</div>
							</div>
    					</div>
    					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
    						<div class="widget">
								<div class="widget-header">
									<span class="widget-caption">Open Issues</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="collapse">
                                        	<i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                        	<i class="fa fa-times"></i>
                                        </a>										
									</div>
								</div>
								<div class="widget-body">
									<div class="chartcontainer">
										<canvas id="openissues"></canvas>										
									</div>
								</div>
							</div>
    					</div>
    					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                			<div class="widget">
								<div class="widget-header">
									<span class="widget-caption">Project Status(Based on CodeQuality)</span>
									<div class="widget-buttons">
										<a href="#" data-toggle="collapse">
                                        	<i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                        	<i class="fa fa-times"></i>
                                        </a>										
									</div>
								</div>
								<div class="widget-body">
									<div id="projectstatustable" style="height: 252px;"></div>									
								</div>
							</div>
                		</div>
                	</div>
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
	
	<!--Basic Scripts-->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

	<!--Beyond Scripts-->
	<script src="resources/assets/js/beyond.min.js"></script>
	
	<!--Page Related Scripts-->
	<!-- <script src="resources/assets/js/datatable/jquery.dataTables.min.js"></script>
    <script src="resources/assets/js/datatable/ZeroClipboard.js"></script>
    <script src="resources/assets/js/datatable/dataTables.tableTools.min.js"></script>
    <script src="resources/assets/js/datatable/dataTables.bootstrap.min.js"></script>
    <script src="resources/assets/js/datatable/datatables-init.js"></script> -->
	
	<script src="resources/js/Chart.bundle.min.js"></script> 
	<!-- <script type="text/javascript" src="resources/js/dataTables.bootstrap.min.js"></script>  -->
	<script type="text/javascript" src="resources/js/jquery.dataTables.min.js"></script> 
	
	<script type="text/javascript" src="resources/js/dash/portfolio.js"></script>
	<script type="text/javascript" src="resources/js/dash/openissues.js"></script> 
	
	<script type="text/javascript">
	/* $(document).ajaxComplete(function(){
		$(".loading-container").delay(2000).fadeOut();
	}); */
		var projects;
		$.get('projectlist', function(response){
			projects=response;
			var uList=$('#projectsList');
			$.each(response,function(i){
				var span = $('<span />').attr({'class':'menu-text'}).html(response[i]);
				var a = $('<a/>').attr('href','#').attr('onclick','submitFunction('+i+')').append(span);
				var li=$('<li/>').append(a).appendTo(uList);			
			})				
		});
	
		function submitFunction(index){
			var form = $(document.createElement('form'));
			$(form).attr("action", "projectformsubmit");
			$(form).attr("method", "POST");
			var input = $("<input>").attr("type", "hidden").attr("name", "projectname").val(projects[index]);
			$(form).append($(input));
			form.appendTo( document.body );
		    $(form).submit();
		}
		
	</script> 
	<script>
	$(document).ready(function() {
	    $('#simpledatatable').dataTable();
	} );
    </script>
</body>
</html>