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
				<h4 class="card-title mt-2">Check Out Reservation</h4>
			</div>
			<div class="card-body">
				<form name ="checkOut" method="POST" action="checkOut">
					<div class="form-row">
						<div class="form-group col-12">
							<label for="id">reservation ID <span class="text-danger">*</span></label>
							<input type="text" class="form-control" id="id" name="reservationID" required onblur="checkIDExist()"/><span id="isU"></span>
						</div>
						<div class="form-group col-12">
							<label for="date">Date <span class="text-danger">*</span></label>
							<input type="date" class="form-control" id="date" name="checkOut" required>
						</div>
					</div>
					<div id="show"></div>
					<button type="submit" class="btn btn-primary px-5 w-100" value="Check in" onclick="ajaxValidation()">Check Out</button>
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
    function checkIDExist(){
        var xmlhttp = new XMLHttpRequest();
        var id =  document.getElementById("id").value;	        var url = "checkInID.jsp?reservationID=" + id;
        xmlhttp.onreadystatechange = function(){
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
            	if (!(xmlhttp.responseText.indexOf('ID is Valid') == -1)) {
            		   //do something
            		document.getElementById("isU").style.color = "green";
            		}
                 else if(!(xmlhttp.responseText.indexOf('This reservation wasNOT checked In before..') == -1)) {
                     document.getElementById("isU").style.color = "red";
                 }
                document.getElementById("isU").innerHTML = xmlhttp.responseText;
            }
            
        };
        try{
	        xmlhttp.open("GET",url,true);
	        xmlhttp.send();
    	}catch(e){alert("unable to connect to server");}
    }
 </script> 
</html>