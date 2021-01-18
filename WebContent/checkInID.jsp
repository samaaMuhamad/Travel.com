
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
			 
			  java.sql.Statement stmt1 = null;

	            String sql = "SELECT * from checkin where reservationID='"+  reservationID +"'";
	        	stmt1 = con.createStatement();
	        	ResultSet rset = stmt1.executeQuery(sql);
	        	
	
	           if (rset.next()){
	        	   out.print("ID is Valid");
            }
            else
            {
            	out.print("This reservation wasNOT checked In before..");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>