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
	RoomDao roomDao = new RoomDao();
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
				<h4 class="card-title mt-2">Update Room</h4>
			</div>
			<div class="card-body">
				<form action ="" class="formcss" method="POST">
				<%
				 String hotel =(String)session.getAttribute("hotelName");
				   String roomNumber= request.getParameter("roomNumber");
					stat = conn.createStatement();	
				 	String query = "select * from room where hotel ='" + hotel +"' and roomNumber = '"+ roomNumber + "'";	
					rs = stat.executeQuery(query);
					if(rs.next()){
					
					do{
				%>
					<div class="form-row">
						<div class="form-group col-12">
							<label for="type">Type</label>
							<input type="text" class="form-control" id="type" name="type"  value = '<%=rs.getString("type") %>' >
						</div>
						<div class="form-group col-12">
							<label for="roomFacilities">Room Facilities</label>
							<input type="text" class="form-control" id="roomFacilities" name="roomFacilities" value = '<%=rs.getString("roomFacilities")%>'>
						</div>
						<div class="form-group col-12">
							<label for="startAvDate" >Start Average Date</label>
							<input type="date" class="form-control" id="startAvDate" name="startAvDate" value = '<%=rs.getString("startAvDate")%>'>
						</div>
						<div class="form-group col-12">
							<label for="endAvDate">End Average Date</label>
							<input type="date" class="form-control" id="endAvDate" name="endAvDate" value = '<%=rs.getString("endAvDate")%>'>
						</div>
					</div>
<!-- 					<div id="show"></div> -->
					<button type="submit" class="btn btn-primary px-5 w-100">Update Info Room</button>
					<%
					
						}while(rs.next());
					}
					else{%>

					<h1 class="headcss">No Room with this number!</h1>
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
String type = request.getParameter("type");
String roomFacilities = request.getParameter("roomFacilities");
String startAvDate = request.getParameter("startAvDate");
String endAvDate = request.getParameter("endAvDate");
String reserved ="false";
Room room =new Room(type,  roomNumber,  roomFacilities,startAvDate, endAvDate, hotel , reserved);

if(hotel != null &&  roomNumber != null &&  type != null && roomFacilities != null && startAvDate != null && endAvDate != null){
	roomDao.updateRoomInfo(room, conn);
	System.out.println("=========");
	response.sendRedirect("updateRoom.jsp");
	
}

%>

