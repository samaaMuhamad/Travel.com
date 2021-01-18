

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

<title>Insert title here</title>
</head>
<body>
	<!-- navigation bar -->
	<header id="includedContent"></header>
	<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
	 <!-- search bar  -->
    <section class="search-sec mt-4">
    <div class="container">
        <form action="viewHotels.jsp" method="post" >
            <div class="row">
                <div class="col-lg-12">
                    <div class="row search-div p-1  ">
                        <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                            <select id = "location" class="form-control" name ="location" placeholder = "where are you going?">
							<%
								Connection conn = DBConnection.initializeDB();
								HotelDao h = new HotelDao();
								Set<String> locations= h.getAllHotelNamed(conn);
								%>
								<option value ="Cairo" >Where are you going?</option>
								<%
								for(String loc : locations){
									%><option value ='<%=loc %>'><%=loc %></option>
									<%
								}
							%>
								
							</select>
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 p-0 pl-1">
                            <input type="date" class="form-control" name="startAvDate" placeholder="From">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 p-0 px-1">
                            <input type="date" class="form-control" name="endAvDate" placeholder="To">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 p-0 pr-1">
                        <input type="number" class="form-control" name="Adults" placeholder="number of adults">
                        </div>
                        <div class="col-lg-2 col-md-2 col-sm-12 p-0 pr-1">
                        <input type="number" class="form-control" name="Children" placeholder="number of childrens">
                        </div>
                        <div class="col-lg-1 col-md-1 col-sm-12 p-0">
                            <button type="submit" class="btn btn-primary w-100 ">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</section>
<br><br><br>

<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Welcome Client</h4>
			</div>
			<div class="card-body">
				<form name ="" method="get" action="viewReservationByDate.jsp">
					<div class="form-row">
						<div class="form-group col-12">		
							<label for="username">Your Username:</label>
							<input type="text" class="form-control" id="username" name="username" value = '<%=(String)session.getAttribute("username")%>' disabled="disabled">
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
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