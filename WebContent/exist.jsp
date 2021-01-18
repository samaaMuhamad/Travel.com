
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
		       boolean existsInSystem = userDao.userExistIn(username,con);

		      
            if(existsInSystem){
                out.print("Username already exists");
                existsInSystem=false;
            }else if(!existsInSystem){
                out.print("Username is Valid ");
            }
            
        }catch (Exception e){
            System.out.println(e);  
        }
%>