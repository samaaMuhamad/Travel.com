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

	<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2"> Enter Hotel Name</h4>
			</div>
			<div class="card-body">
				<form name ="" method="get" action="ViewComments.jsp">
					<div class="form-row">
						<div class="form-group col-12">
						
<!-- 							<input type="text" class="form-control" id="hotelname" name="hotelname" required> -->
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select id = "hotelname" class="form-control" name ="hotelname" >
							<%
								Connection conn = DBConnection.initializeDB();
								HotelDao h = new HotelDao();
								Set<String> names= h.getAllHotels(conn);
								%>
								
								<%
								for(String loc : names){
									%><option value ='<%=loc %>'><%=loc %></option>
									<%
								}
							%>
								
							</select>
                        </div>
						</div>
					</div>
					<button type="submit" class="btn btn-primary px-5 w-100" value="Check in" >View Comments</button>
				</form>
			</div>
		</div>
	</div>
	<div id="show"></div>
	
</body>

	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
    

 </script> 
</html>