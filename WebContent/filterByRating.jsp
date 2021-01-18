<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.io.*" %>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.user.*" %>
  <%@ page import ="com.hotel.*" %>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%
Connection conn = DBConnection.initializeDB();
HotelDao hotelDao = new HotelDao ();
String location = (String) session.getAttribute("location");
int choice = Integer.parseInt(request.getParameter("filterByRating"));

int counter = 0;
ResultSet rset = hotelDao.FilterByRating(conn,choice, location);
ResultSet rs = hotelDao.FilterByRating(conn,choice, location);
while (rset.next()){counter++;}
%>
<body> 
	<header id="includedContent"></header>
<div class ="view-list">
<%
if(counter != 0){
	%><div class="container mt-5 ml-5">
	<div class="row"><% 
while (rs.next()){
	
		
	%>
	
	
	  <div class="col-md-4 w-100">
	             <div class="card">
	                 <div class="card-body">
	                	
	                     <h3 class="card-title"><%=rs.getString("name")%></h3>
	                     <p class="rating"><%=rs.getFloat("rating")%></p>
	                     <p class="card-text"><i class="fa fa-map-marker marker"></i> <%=rs.getString("location")%></p>
	                     <p class="card-text">
	                     	<%
							int r = rs.getInt("stars");
							for (int i = 0; i < r ; i++){
							%>
							<i class="fa fa-star star-rating"></i>
							<%} %>
						</p>
	                     <p class="card-text">EGP <%=rs.getFloat("expectedPrice")%></p>
	                     <p class="card-text" style="color:green">Available</p>
	                     <div class ="photos-button">
							<form action = "viewImages.jsp" method ="get">
							<button name="hotelName" class="btn btn-primary px-5 w-100" value="<%=rs.getString("name")%>" type="submit" id="photos">View Photos</button>
							</form>
							</div>
							<br>
							<div class ="rooms-button">
							<form action = "viewAvailableRooms.jsp" method ="get">
							<button name="hotelName" class="btn btn-primary  px-5 w-100" value="<%=rs.getString("name")%>" type="submit" id="rooms">see Rooms</button>
							</form>
							</div>
							<br>
							<div class ="map-button">
							<form action = "showMap.jsp" method ="get">
							<button name="map" class="btn btn-primary  px-5 w-100" value="<%=rs.getString("name")%>" type="submit" id="map" >Show on map</button>
							</form>
							</div>
	                 </div>
	             </div>
	         </div><%
}%></div>
</div> <%
}
else{
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/HomePageClient.jsp");
	PrintWriter out1 = response.getWriter();
	out1.println("<html> <script>  alert(\"Couldn't find a hotel.\"); </script> </html>");
	rd.include(request, response); 
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
</div>
</body>
</html>