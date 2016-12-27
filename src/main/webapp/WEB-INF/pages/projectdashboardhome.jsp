<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.techm.adopt.bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="initial-scale=0, maximum-scale=0, user-scalable=no" />
	
<link rel="stylesheet" type="text/css" href="resources/css/main.css" />
<link rel="stylesheet" type="text/css" href="resources/css/tabModule.css" />
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/adopt.css" rel="stylesheet">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/tabModule.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		tabModule.init();
	});
</script>
</head>
<body>
	<div class="demo">
		<div class="tab tab-vert">
				<ul class="tab-legend" id="reportul">
				<c:forEach var="rp" items="${reportpage}">
					<li id="${rp.id}">${rp.name}</li>
				</c:forEach>
				</ul>
			
			<ul class="tab-content" id="reportslist">
				<c:forEach var="rp" items="${reportpage}">
				<li>
					<iframe class="iclass" src="${pageContext.request.contextPath}/${rp.pageName}"></iframe>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
</body>
</html>