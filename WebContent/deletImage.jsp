
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import = "com.hotel.*" %>
<%@ page import = "com.Reservation.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%  Connection con = DBConnection.initializeDB();
String path =request.getParameter("path");
	System.out.println(path);
java.sql.PreparedStatement pstmt3=con.prepareStatement("DELETE FROM images where path= ?" );
	pstmt3.setString(1,path);
	pstmt3.executeUpdate();


	response.sendRedirect("uploadImages.jsp");  %>
</body>
</html>