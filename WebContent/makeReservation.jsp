<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import ="com.user.*" %>
<%@ page import ="com.room.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


</head> 
<body>
	
	<header id="includedContent"></header>
<%
HttpSession session2 = request.getSession();
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%
Connection con = DBConnection.initializeDB();
RoomDao room = new RoomDao();
String roomNumber = request.getParameter("roomNumber");
String hotel = room.roomHotel(roomNumber, con);
System.out.println("ccccccc: "+hotel);
session.setAttribute("hotel", hotel);
String fromDate = room.roomFromDate(roomNumber,con);
String toDate = room.roomToDate(roomNumber,con);
String username = (String)session.getAttribute("username");
int adults = (int)session.getAttribute("adults");
int children = (int)session.getAttribute("children");


%>
<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Reserve Room</h4>
			</div>
			<div class="card-body">
			
				<form action ="addReservation" method = "get">
					<div class="form-row">
						<div class="form-group col-12">
							<label for="roomNumber">RoomNumber</label>
							<input type="text" class="form-control" id="roomNumber" name = "roomNumber" value='<%=roomNumber %>' />
						</div>
						<div class="form-group col-12">
							<label for="username">Client Name</label>
							<input type="text" class="form-control" name = "username" value='<%=username %>' type ="text"/>
						</div>
						<div class="form-group col-12">
							<label for="fromDate">From</label>
							<input name = "fromDate" id="fromDate" class="form-control" value='<%=fromDate %>' type ="text"/>
						</div>
						<div class="form-group col-12">
							<label for="toDate">To</label>
							<input name = "toDate" id="toDate" class="form-control" value='<%=toDate %>' type ="text"/>	
						</div>
						<div class="form-group col-12">
							<label for="adults">number of Adults</label>
							<input name = "adults" id="adults" class="form-control" value='<%= adults %>' type ="number"/>
						</div>
						<div class="form-group col-12">
							<label for = "children">number of children</label>
							<input name = "children" id="children" class="form-control" value='<%=children %>' type ="number"/>
						</div>
					</div>
					<button type="submit" class="btn btn-primary px-5 w-100">Reserve</button>
				</form>
</div>
		</div>
	</div>
<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
    </script>
</body>
</html>