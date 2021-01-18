<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

</head>
<body>
<header id="includedContent"></header>
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
	<div class="row my-5 mx-0">
		<div class="card col-4 mx-auto p-0">
			<div class="card-header col-12">
				<h4 class="card-title mt-2">Add Room</h4>
			</div>
			<div class="card-body">
				<form action ="addRoom" class="formcss" method="POST">
					<div class="form-row">
						<div class="form-group col-12">
							<label for="type">Type <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="type" name="type" required>
						</div>
						<div class="form-group col-12">
							<label for="roomNumber">Room Number <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
						</div>
						<div class="form-group col-12">
							<label for="roomFacilities">Room Facilities <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="roomFacilities" name="roomFacilities" required>
						</div>
						<div class="form-group col-12">
							<label for="startAvDate" >Start Average Date <span class="text-danger">*</span></label>
							<input type="date" class="form-control" id="startAvDate" name="startAvDate" required>
						</div>
						<div class="form-group col-12">
							<label for="endAvDate">End Average Date <span class="text-danger">*</span></label>
							<input type="date" class="form-control" id="endAvDate" name="endAvDate" required>
						</div>
					</div>
					<div id="show"></div>
					<button type="submit" class="btn btn-primary px-5 w-100" value="Add Room" onclick="ajaxValidation()">Add Room</button>
				</form>
			</div>
		</div>
	</div>
	
</body>

<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 
</html>