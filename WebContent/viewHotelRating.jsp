<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@ page import = "java.io.*" %>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import = "com.user.*" %>
  <%@ page import ="com.hotel.*" %>
  
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
 
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="bootstrap/css/style.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
 <header id="includedContent"></header>  
<div class ="comments">
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
 

 String hotel = (String)session.getAttribute("hotelName");


ResultSet rset = hotelDao.getRatingsANDComments(conn ,hotel);
ResultSet rs = hotelDao.getRatingsANDComments(conn, hotel);
String rating = hotelDao.getHotelRating(conn, hotel);
int counter = 0;
%>
<h1 class=" ml-5 mt-5">Hotel Rating: <span><%=rating %></span></h1>
<%
while (rset.next()){  counter++;}

%><br><%
if(counter != 0){
	
while (rs.next()){
	
    %>
    
    <div class="review my-5 ml-5 py-5 px-3 hotelinfo border w-50">
         <div class="row">
             <div class="profile-pic col-2"> <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded w-100"/></div>
             <div class="col-2">
                 <h4 id = "username mt-5"><%=rs.getString("username")%></h4>
                  <%int x = rs.getInt("stars"); 
            for (int i = 0; i < x ; i++){
				%> <i class="fas fa-star" style="font-size:15px;"></i>
				<%} %>
             </div>
             
         </div>
         <div class="row">
         <div class="col-2">
               
             </div>
             <div class="col-4">
                <p id = "comment"><%=rs.getString("comment")%></p>
             </div>
            
         </div>
    </div>
    
  <%
}
}
%>

<script src="bootstrap/js/main.js"></script>
	<script src="bootstrap/js/jquery-3.5.1.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
     <script> 
    $(function(){
      $("#includedContent").load("navbar.jsp"); 
    });
 </script> 