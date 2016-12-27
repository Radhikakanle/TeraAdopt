<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.techm.adopt.bean.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	
<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/jquery-ui.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/jquery.scrolltabs.js"></script>
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link rel="icon" type="image/png" href="resources/img/adopt.png">
<link href="resources/fonts/font-awesome.css" rel="stylesheet">
<link href="resources/css/theme.css" rel="stylesheet">
<link href="resources/css/adopt.css" rel="stylesheet">
<link href="resources/css/landing.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/scrolltabs.css">
<link rel="stylesheet" href="resources/css/intab.css">	

</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a id="homeUrl" class="navbar-brand" href="${pageContext.request.contextPath}/userhome"><img style="margin-top: -12px; height: 44px;"
                                         src="resources/img/adopt.png" /></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><form name="projectform" id="projectform"
							action="projectdashboard" method="post"
							class="navbar-form navbar-right">
							<div class="form-group">
								<select id="ProjectList" class="form-control" name="projectname"></select>
							</div>
						</form></li>
					<li
						style="color: grey; margin-top: 15px; margin-left: 8px; font-size: 1.5em; font-family: Rockwell;"><%=session.getAttribute("currentProject").toString()%></li>

				</ul>

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
						</ul></li>
				</ul>
			</div>
		</div>
		<!-- /.navbar-collapse -->

		<!-- /.container -->
	</nav>
	
	<div class="header hdCol">
		<div class="container"></div>
	</div>
	<!--header ends-->
	
	<!--content-->
	<div class="container">
		<div class="row">
			<!-- new-->
			<div class="scroller scroller-left">
				<i class="glyphicon glyphicon-chevron-left"></i>
			</div>
			<div class="scroller scroller-right">
				<i class="glyphicon glyphicon-chevron-right"></i>
			</div>
			<form id="page" action="application" method="get">
				<div class="wrapper">
					<ul class="nav nav-tabs list dshnavTop " role="tablist" id="tab1">
						<c:forEach var="lb" items="${tabsList}">
							<li role="presentation"><a data-toggle="tab" role="tab"
								href="${lb.tabName}" aria-expanded="false" class="dshnavTxt">${lb.tabDisplayName}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</form>
			<button type="button" class="slide-toggle">&#x25B2;</button>
		</div>
		<!--tab panes-->
		
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane marTop active" id="dash">
			</div>
			<c:forEach var="lb" items="${iframeurl}">
				<ul class="breadcrumb" id="${lb.tabName}">
					<li><a href="#"><%=session.getAttribute("currentProject").toString()%></a></li>
					<c:choose>
						<c:when test="${lb.tabDisplayName == \"Project Home\"}">
							<li class=""></li>
						</c:when>
						<c:otherwise>
							<li class="active">${lb.tabDisplayName}</li>
						</c:otherwise>
					</c:choose>
				</ul>
				<iframe src="${lb.tabUrl}" id="ifr2" name="myiframe"></iframe>
			</c:forEach>
		</div>
		<!--tab-content ends-->
	</div>
	<!--outer tab panel ends-->
	<!--outer row ends-->
	<!--content-->
	<!-- /.container -->
	
	<script>
	$(document).ready(function() {
		var up = '\u25B2'
		var down = '\u25BC'
		$(".slide-toggle").click(function() {
			$(".list").slideToggle();
			$(".wrapper").slideToggle();
			$(".glyphicon-chevron-right").slideToggle();
			$(".glyphicon-chevron-left").slideToggle();
			$(this).text($(this).text() == down ? up : down);
		});
	});
	
	$('#tab1 a').each(function(){
		var clickobject = $('.breadcrumb').attr("id");
		if(clickobject == $(this).attr("href")) {
			$(this).parent('li').addClass('active');
			var pagetitle = $(this).text();
			$('title').text("Adopt: "+pagetitle);
		}
	});

	$('#tab1 a').on('click', function() {
		var submitval = $(this).attr('href');
		
		$('#page').append("<input type='hidden' name='pagename' value='"+
					submitval+"' />");
		$("#page").submit();
		
	});
	</script>
	
	<script type="text/javascript">
	var hidWidth;
	var scrollBarWidths = 40;

	var widthOfList = function(){
	  var itemsWidth = 0;
	  $('.list li').each(function(){
	    var itemWidth = $(this).outerWidth();
	    itemsWidth+=itemWidth;
	  });
	  return itemsWidth;
	};

	var widthOfHidden = function(){
	  return (($('.wrapper').outerWidth())-widthOfList()-getLeftPosi())-scrollBarWidths;
	};

	var getLeftPosi = function(){
	  return $('.list').position().left;
	};

	var reAdjust = function(){
	  if (($('.wrapper').outerWidth()) < widthOfList()) {
	    
	    $('.scroller-right').show();
	  } else {
	    $('.scroller-right').hide();
	  }
	  
	  if (getLeftPosi()<0) {
	      alert(getLeftPosi);
	    $('.scroller-left').show();
	  } else {
	      $('.scroller-left').hide();
	    $('.item').animate({left:"-="+getLeftPosi()+"px"},'slow');
	  }
	}

	reAdjust();

	$(window).on('resize',function(e){  
	    reAdjust();
	});

	$('.scroller-right').click(function() {
	  $('.scroller-left').fadeIn('slow');
	  $('.scroller-right').fadeOut('slow');
	  
	  $('.list').animate({left:"+="+widthOfHidden()+"px"},'slow',function(){
	  });
	});

	$('.scroller-left').click(function() {
	  
	    $('.scroller-right').fadeIn('slow');
	    $('.scroller-left').hide();
	   
	    $('.list').animate({left:"-="+getLeftPosi()+"px"},'slow',function(){
	    });
	}); 
	
	$.get('projectlist', function(response){
		var projectlist = [];
		projectlist.push("PROJECTS &#9660;");
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
	});

	if('${loginUser.accessControl.programLevelAccess}' == 'false'){
		$("#homeUrl").attr("href", "${pageContext.request.contextPath}/projecthome");
	}else{
		var dropdown=document.getElementById("dropdowncondition");
		var opt=document.createElement("a");
		opt.setAttribute("href","${pageContext.request.contextPath}/projecthome");
		opt.innerHTML="Back To ProjectHome";
		dropdown.insertBefore(opt,dropdown.lastElementChild);
	}
	
	$('#ProjectList').change(function() {
		$('#projectform').submit();
	});
	</script>
	<!-- scroll bar script ends here -->
</body>
</html>