<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.techm.adopt.bean.*"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!--refreshes code for every sec. <meta http-equiv="refresh" content="1"> -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pipeline Jobs</title>
<!-- Bootstrap Core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="resources/css/landing.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/dash/buildgraph.js"></script>
<script type="text/javascript" src="resources/js/dash/statusofPL.js"></script>
<link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
      <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      
      
      
   <!--    <script>
      var asdf = false;
      function StartTime(){
        if(asdf)clearTimeout(asdf)
        asdf = setTimeout("RefreshPage()",2000);
      }
      function RefreshPage(){
clearTimeout(asdf)
        if(document.Test.CB1.checked)
          document.location.href= document.location.href
      }
      function LoadPage(){
        var findCheck = document.location.href.split("?Chec");
        if(findCheck.length == 2){
          document.Test.CB1.checked=true;
          StartTime()
        }
      }
    </script>
       -->
      
      
      
      
      
</head>
<body >



<!-- 
<form name="Test">
      <input type="checkbox" name="CB1" onclick="StartTime()">
    </form> -->



<div>
<div>




<% response.addHeader("Refresh","5"); %>   
	<div class="container">
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath}/projecthome"><img style="margin-top: -12px; height: 44px;"
                                         src="resources/img/adopt.png" /></a>
				</div>
			</div>
			
		</nav>
	</div>
	
<%-- 	<div>
	<% response.addHeader("Refresh","2"); %>
	<sql:setDataSource var="databaseutility" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://10.53.67.18:3306/osadopt"
     user="devops"  password="devops"/>
<sql:query dataSource="${databaseutility}" var="result">
   SELECT * from pipeline_jobs_details where status='running'
 </sql:query>
 <center>
 
 <br><br> --%>


<%-- <c:forEach var="row" items="${result.rows}">
<tr>
 <td><c:out value="${row.job_name}"/></td>
   
 
</tr>
</c:forEach>
</center>
 --%>


</div>
	
<br><br>

<%-- <div id="runningjob"><center><b><font size="6">Running job: ${jname}</font></b></center> </div> --%>
<%-- <c:if test="${jname =='Tera_Adopt_UAT'}">
<center><b><font size="6">Deploying in UAT</font></b></center>
</c:if>
<c:if test="${jname =='Tera_Adopt_preprod'}">
<center><b><font size="6">Deploying in preprod</font></b></center>
</c:if>
<c:if test="${jname =='Tera_Adopt_prod'}">
<center><b><font size="6">Deploying in prod</font></b></center>
</c:if>
<c:if test="${jname =='Acceptance_Testing'}">
<center><b><font size="6">Acceptance Testing</font></b></center>
</c:if>
<c:if test="${jname =='Preproduction_Testing'}">
<center><b><font size="6">Preproduction Testing</font></b></center>
</c:if>
<c:if test="${jname =='Sanity_Testing'}">
<center><b><font size="6">Sanity Testing</font></b></center>
</c:if>
<c:if test="${jname ==null}">
<center><b><font size="6">No Activity</font></b></center>
</c:if> --%>
<center><b><font size="6">Deployment Status</font></b></center>
<div id="pipeline"></div>
	<div id="RunningTab"></div>
	
	</div>
	<br><br>
	
	
</body>

</html>