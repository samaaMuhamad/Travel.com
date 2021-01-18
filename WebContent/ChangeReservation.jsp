<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import ="java.time.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.user.*" %>
<%@ page import ="com.hotel.*" %>
<%@ page import ="com.Reservation.*" %>
<% %>

<!DOCTYPE html>
<html>
<%
	Connection con = DBConnection.initializeDB();


	//String username = (String)session.getAttribute("username");

	String reservationID = request.getParameter("reservationID");
	ReservationDao reservationDao = new ReservationDao();
	
	ResultSet rs  = reservationDao.viewReservationsToChange(con, reservationID);	
%>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


<title>Insert title here</title>
</head>
<body>
<header id="includedContent"></header>
<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Change Reservation</h4>
			</div>
			<div class="card-body">
<form action ="UpdateReservation" method = "get">
	<%
		
		while(rs.next()){
	%>
	<div class="form-row">
						<div class="form-group col-12">
							<label for="name">From Date</label>
							<input type="date" class="form-control" id="from" name="from"  value = '<%=rs.getDate("fromDate") %>'/>
						</div>
						<div class="form-group col-12">
							<label for="name">To Date</label>
							<input type="date" class="form-control" id="to" name="to"  value = '<%=rs.getDate("toDate") %>'/>
						</div>
						<div class="form-group col-12">
							<label for="mobile" > Number of Adults </label>
							<input type="number" class="form-control" id="adults" name="adults" value = '<%=rs.getInt("adults")%>'/>
						</div>
						<div class="form-group col-12">
							<label for="password">Number of children</label>
							<input type="number" class="form-control" id="children" name="children" value = '<%=rs.getInt("children")%>'/>
						</div>
						<button name = "reservationID" type="submit" class="btn btn-primary px-5 w-100" value ="<%=reservationID%>">Change Reservation</button>
		
  <%
					}
					%>
					</div>
</form>
			
	
	
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
 </script> 

</body>
</html>