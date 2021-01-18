 
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.user.UserDao"%>
<%@page import="com.user.DBConnection"%>

<%
    try{
			Connection con = DBConnection.initializeDB();
			 UserDao userDao = new UserDao();
			   
			
		       String username = request.getParameter("username");
		       String password = request.getParameter("password");
		       boolean existsInSystem = userDao.validateInfo(username, password,con);

		   
            if(!existsInSystem){
            	out.print("Either Username or Password is wrong");
            }
            else{
            	out.print("Logging in...");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>