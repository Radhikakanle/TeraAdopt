<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>${title}</title>

<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/landing.css" rel="stylesheet">

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
					<a class="navbar-brand" href="${pageContext.request.contextPath}/home"><img style="margin-top: -12px; height: 44px;"
                                         src="resources/img/adopt.png" /></a>
				</div>
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left"></ul>
					<ul class="nav navbar-nav navbar-right">


					</ul>
				</div>
			</div>
		</nav>
	</div>

	<div class="alert alert-danger">
		<strong>${msg1}</strong> ${msg2}	
	</div>

	<div id="login-box">
		<form:form name="loginForm" modelAttribute="login" action="authentication" method="post">
			<div class="form-group">
				<form:label for="exampleInputEmail1" path="username" ><i
					class="glyphicon glyphicon-user"></i> User Name</form:label> <form:input type="text"
					class="form-control" path="username" name="username" id="username"
					placeholder="Enter Username" />
			</div>
			<div class="form-group">
				<form:label for="exampleInputPassword1" path="password" ><i
					class="glyphicon glyphicon-lock"></i> Password</form:label> <form:input
					type="password" class="form-control" path="password" name="password" id="password"
					placeholder="Password" />
			</div>
			<input type="submit" value="Login" class="btn btn-success btn-block btn-login">
		</form:form>
	</div>

	


</body>

</html>
