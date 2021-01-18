 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*" %>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.user.*" %>
  <%@ page import ="com.hotel.*" %>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>
<div class = "view-list">
<%
HttpSession session2 = request.getSession();
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
<%
Connection conn = DBConnection.initializeDB();
HotelDao hotelDao = new HotelDao ();

	String location = request.getParameter("location");
	String Check_in = request.getParameter("startAvDate");
	String Check_out = request.getParameter("endAvDate");
	System.out.println("input: "+location+" "+Check_in+" "+Check_out);
 	int max_adults = Integer.parseInt(request.getParameter("Adults"));
 	int max_children = Integer.parseInt(request.getParameter("Children"));
	//	Hotel hotel = new Hotel(location, Check_in, Check_out);
	Hotel hotel = new Hotel("Hurghada", "2021-02-02", "2021-02-19");
	System.out.println(hotel);
	//ResultSet rset = hotelDao.SearchforHotel(conn, hotel);
	ResultSet rs = hotelDao.SearchforHotel(conn, hotel);
	int counter = 0;
	//while (rset.next()){  counter++; }
	System.out.println(counter);
%><br><%
if(true){
	
while (rs.next()){
	
    %>
	<div style="border: 1px solid black;" class = "hotelinfo">
	
	<label id = "name"><%=rs.getString("name")%></label>   
	
	<%
	int r = rs.getInt("stars");
	for (int i = 0; i < r ; i++){
	%> <i class="fas fa-star" style="font-size:15px;color:yellow;"></i>
	<%} %>
	
	
	<br>
	<label>EGP </label>
	<label id = "price"><%=rs.getFloat("expectedPrice")%></label> 
	<br>  
	
	<label id = "rating"><%=rs.getFloat("rating")%></label>
	<label>	rating </label>
	
	<br>
	<label id = "meals"><%=rs.getString("meals")%></label>
	<br>
	
	<label id = "distance"><%=rs.getInt("distance")%></label> 
	<label> km from the center </label>
	<br>  
	
	<label>	contactInfo</label><br>
	<label id = "from"><%=rs.getString("contactInformation")%></label>
	<br>
	
	<label>	Facilities</label><br>
	<label id = "from"><%=rs.getString("hotelFacilities")%></label>
	<br>
	
	<label>	Other Branches </label><br>
	<label id = "from"><%=rs.getString("otherBranches")%></label>
	<br>
	
	<label>Avaliability</label>
	<br>
	<label>	Start from </label><br>
	<label id = "from"><%=rs.getString("startAvDate")%></label>
	<br>
	
	<label>	TO </label> <br>
	<label id = "to"><%=rs.getString("endAvDate")%></label>
	<br>
	
	<div class ="photos-button">
	<form action = "viewImages.jsp" method ="get">
	<button name="hotelName" value="<%=rs.getString("name")%>" type="submit" id="photos">View Photos</button>
	</form>
	</div>
	<br>
	<div class ="rooms-button">
	<form action = "viewAvailableRooms.jsp" method ="get">
	<button name="hotelName" value="<%=rs.getString("name")%>" type="submit" id="rooms">see Rooms</button>
	</form>
	</div>
	<br>
	<div class ="map-button">
	<form action = "showMap.jsp" method ="get">
	<button name="map" value="<%=rs.getString("name")%>" type="submit" id="map" >Show on map</button>
	</form>
	</div>
	</div>
	
	<%
	
	
	
	
	%><br><br><%
}
}
else{
	RequestDispatcher rd = getServletContext().getRequestDispatcher("/HomePageClient.jsp");
	PrintWriter out1 = response.getWriter();
	out1.println("<html> <script>  alert(\"Couldn't find a hotel.\"); </script> </html>");
	rd.include(request, response); 
	//response.sendRedirect("searchForHotel.jsp");
}

%>
</div>
