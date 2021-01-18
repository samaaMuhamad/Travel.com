
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.user.UserDao"%>
<%@page import="com.Reservation.*"%>
<%@page import="com.user.DBConnection"%>

<%
    try{
			Connection con = DBConnection.initializeDB();
		
			   
			
			 String reservationID= request.getParameter("reservationID");
			 ReservationDao reservationDao = new ReservationDao();
	           boolean exist=  reservationDao.getCertainReservation(con, reservationID);
	           if (exist){
	        	   out.print("ID is Valid");
            }
            else
            {
            	out.print("No reservation with this ID");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>