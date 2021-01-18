<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%@ page import ="com.user.*" %>
<%@ page import ="com.room.*" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
<%
Connection con = DBConnection.initializeDB();
Room room = new Room();
String roomNumber = request.getParameter("roomNumber");
String query = "select * from room where roomNumber = 2004";
String to = "";
java.sql.Statement stmt1 = null;
stmt1 = con.createStatement();
ResultSet rs = stmt1.executeQuery(query);
while(rs.next()) {
	to = rs.getString("endAvDate");
}
 out.println(to);


%>
</body>
</html>