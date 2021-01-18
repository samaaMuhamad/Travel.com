 
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import= "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<%
HttpSession session2 = request.getSession();
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp");  
}
%>
<%
	Connection conn = DBConnection.initializeDB();
	HotelDao hotelDao = new HotelDao();
    Statement stat = null;
    java.sql.PreparedStatement stmt = null ;
    ResultSet rs = null;
      
%>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">


</head> 
<body>
	
	<header id="includedContent"></header>
	
	<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Update Hotel</h4>
			</div>
			<div class="card-body">
				<form action ="updateHotel" method = "post">
				<%
					String name =(String)session.getAttribute("hotelName");
					stat = conn.createStatement();	
				 	String query = "select * from hotel where name ='" + name +"'";	
					rs = stat.executeQuery(query);
					while(rs.next()){
				%>
					<div class="form-row">
						<div class="form-group col-12">
							<label for="location">Location</label>
							<input type="text" class="form-control" id="location" name="location"  value = '<%=rs.getString("location") %>' >
						</div>
						<div class="form-group col-12">
							<label for="contactInformation">Contact Information</label>
							<input type="text" class="form-control" id="contactInformation" name="contactInformation" value = '<%=rs.getString("contactInformation")%>'>
						</div>
						<div class="form-group col-12">
							<label for="hotelFacilities" >Hotel Facilities</label>
							<input type="text" class="form-control" id="hotelFacilities" name="hotelFacilities" value = '<%=rs.getString("hotelFacilities")%>'>
						</div>
						<div class="form-group col-12">
							<label for="otherBranches">Other Branches</label>
							<input type="text" class="form-control" id="otherBranches" name="otherBranches" value = '<%=rs.getString("otherBranches")%>'>
						</div>
						<div class="form-group col-12">
							<label for="meals">Meals</label>
							<input type="text" class="form-control" id="meals" name="meals" value = '<%=rs.getString("meals")%>'>
						</div>
						<div class="form-group col-12">
							<label for="rating">Rate</label>
							<input type="text" class="form-control" id="rating" name="rating" value = '<%=rs.getString("rating")%>'>
						</div>
						<div class="form-group col-12">
							<label for="stars">Stars</label>
							<input type="text" class="form-control" id="stars" name="stars" value = '<%=rs.getString("stars")%>'>
						</div>
					</div>
<!-- 					<div id="show"></div> -->
					<button type="submit" class="btn btn-primary px-5 w-100">Update Hotel</button>
					<%
		}
		%>
				</form>
			</div>
		</div>
	</div>
	
	
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</body>
</html>



