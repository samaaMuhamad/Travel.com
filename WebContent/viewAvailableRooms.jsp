 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.io.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.room.*" %>
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

	String hotel = request.getParameter("hotelName");
	System.out.println("bbb: "+hotel);
	Connection con = DBConnection.initializeDB();
	RoomDao roomDao = new RoomDao();
	ResultSet rs = roomDao.viewAllRooms(hotel, con);
	ResultSet rst = roomDao.viewAllRooms(hotel, con);
	int counter = 0;
	while (rst.next()){  counter++;}
	if(counter!=0){
	if(rs.next()){
	%>
	<div class="row my-5 mx-0">
	<table class="table table-bordered col-10 mx-auto">
		<thead class="thead-dark">
            <tr>
                <th>Type</th>
                <th>Room Number</th>
                <th>Facilities</th>
                <th>From Date</th>
                <th>To Date </th>
                <th>Reserve</th>
            </tr>
           </thead>
            <%
               do { %>
            <tr>
                <td><%=rs.getString("type")%></td>
                <td><%=rs.getString("roomNumber")%></td>
                <td><%=rs.getString("roomFacilities")%></td>
                <td><%=rs.getString("startAvDate")%></td>
                <td><%=rs.getString("endAvDate")%></td>
                <td>
                <div class ="reserved-button">
                <form action="makeReservation.jsp" method ="get">
				<button name="roomNumber" class="btn btn-primary"value="<%=rs.getString("roomNumber")%>" type="submit" id="reserve">reserve</button>
				</form>
				</div>
                
                </td>
            </tr>
            <%}while(rs.next());%>
            
	</table>
	<%
	}
	} else{
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/HomePageClient.jsp");
		PrintWriter out1 = response.getWriter();
		out1.println("<html> <script>  alert(\"No avaliable rooms .\"); </script> </html>");
		rd.include(request, response); 
		//response.sendRedirect("searchForHotel.jsp");
	}
%>
<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
 </script> 
</body>
</html>