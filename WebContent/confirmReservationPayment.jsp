<%@page import="java.io.PrintWriter"%>
<%@page import="com.user.*"%>
<%@page import="com.Reservation.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
String id= request.getParameter("update");

Connection con = DBConnection.initializeDB();
ReservationDao reservationDao = new ReservationDao();
reservationDao.updatePayement(id, con, "true");

RequestDispatcher rd = getServletContext().getRequestDispatcher("/confirmReservation.jsp");
PrintWriter out1 = response.getWriter();
out1.println("<html> <script>  alert(\"Reservation Payment is SUCCESSFULLY Confirmed\"); </script> </html>");
rd.include(request, response);
%>

</body>
</html>