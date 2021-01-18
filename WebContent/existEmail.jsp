
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
			   
			
		       String email = request.getParameter("email");
		       boolean existEmail = userDao.emailExistIn(email, con);

		      
           if(existEmail){
            	out.print("Email already exists");
            	 existEmail=false;
            }
            else
            {
            	out.print("Email is valid");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>