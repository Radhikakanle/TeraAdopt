<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Home</title>
<spring:url value="resources/css/bootstrap.min.css" var="bootstrapCss"></spring:url>
<!-- Bootstrap Core CSS -->
<link href="${bootstrapCss}" rel="stylesheet">

<!-- Custom CSS -->
<link href="<spring:url value='resources/css/landing.css' />" rel="stylesheet">
</head>

<body id="home_page">

	<!-- Navigation -->
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<a class="navbar-brand" href="#"><img style="margin-top: -12px; height: 44px;"
                                         src="<spring:url value='resources/img/adopt.png' />" /></a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left"></ul>
					<ul class="nav navbar-nav navbar-right">

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><i
								class="glyphicon glyphicon-user"></i> Sign In</a>
							<div class="dropdown-menu form-login stop-propagation"
								role="menu">
								<form:errors path="login.*"/>
								<form:form name="loginForm" modelAttribute="login" action="authentication" method="post">
									<div class="form-group">
										<form:label for="exampleInputEmail1" path="username"><i
											class="glyphicon glyphicon-user"></i> User Name</form:label> <form:input
											type="text" class="form-control" path="username" name="username"
											id="username" placeholder="Enter Username" />
									</div>
									<div class="form-group">
										<form:label for="exampleInputPassword1" path="password"><i
											class="glyphicon glyphicon-lock"></i> Password</form:label> <form:input
											type="password" class="form-control" path="password" name="password"
											id="password" placeholder="Password" />
									</div>
									<input type="submit" value="Login"
										class="btn btn-success btn-block">
								</form:form>
							</div></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>

	<!-- Header Carousel -->
	<header id="myCarousel" class="carousel slide">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<!--  <li data-target="#myCarousel" data-slide-to="2"></li>-->
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="fill"
					style="background-image: url('resources/img/intro-bg.png;text=Slide One');"></div>
				<h2 style="font-size: 45px;">WELCOME</h2>
				<div class="carousel-caption">
					<h2 style="font-size: 45px;">WELCOME</h2>
					<h2 style="font-size: 25px;">DevOps platform supporting
						people, process and tools transformation, Real-Time governance,
						measurement, reporting and traceability, Standardization of
						process and tooling/automation</h2>
				</div>
			</div>
			<div class="item">
				<div class="fill"
					style="background-image: url('resources/img/bg2.png;text=ANIL');"></div>
				<div class="carousel-caption">

					<h2 style="font-size: 45px;">BENEFITS OF ADOPT</h2>

					<h2 style="font-size: 25px;">
						Increased frequency of deployments<br> Greater collaboration
						among departments<br> More customers using company's
						software/services<br> Reduction in time spent
						fixing/maintaining apps<br> Shorter time to market
					</h2>

				</div>
			</div>
			<!-- <div class="item">
				<div class="fill"
					style="background-image: url('img/bg3.png;text=Slide Three');"></div>
				<div class="carousel-caption">
					<h2>Caption 3</h2>
				</div>
			</div> -->
		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="icon-prev"></span>
		</a> <a class="right carousel-control" href="#myCarousel"
			data-slide="next"> <span class="icon-next"></span>
		</a>
	</header>

	<!-- Page Content -->
	<div class="container container-fluid"></div>
	<!-- /.container -->
	<div id="panel-quad">
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
								<li>Dedicated sales and marketing team for NA, EUR and APAC</li>
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
								<li>DevOps Value Assessment (ROI and benefits showcase) to
									commit futuristic benefits</li>
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
						<div class="panel-body">
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
								<li>DevOps lab having license from partners - CA, IBM, HP,
									Collabnet</li>
								<li>Build differenciated DevOps offering such as ADOPT (End
									to End DevOps offering)</li>
								<li>Artifacts migration kits</li>
							</ul>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script src="<spring:url value='/resources/js/jquery.js' />"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<spring:url value='/resources/js/bootstrap.min.js' />"></script>

	<!-- Script to Activate the Carousel -->
	<script>
		$('.carousel').carousel({
			interval : 5000
		//changes the speed
		})
	</script>

	<script>
$('.stop-propagation').on('click', function (e) {
    e.stopPropagation();
});
</script>

	<footer class="footer-home">
		<div class="row">
			<div class="col-lg-12">
				
					<!-- <br /> <span class="footerst">Report Railroad Emergencies:
						800-832-5452 | General Inquiries</span><br /> <span class="footerst">©2015
						BNSF Railway Company. All Rights Reserved.</span> -->
				<span class="footrest">Powered By </span>
				<br/><span class="footrest"><img style="height: 44px; margin-left:-8px; width: 172px" src="<spring:url value='resources/img/tmlogo.jpg' />" /></span>
				
			</div>
		</div>
	</footer>
</body>

</html>
