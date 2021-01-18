<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="com.user.*"%>
<%@page import="com.hotel.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

<title>Sign in form</title>
</head>
<body>
		
	<!-- navigation bar -->
	<header>
		<nav class="navbar navbar-expand p-3 pl-5">
		 	<div class="row w-100">				
		 		 <div class="col-9">
			        <a class="navbar-brand font-weight-bold" href="#"><h1>Travel.com</h1></a>
			   	 </div>
		 	</div>
		 </nav>
		
	</header>

	<!-- content -->
	<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<a href="signnUp.html" class="float-right btn btn-outline-primary mt-1">sign up</a>
				<h4 class="card-title mt-2">Sign in</h4>
			</div>
			<div class="card-body">
				<form name ="signIN" id="signinForm" method="POST" action="validateInfoServlet">
					<div class="form-row">
						<div class="form-group col-12">
							<label for="username">Username <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="username" name="username" required>
						</div>
						<div class="form-group col-12">
							<label for="password">Password <span class="text-danger">*</span></label>
							<input type="password" class="form-control" id="password" name="password"  required>
						</div>
						<div class="form-group col-12">
							<input type="checkbox" onclick="showPassword()"> Show Password
						
						</div>
						<br>
<!-- 						<span id="valid"></span> -->
					</div>
					<br>
					
					<button type="" class="btn btn-primary w-100">Sign in</button>
<!-- 					<input onblur="checkUserExist()" id ="s" type="button" class="btn btn-primary px-5 w-100" value="sign in" >  -->
				</form>
			</div>
		</div>
	</div>
	

	<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
	    function checkUserExist(){
	        var xmlhttp = new XMLHttpRequest();
	        var username =  document.getElementById("username").value;	
	        var password =  document.getElementById("password").value;	
	        var url = "validData.jsp?username=" + username + "&password=" + password;
	        xmlhttp.onreadystatechange = function()
	        {
	            if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
	            {
	            	alert(xmlhttp.responseText);
	            	if ((xmlhttp.responseText.indexOf('Either Username or Password is wrong') == -1)) 
	            	{	  
	            		<%
                    	//  System.out.println("servlet");
                    	String username = request.getParameter("username");
         		       String password = request.getParameter("password");

         		      Connection con = DBConnection.initializeDB();
         			 UserDao userDao = new UserDao();

                    	HttpSession session2 = request.getSession();
   					 session.setAttribute("username", username);
   					 session.setAttribute("password", password);
   					 String type = userDao.getType(username, password,con);
   					 System.out.println(type);
   					 if(type.equalsIgnoreCase("admin")) {
   						String hotelName = userDao.getHotelName(username,con);
   						session.setAttribute("hotelName", hotelName);
   						System.out.println(hotelName);
   						RequestDispatcher requestDispatcher;
   						requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
   						requestDispatcher.forward(request, response);
   					 }
   					 else if(type.equalsIgnoreCase("client")) {
   							RequestDispatcher requestDispatcher;
   							requestDispatcher = request.getRequestDispatcher("HomePageClient.jsp");
   							requestDispatcher.forward(request, response);
   					}

                    	%>
	            	}
                     else 
                     {
	            		    alert("Either the username or password is wrong");
                     }
	            	
	            }
	            
	        };
	        try
	        {
		        xmlhttp.open("GET",url,true);
		        xmlhttp.send();
	    	}catch(e){alert("unable to connect to server");}
	    }
	    </script>
</body>
</html>