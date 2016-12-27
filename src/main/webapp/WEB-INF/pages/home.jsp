<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<!--Basic Styles-->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
<link id="bootstrap-rtl-link" href="" rel="stylesheet" />
<link href="resources/assets/css/font-awesome.min.css" rel="stylesheet" />

<!--Fonts-->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,600,700,300"
	rel="stylesheet" type="text/css">

<!--Beyond styles-->
<link id="beyond-link" href="resources/assets/css/beyond.min.css"
	rel="stylesheet" type="text/css" />
<link href="resources/assets/css/demo.min.css" rel="stylesheet" />
<link href="resources/assets/css/typicons.min.css" rel="stylesheet" />
<link href="resources/assets/css/animate.min.css" rel="stylesheet" />
<link id="skin-link" href="resources/assets/css/skins/darkblue.css"
	rel="stylesheet" type="text/css" />

<!--Skin Script: Place this script in head to load scripts for skins and rtl support-->
<!--  <script src="resources/assets/js/skins.min.js"></script> -->

<style>
.carousel-inner>.item {
	height: 42vh;
}

.login-container {
	margin-top: 10px;
	margin-bottom: -30px;
	padding-bottom: 40px;
}

.login-container>.loginbox {
	padding-top: 25px;
	padding-bottom: 57px;
}

.carousel-inner>.item>img {
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	max-height: 800px;
	width: auto;
}

#myCarousel {
	margin-top: 10px;
	margin-left: 10px;
}
</style>
</head>
<body>

	<!-- Navbar -->
	<div class="navbar navbar-custom">
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

			</div>
		</div>
	</div>

	<!-- Main Container -->
	<div class="main-container container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<div class="row">
					<div class="col-xs-12 col-md-8">
						<!-- Header Carousel -->
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<!--  <li data-target="#myCarousel" data-slide-to="2"></li>-->
							</ol>

							<!-- Wrapper for slides -->
							<div class="carousel-inner">
								<div class="item active">
									<!-- <div class="fill"
									style="background-image: url('assets/img/intro-bg.png');"></div> -->
									<img alt="aa" src="resources/img/intro-bg.png">
									<!-- <h2 style="font-size: 45px;">WELCOME</h2> -->
									<div class="carousel-caption">
										<h2 style="font-size: 35px;">WELCOME</h2>
										<h2 style="font-size: 20px;">DevOps platform supporting
											people, process and tools transformation, Real-Time
											governance, measurement, reporting and traceability,
											Standardization of process and tooling/automation</h2>
									</div>
								</div>
								<div class="item">
									<!-- <div class="fill"
									style="background-image: url('assets/img/bg2.png');"></div> -->
									<img alt="bb" src="resources/img/bg2.png">
									<div class="carousel-caption">

										<h2 style="font-size: 35px;">BENEFITS OF ADOPT</h2>

										<h2 style="font-size: 20px;">
											Increased frequency of deployments<br> Greater
											collaboration among departments<br> More customers using
											company's software/services<br> Reduction in time spent
											fixing/maintaining apps<br> Shorter time to market
										</h2>
									</div>
								</div>
							</div>

							<!-- Controls -->
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev"> <span class="icon-prev"></span>
							</a> <a class="right carousel-control" href="#myCarousel"
								data-slide="next"> <span class="icon-next"></span>
							</a>
						</div>
					</div>

					<div class="col-xs-12 col-md-4">
						<div class="login-container animated fadeInDown">
							<div class="loginbox bg-white">
								<div class="loginbox-title">
									<i class="fa fa-user"></i>&nbsp;Sign In
								</div>
								<form:form name="loginForm" modelAttribute="login" action="authentication" method="post">
									<div class="loginbox-textbox">
										<form:input type="text" class="form-control" path="username" name="username" id="username" placeholder="UserName" />
									</div>
									<div class="loginbox-textbox">
										<form:input type="password" class="form-control" path="password" id="password" placeholder="Password" />
									</div>
									<div class="loginbox-submit">
										<input type="submit" class="btn btn-primary btn-block"
											value="Login">
									</div>
								</form:form>
							</div>
						</div>
					</div>
				</div>
				<div class="horizontal-space"></div>
				<div class="horizontal-space"></div>
				<div class="row">
					<div class="col-lg-12">
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-bar-chart"></i>&nbsp;Business Development

									</h4>
								</div>
								<div class="panel-body">
									<ul>
										<li>Dedicated sales and marketing team for NA, EUR and
											APAC</li>
										<li>Business development managers to support delivery,
											sales and client teams.</li>
										<li>Collaborative Engagement</li>
									</ul>

								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-users"></i>&nbsp;DevOps Consulting
									</h4>
								</div>
								<div class="panel-body">
									<ul>
										<li>Experienced DevOps consultants and architects</li>
										<li>DevOps Value Assessment (ROI and benefits showcase)
											to commit futuristic benefits</li>
										<li>Maturity assessments</li>
									</ul>

								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-desktop"></i>&nbsp;Training and Enablement
									</h4>
								</div>
								<div class="panel-body" style="padding-bottom: 51px;">
									<ul>
										<li>Training and enablement programs</li>
										<li>Accreditation and Certification roadmap</li>
										<li>Refresher and skill upgrade programs</li>
									</ul>

								</div>
							</div>
						</div>

						<div class="col-md-3">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4>
										<i class="fa fa-cogs"></i>&nbsp;DevOps Lab & Solutions

									</h4>
								</div>
								<div class="panel-body">
									<ul>
										<li>DevOps lab having license from partners - CA, IBM,
											HP, Collabnet</li>
										<li>Build differenciated DevOps offering such as ADOPT
											(End to End DevOps offering)</li>
										<li>Artifacts migration kits</li>
									</ul>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Basic Scripts-->
	<script src="resources/assets/js/jquery.min.js"></script>
	<script src="resources/assets/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/slimscroll/jquery.slimscroll.min.js"></script>

	<!--Beyond Scripts-->
	<script src="resources/assets/js/beyond.js"></script>

	<footer class="footer-home">
	<div class="row">
		<div class="col-lg-12">
			<span class="footrest">Powered By </span> <span class="footrest"><img
				style="height: 44px; width: 172px" src="resources/img/tmlogo.jpg" /></span>
			<br />
			<span class="footerst">©2016 Tech Mahindra Ltd. All Rights
				Reserved.</span>
		</div>
	</div>
	</footer>
</body>
</html>