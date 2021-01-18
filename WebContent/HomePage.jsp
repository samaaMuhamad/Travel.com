<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
	<!-- navigation bar -->
	<header id="includedContent"></header>
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<br><br><br>
<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Welcome Admin</h4>
			</div>
			<div class="card-body">
				<form name ="" method="get" action="viewReservationByDate.jsp">
					<div class="form-row">
						<div class="form-group col-12">		
							<label for="username">Your Username:</label>
							<input type="text" class="form-control" id="username" name="username" value = '<%=(String)session.getAttribute("username")%>' disabled="disabled">
						</div>
						<div class="form-group col-12">
							<label for="hotelName">Your Hotel Name:</label>
							<input type="text" class="form-control" id="hotelName" name="hotelName" value = '<%=(String)session.getAttribute("hotelName")%>'disabled="disabled">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</body>
</html>