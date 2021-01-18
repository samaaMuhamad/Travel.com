 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.Reservation.*" %>
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
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%

	String username = (String)session.getAttribute("username");
	Connection con = DBConnection.initializeDB();
	ReservationDao reservationDao = new ReservationDao();
	ResultSet rs = reservationDao.viewUserReservations(username, con);
	if(rs.next()){
	%>
<div class="row my-5 mx-0">
	<table class="table table-bordered col-10 mx-auto">
		<thead class="thead-dark">
            <tr>
                <th scope="col">reservationID</th>
                <th scope="col">From Date</th>
                <th scope="col">To Date</th>
                <th scope="col">Hotel</th>
                <th scope="col">Room Number</th>
                <th scope="col">number of adults</th>
                <th scope="col">number of children</th>
                <th scope="col">Payment</th>
                <th scope="col">Activities</th>
            </tr>
         </thead>
            <%
               do { %>
            <tr>
                <td><%=rs.getString("reservationID")%></td>
                <td><%=rs.getString("fromDate")%></td>
                <td><%=rs.getString("toDate")%></td>
                <td><%=rs.getString("hotel")%></td>
                <td><%=rs.getString("roomNumber")%></td>
                <td><%=rs.getInt("adults")%></td>
                <td><%=rs.getInt("children")%></td>
                <td><%=rs.getString("payment") %></td>
        			
                <td>
           			<div class ="cancel-button d-inline">
		                <form action="CancelReservation" method ="get" class="d-inline">
						<button name="reservationID"  class="btn btn-primary "value="<%=rs.getString("reservationID")%>" type="submit" id="cancel">
						Cancel</button>
						</form>
					</div>
						
					<div class ="reserved-button d-inline">
		                <form action="ChangeReservation.jsp" method ="get" class="d-inline">
		                <button name ="reservationID"  class="btn btn-primary"value= "<%=rs.getString("reservationID")%>" type ="submit" id ="change">
		                Change
		                </button>
		                </form>
		           </div>			
                </td>
                
            </tr>
            <%}while(rs.next());%>
            
	</table>
	<%
	}
	 else{%>

		<h1 class="headcss">You have no Reservations!</h1>
		<% }%>


		
<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
 </script> 

</body>
</html>