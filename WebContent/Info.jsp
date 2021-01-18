<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.user.*" %>
  <%@ page import ="com.hotel.*" %> 
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
<%
Connection conn = DBConnection.initializeDB();
HotelDao hotelDao = new HotelDao ();

String Check_in = request.getParameter("date1");
String Check_out = request.getParameter("date2");
String location = request.getParameter("location");
int max_adults = Integer.parseInt(request.getParameter("adults"));
int max_children = Integer.parseInt(request.getParameter("children"));
int Rooms = Integer.parseInt(request.getParameter("rooms"));

//Hotel hotel = new Hotel (location, Check_in, Check_out, max_adults, max_children,Rooms);

   

//java.sql.Date sqlDate1 = hotelDao.sqlDateConverter(d);
//java.sql.Date sqlDate2 = hotelDao.sqlDateConverter(d2);
//ResultSet rset = hotelDao.SearchforHotel(conn, hotel);
out.print("hi");
int counter = 0;
//while (rset.next()){  counter++;}

out.print(counter);
//ResultSet rs = hotelDao.SearchforHotel(conn, hotel);
if(counter != 0){
	%>
	
	<%
//while (rs.next()){
	
    %>
	<div class = "hotelinfo">
	
	<label id = ""></label>
	
	
	</div>
	<%
	
	
	
	
	%><br><br><%
}
//}
//else{
	out.print("not found");
//}

    out.print("hill");  
%>
</body>
</html>