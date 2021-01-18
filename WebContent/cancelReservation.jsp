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
String id= request.getParameter("reservationID");

Connection con = DBConnection.initializeDB();
ReservationDao reservationDao = new ReservationDao();
boolean exist=reservationDao.getCertainReservation(con, id);
if (exist)
{
reservationDao.cancelReservation(con, id);

RequestDispatcher rd = getServletContext().getRequestDispatcher("/viewReservations.jsp");
PrintWriter out1 = response.getWriter();
out1.println("<html> <script>  alert(\"Reservation is SUCCESSFULLY Cancelled\"); </script> </html>");
rd.include(request, response);
}
else
{
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/viewReservations.jsp");
	PrintWriter out1 = response.getWriter();
	out1.println("<html> <script>  alert(\"No reservation with this ID.\"); </script> </html>");
	rd.include(request, response);
}
%>

</body>
</html>