<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.room.*" %>
   <%@ page import ="com.Reservation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class ="form-reserve">
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%

//String username=(String)session.getAttribute("username");
//int adults = (int)session.getAttribute("adults");

String room = request.getParameter("roomNumber");
out.print(room);
String roomNumber = room;
Connection con = DBConnection.initializeDB();
RoomDao roomDao = new RoomDao();
ResultSet rs = roomDao.getRoom(roomNumber, con);
while(rs.next()){
	
	
	
}
%>
<form action= "addReservation" method = "get">



</form>




</div>
</body>
</html>