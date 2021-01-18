 <%@page import="com.hotel.*"%>
<%@page import="com.room.*"%>
<%@ page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.user.*" %>

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
	UserDao userDao = new UserDao();
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
				<h4 class="card-title mt-2">Update User Info</h4>
			</div>
			<div class="card-body">
				<form action ="" class="formcss" method="POST">
				<%
				String username=(String)session.getAttribute("username");
				stat = conn.createStatement();	
			 	String query = "select * from User where username ='" + username +"'";	
				rs = stat.executeQuery(query);
				if(rs.next()){
				
				%>
					<div class="form-row">
						<div class="form-group col-12">
							<label for="name">Name</label>
							<input type="text" class="form-control" id="name" name="name"  value = '<%=rs.getString("name") %>'/>
						</div>
						<div class="form-group col-12">
							<label for="email">Email</label>
							<input type="email" class="form-control" id="email" name="email" value = '<%=rs.getString("email")%>'/>
						</div>
						<div class="form-group col-12">
							<label for="mobile" > Mobile phone </label>
							<input type="text" class="form-control" id="mobile" name="mobile" value = '<%=rs.getString("mobile")%>'/>
						</div>
						<div class="form-group col-12">
							<label for="password">Password</label>
							<input type="text" class="form-control" id="password" name="password" value = '<%=rs.getString("password")%>'/>
						</div>
						<div class="form-group col-12">
							<label for="type">Type</label>
							<input type="text" class="form-control" id="type" name="type" value = '<%=rs.getString("type")%>'disabled="disabled"/>
						</div>
					</div>
<!-- 					<div id="show"></div> -->
					<button type="submit" class="btn btn-primary px-5 w-100">Update User Info</button>
					<%
					}
					else{%>

					<% }%>
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

 <%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobile = request.getParameter("mobile");
String password1 = request.getParameter("password");


User user = new User(username,name,mobile,password1,email);
if(name != null && email != null && mobile != null && password1 != null){
	userDao.updateInfo(user, conn);
	System.out.println(username);

	System.out.println("btngana2");
	PrintWriter out1 = response.getWriter();
	out1.println("<html> <script>  alert(\"Updated SUCESSFULLY.\"); </script> </html>");
	response.sendRedirect("updateUserInfo.jsp");
//	rd.include(request,response);
}else{
	
	
}

%>


