<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/landing.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<a class="navbar-brand" href="#"><img style="margin-top: -12px; height: 44px;"
                                         src="resources/img/adopt.png" /></a>
				</div>
			</div>
		</nav>
	</div>
	<div style="text-align: center;" >
		<br>
		<h2><b>Select Role Here</b></h2>
		<br>

		<form role="form" action="userhome" method="post">
			<div id="roleproj"></div>
			<button id="saveButton" type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$.get('roleslist', urtable); 
	 		function urtable(data){
		 		var output = "";

		 		output +='<div class="form-group">';
				output +='<label for="selectrole">Select Role:</label> ';
				output +='<select name="usersrole">';
		 		for ( var i in data) {
				output +='<option value="'+ data[i] +'">'+data[i]+'</option>';
		 		}
			 	output +='</select>';
		 	output +='</div>';

		 	document.getElementById("roleproj").innerHTML = output;
	 	}	
	});
</script>
</body>
</html>