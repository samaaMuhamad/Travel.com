<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import = "java.io.*" %>
 <%@ page import = "java.text.*" %>
 <%@ page import = "java.sql.*" %>
 <%@ page import = "com.user.*" %>
 <%@ page import ="com.hotel.*" %>
 
<%
int stars = Integer.parseInt(request.getParameter("stars"));
String comment = request.getParameter("comment");
Connection conn = DBConnection.initializeDB();
String hotel = (String)session.getAttribute("hotel");
String username = (String)session.getAttribute("username");
System.out.println(hotel+"hotell nadaaa");

HotelDao h = new HotelDao();
h.insertComment(conn ,stars , comment, hotel ,username);
response.sendRedirect("ViewComments.jsp");
%>