 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.others.*" %>
<%@ page import = "com.Reservation.*" %>
<%@ page import ="com.mysql.jdbc.PreparedStatement" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type ="text/css" href="project.css">
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
		<h3>HOTEL PHOTOS</h3><br>
		<h5>Click on photo to delete it</h5>
			<div class="row">
				<div class="col-2">
				<%
					String hotel = (String)session.getAttribute("hotelName");
					Connection con = DBConnection.initializeDB();
					java.sql.Statement stmt1 = null;
					stmt1 = con.createStatement();
					String query = "select path from images where hotel= '" + hotel + "'";
					ResultSet rs = stmt1.executeQuery(query);
				%>
				 <% while(rs.next()){%>
    	<form method ="GET" action="Deletephoto" >
        <div>
	        <input id ="d" name = "path" type ="text" value =  '<%=rs.getString("path") %>' style="display:none;"> 
	        <input name ="path" type="image" value =  '<%=rs.getString("path") %>' src = '<%=rs.getString("path") %>' >	
        </div>
        
        </form>
     <% }%>
			</div>
		</div>
	</div>


 <br><br>
 
 <div class="row mb-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title">Upload Photo</h4>
			</div>
			<div class="card-body">
				<form action="Uploadphoto" method ="get">
					<div class="form-row">
						<div class="form-group col-12">	
							<input type="file" class="form-control" id="real-file" hidden="hidden" name="getFile" required/>	
							<button type="button" class="btn btn-primary" id="custom-button">CHOOSE A FILE</button>
							<span id="custom-text">No file chosen, yet.</span><br>
							<input name = "hotelName" type = "text" placeholder = "Hotel name" value ='<%=hotel%>'style="display:none;"/><br>
							<button type = "submit" class="btn btn-primary mt-1" id="custom-button">Upload</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
 


<script type = "text/javascript">
const realFileBtn = document.getElementById("real-file");
const customBtn = document.getElementById("custom-button");
const customTxt = document.getElementById("custom-text");

customBtn.addEventListener("click", function() {
  realFileBtn.click();
});

realFileBtn.addEventListener("change", function() {
  if (realFileBtn.value) {
    customTxt.innerHTML = realFileBtn.value.match(
      /[\/\\]([\w\d\s\.\-\(\)]+)$/
    )[1];
  } else {
    customTxt.innerHTML = "No file chosen, yet.";
  }
});
</script>
		
<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
	
	 <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</body>


</html>