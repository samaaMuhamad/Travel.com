
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import ="java.util.*"%>
<%@ page import = "com.user.*" %>
<%@ page import ="com.hotel.*" %>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<script src="validate.js"></script>
<div class"search-field">
<%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>

	<form name = "searchForHotel" action="viewListOfHotels.jsp" method = "post" onsumbit="return validateSearch()">
	
	<select id = "location" name = "location" placeholder = "where are you going?">
	<%
		Connection conn = DBConnection.initializeDB();
		HotelDao h = new HotelDao();
		Set<String> locations= h.getAllHotelNamed(conn);
		%>
		<option value ="Cairo" >Where are you going?</option>
		<%
		for(String loc : locations){
			%><option value ='<%=loc %>'><%=loc %></option>
			<%
		}
	%>
		
	</select>
	
	<input id = "from" type = "date" name="startAvDate" placeholder ="Check-in" required/>
	<input id = "to" type = "date" name="endAvDate" placeholder ="Check-out" required/>
	
	<select name = "Adults" placeholder = "Adults">
		<option value ="1" >Adults</option>
		<option value ="1" >1</option>
	    <option value ="2" >2</option>
	    <option value ="3" >3</option>
	</select>
	
	<select name = "Children" placeholder = "Children">
		<option value ="0" >0 Children</option>
		<option value ="1" >1 Children</option>
	    <option value ="2" >2 Children</option>
	    <option value ="3" >3 Children</option>
	    <option value ="4" >4 Children</option>
	   
	</select>
	
	<select name = "Rooms" placeholder = "Rooms">
		<option value ="1" >1 Room</option>
	    <option value ="2" >2 Room</option>
	    <option value ="3" >3 Room</option>
	    <option value ="4" >4 Room</option>
	    <option value ="5" >5 Room</option>
	</select>
	<button type ="submit">Search</button>
	</form>
</div>
