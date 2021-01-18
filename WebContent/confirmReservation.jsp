 <%@page import="java.sql.*"%>

<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.room.*" %>
  <%@ page import = "com.Reservation.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservations</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">



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
<%
Connection con = DBConnection.initializeDB();
String hotel = (String) session.getAttribute("hotelName");
ReservationDao reservationDao = new ReservationDao();
ResultSet rset= reservationDao.getReservationsNotConfirmed(con, hotel);
if (rset.next())
{
%>
<div class="row my-5 mx-0">
	<table class="table table-bordered col-10 mx-auto">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Reservation ID</th>
				<th scope="col">From Date</th>
				<th scope="col">To Date</th>
				<th scope="col">Hotel</th>
				<th scope="col">Client Username</th>
				<th scope="col">Payment</th>
				<th scope="col">RoomNumber</th>
				<th scope="col">Number OF adults</th>
				<th scope="col">Number OF Children</th>
			</tr>
		</thead>
		<%
					      
					                do {%>
		<tr>
			<td ><%=rset.getString("reservationID")%></td>
			<td><%=rset.getDate("fromDate")%></td>
			<td><%=rset.getDate("toDate")%></td>
			<td><%=rset.getString("Hotel")%></td>
			<td><%=rset.getString("client")%></td>
			<td><%=rset.getString("payment")%></td>
			<td><%=rset.getString("roomNumber")%></td>
			<td><%=rset.getString("adults")%></td>
			<td><%=rset.getString("children")%></td>
		</tr>
		<%}while (rset.next());%>
	</table>
</div>
	<br />
	<div class="row mb-4 mx-0">
		<form class="col-4 mx-auto" method="POST" action="confirmReservationPayment.jsp">
			<br> <b>Enter reservation ID you want to confirm:</b><br>
				 <input type="text" class="form-control mt-1" name="update" placeholder="ID for reservation" id="update"> 
				<input type="submit" class="btn btn-primary px-5 mt-3 w-50" name="submit" value="ConfirmReservation" ><br>
		</form>
	</div>
	
	<% 
            }		     	
            else{%>

	<h1 class="headcss">No Reservations To Confirm!</h1>
	<% }%>
	
<script>
	  function validateForm() {
	  var update = document.getElementById("update").value;
	  if (update == "") {
	    alert("Data field cannot be empty!!");
	    return false;
	  }
	}
</script>
	
		
<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 

</body>
</html>