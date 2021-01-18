 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.io.*" %>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.user.*" %>
  <%@ page import ="com.hotel.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
<%
HttpSession session2 = request.getSession();
String username2=(String)session2.getAttribute("username");


if (username2==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
</head>
<body>
	<header id="includedContent"></header>
	<div class="container my-5">
		<div class="row">
			<!--    filter	 -->
			<div class="col-3">

			
<div class ="filter-by">

<form name ="radioform1" action = "filterByPrice.jsp" onsubmit = " return validateRadio1()">
	
		<label><strong>Price</strong></label>
		<br><br>
		<input id ="r" type = "radio" name = "filterByprice" value = "1" />
		<label>EGP 0 - EGP 1000</label>
		
		<br><input id ="r"type = "radio" name = "filterByprice" value = "2" />
		<label>EGP 1000 - EGP 2000</label>
	
		<br><input id ="r"type = "radio" name = "filterByprice" value = "3" />
		<label>EGP 2000 - EGP 3000</label>
		
		<br><input id ="r"type = "radio" name = "filterByprice" value = "4" />
		<label>EGP 3000 - EGP 4000</label>
		
		<br><input id ="r"type = "radio" name = "filterByprice" value = "5" />
		<label> + EGP 4000 </label>
		<br>
		
		<button type = "submit" class="btn btn-primary"> Filter </button>
		
</form>
	</div>

<br><br>
<div class ="filter-by">
<form name = "radioform2"action = "filterByStars.jsp" onsubmit = " return validateRadio2()">

		<label><strong>Stars</strong></label>
		<br><br>
		<input id ="r" type = "radio" name = "filterBystars" value = "1" />
		<label> 1 star</label>
		
		<br><input id ="r"type = "radio" name = "filterBystars" value = "2" />
		<label>2 star</label>
	
		<br><input id ="r" type = "radio" name = "filterBystars" value = "3" />
		<label>3 star</label>
		
		<br><input id ="r" type = "radio" name = "filterBystars" value = "4" />
		<label>4 star</label>
		
		<br><input id ="r"type = "radio" name = "filterBystars" value = "5" />
		<label>5 star</label>
		<br>
		<button type = "submit" class="btn btn-primary"> Filter </button>
		
</form>
	</div>
	<br><br>
<div class ="filter-by">
<form name = "radioform3"action = "filterByRating.jsp" onsubmit = " return validateRadio3()">

		<label><strong>Review score</strong></label>
		<br><br>
		<input id ="r"type = "radio" name = "filterByRating" value = "1" />
		<label>Superb: 9+</label>
		
		<br><input id ="r"type = "radio" name = "filterByRating" value = "2" />
		<label>Very good: 8+</label>
	
		<br><input id ="r"type = "radio" name = "filterByRating" value = "3" />
		<label>Good: 7+</label>
		
		<br><input id ="r"type = "radio" name = "filterByRating" value = "4" />
		<label> Pleasant: 6+</label>
		
		
		<br>
		<button type = "submit" class="btn btn-primary"> Filter </button>
		
</form>
	</div>
<div class ="filter-by">
<form name ="radioform4" action = "filterByMeals.jsp" onsubmit = " return validateRadio4()">

		<label><strong>Meals</strong></label>
		<br><br>
		<input id ="r"type = "radio" name = "filterByMeals" value = "1" />
		<label>Self catering</label>
		
		<br><input id ="r"type = "radio" name = "filterByMeals" value = "2" />
		<label>Breakfast included</label>
	
		<br><input id ="r"type = "radio" name = "filterByMeals" value = "3" />
		<label>Breakfast & lunch included</label>
		
		<br><input id ="r"type = "radio" name = "filterByMeals" value = "4" />
		<label> Breakfast & dinner included</label>
		
		
		<br>
		<button type = "submit" class="btn btn-primary"> Filter </button>
		
</form>
	</div>
	<div class ="filter-by">
<form name = "radioform5"action = "filterBydistance.jsp" onsubmit = " return validateRadio5()">

		<label><strong>Distance From the centre</strong></label>
		<br><br>
		<input id ="r"type = "radio" name = "filterBydistance" value = "1" />
		<label>less than 3</label>
		
		<br><input id ="r"type = "radio" name = "filterBydistance" value = "2" />
		<label>less than 5</label>
	
		<br><input id ="r"type = "radio" name = "filterBydistance" value = "3" />
		<label>less than 10</label>
		
		<br><input id ="r"type = "radio" name = "filterBydistance" value = "4" />
		<label> less than 20 </label>
		
		
		<br>
		<button type = "submit" class="btn btn-primary"> Filter </button>
		
</form>
	</div>
		</div>
			
			<!--    Hotels	 -->
			<div class="col-9 w-100">
	     <div class="row">
	     <%
			Connection conn = DBConnection.initializeDB();
			HotelDao hotelDao = new HotelDao ();
			String location = request.getParameter("location");
			session.setAttribute("location", location);
			String Check_in = request.getParameter("startAvDate");
			String Check_out = request.getParameter("endAvDate");
			System.out.println("input: "+location+" "+Check_in+" "+Check_out);
			
		 	int max_adults = Integer.parseInt(request.getParameter("Adults"));
		 	int max_children = Integer.parseInt(request.getParameter("Children"));
		 	
		 
				 session.setAttribute("adults", max_adults);
				 session.setAttribute("children", max_children);
			Hotel hotel = new Hotel(location, Check_in, Check_out);
			System.out.println(hotel);
			ResultSet rset = hotelDao.SearchforHotel(conn, hotel);
			int counter = 0;
			//while (rset.next()){  counter++; }
			System.out.println(counter);
			if(true){
				
				while (rset.next()){
			%>
	         <div class="col-md-4 w-100">
	             <div class="card">
	                 <div class="card-body">
	                	
	                     <h3 class="card-title"><%=rset.getString("name")%></h3>
	                     <p class="rating"><%=rset.getFloat("rating")%></p>
	                     <p class="card-text"><i class="fa fa-map-marker marker"></i> <%=rset.getString("location")%></p>
	                     <p class="card-text">
	                     	<%
							int r = rset.getInt("stars");
							for (int i = 0; i < r ; i++){
							%>
							<i class="fa fa-star star-rating"></i>
							<%} %>
						</p>
	                     <p class="card-text">EGP <%=rset.getFloat("expectedPrice")%></p>
	                     <p class="card-text" style="color:green">Available</p>
	                     <div class ="photos-button">
	                     
							<form action = "viewImages.jsp" method ="get">
							
							<button name="hotelName" class="btn btn-primary px-5 w-100" value="<%=rset.getString("name")%>" type="submit" id="photos">View Photos</button>
							</form>
							</div>
							<br>
							<div class ="rooms-button">
							<form action = "viewAvailableRooms.jsp" method ="get">
							<button name="hotelName" class="btn btn-primary  px-5 w-100" value="<%=rset.getString("name")%>" type="submit" id="rooms">see Rooms</button>
							</form>
							</div>
							<br>
							<div class ="map-button">
							<form action = "showMap.jsp" method ="get">
							<button name="map" class="btn btn-primary  px-5 w-100" value="<%=rset.getString("name")%>" type="submit" id="map" >Show on map</button>
							</form>
							</div>
	                 </div>
	             </div>
	         </div>
	         <%}} %>
	        </div>
	</div>
			</div>
	</div>
	
	<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script> 
    $(function(){
      $("#includedContent").load("navbarClient.jsp"); 
    });
 </script> 
</body>
</html>