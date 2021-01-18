<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*"%>

<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.room.*" %>
  <%@ page import = "com.Reservation.*" %>
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
<%
String username= request.getParameter("username");

Connection con = DBConnection.initializeDB();
UserDao userDao = new UserDao();
ResultSet rset= userDao.getAllClients(con);
if (rset.next())
{
%>
<div class="row my-5 mx-0">
	<table class="table table-bordered col-6 mx-auto">
		<thead class="thead-dark">
		    <tr>
		      <th scope="col">Username</th>
		      <th scope="col">Name</th>
		    </tr>
		</thead>
		<tbody>
		<%
					      
					                do {%>
			<tr>
				<td><%=rset.getString("username")%></td>
				<td><%=rset.getString("name")%></td>
			</tr>
			<%}while (rset.next());%>
		</tbody>
	</table>
</div>
	<br />
	
	<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">View Client Information</h4>
			</div>
			<div class="card-body">
				<form name ="" method="post" action="viewClientInformation.jsp">
					<div class="form-row">
						<div class="form-group col-12">
							<label for="username">Enter Client Username<span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="username" name="username" required>
						</div>
					</div>
					<button type="submit" class="btn btn-primary px-5 w-100" value="View Client Information" >View Client Info</button>
				</form>
			</div>
		</div>
	</div>
	<div id="show"></div>
	<%}else{%>
	<h1 class="headcss">No Clients exist!! </h1>
	<%}%>
	
</body>

	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</html>