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

<%
HttpSession session2 = request.getSession();
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>

</head>
<body>
<!-- navigation bar -->
	<header id="includedContent"></header>

<%
String to= request.getParameter("toDate");
String from= request.getParameter("fromDate");
String hotel = (String) session.getAttribute("hotelName");
Connection con = DBConnection.initializeDB();
ReservationDao reservationDao = new ReservationDao();
ResultSet rset= reservationDao.getReservationsByDate(con , from , to,hotel );
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
	<div class="row my-2 mx-0">
		<form class="col-4 mx-auto" method="POST" action="cancelReservation.jsp">
			<br> <b>If you want to cancel a reservation, enter its ID and press Cancel:</b><br>
				 <input type="text" class="form-control mt-1" name="reservationID" placeholder="ID for reservation to cancel" id="cancel"required >  
				<input type="submit" class="btn btn-primary px-5 mt-3 w-50" name="submit" value="Cancel Reservation" ><br>
		</form>
	</div>
	
	<% 
            }		     	
            else{%>

	<h1 class="headcss">No Reservations!</h1>
	<% }%>
	
<script>
	  function validateForm() {
	  var cancel = document.getElementById("cancel").value;
	  if (cancel == "") {
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

function checkIDExist(){
        var xmlhttp = new XMLHttpRequest();
        var id =  document.getElementById("cancel").value;	        var url = "existID.jsp?reservationID=" + id;
        console.log("henaa fel id"+id);
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            	if (!(xmlhttp.responseText.indexOf('ID is Valid') == -1)) {
            		   //do something
            		document.getElementById("isU").style.color = "green";
            		}
                 else if(!(xmlhttp.responseText.indexOf('No reservation with this ID') == -1)) {
                     document.getElementById("isU").style.color = "red";
                 }
                document.getElementById("isU").innerHTML = xmlhttp.responseText;
            }
            
        };
        try{
	        xmlhttp.open("GET",url,true);
	        xmlhttp.send();
    	}catch(e){alert("unable to connect to server");}
    }
    
</script> 
</body>
</html>