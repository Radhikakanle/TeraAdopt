<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/fonts/font-awesome.css" rel="stylesheet">
<link href="resources/css/theme.css" rel="stylesheet">
<link href="resources/css/animate.css" rel="stylesheet">
<link href="resources/css/adopt.css" rel="stylesheet">
<script type="text/javascript" src="resources/js/Chart.bundle.min.js"></script>
<script type="text/javascript" src="resources/js/jquery.min.js"></script>

<script type="text/javascript" src="resources/js/dash/buildgraph.js"></script>
</head>
<body id="tab_body">
	<div class="glow">
		<h2>Build Summary</h2>
		<a href="#" id="pdf-btn"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn"><i class="fa fa-floppy-o"></i></a>
		<div id="buildtable"></div>
	</div>
	<div class="glow">
		<h2>Day wise Build Count</h2>
		<a href="#" id="pdf-btn2"><i class="fa fa-file-pdf-o"></i></a>
		<a href="#" id="xls-btn2"><i class="fa fa-file-excel-o"></i></a>
		<a href="#" id="mail-btn2"><i class="fa fa-envelope"></i></a>
		<a href="#" id="print-btn2"><i class="fa fa-print"></i></a>
		<a href="#" id="save-btn2"><i class="fa fa-floppy-o"></i></a>
		<div id="build">
		<canvas id="canvas"></canvas>
	</div>
</div>
</body>
</html>