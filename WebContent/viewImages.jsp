 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
	<div class="container my-5">
	<h3>HOTEL PHOTOS</h3>
	<div class="row">
	<div class="col-2">
	<%
	String hotel = request.getParameter("hotelName");
	 System.out.println(hotel);
		Connection con = DBConnection.initializeDB();
		java.sql.Statement stmt1 = null;
		stmt1 = con.createStatement();
		
		String query = "select path from images where hotel = '"+hotel+"'";
		ResultSet rs = stmt1.executeQuery(query);
%>
 <%
    while(rs.next()){%>
        <div><img src='<%=rs.getString("path") %>'></div>
     <% }%>
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