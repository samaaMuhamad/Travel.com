 <%@page import="java.sql.*"%>
<%@page import="com.user.*"%>
<%@page import="com.hotel.*"%>


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
String username= request.getParameter("username");

Connection con = DBConnection.initializeDB();
UserDao userDao = new UserDao();
ResultSet rset= userDao.getClients(con, username);
if (rset.next())
{
%>
<div class="row my-5 mx-0">
	<table class="table table-bordered col-6 mx-auto">
		<thead class="thead-dark">
		    <tr>
		      <th scope="col">Username</th>
		      <th scope="col">Name</th>
		      <th scope="col">E-mail</th>
		      <th scope="col">Mobile</th>
		    </tr>
		</thead>
		<tbody>
			<tr>
				<td><%=rset.getString("username")%></td>
				<td><%=rset.getString("name")%></td>
				<td><%=rset.getString("email")%></td>
				<td><%=rset.getString("mobile")%></td>
			</tr>
		</tbody>
	</table>
</div>
	<br />
	<%}else{%>
	<h1 class="headcss">No Clients exist!! </h1>
	<%}%>

<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</body>
</html>