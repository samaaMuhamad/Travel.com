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
Connection conn = DBConnection.initializeDB();
HotelDao hotelDao = new HotelDao ();

 String s= request.getParameter("hotelname");
 HttpSession session2 = request.getSession();
 if(s==null)
 {
	 String hotel = (String)session2.getAttribute("hotel");
 }
 else
 {

	 session2.setAttribute("hotel",s);
 }


 

 String hotel = (String)session2.getAttribute("hotel");
ResultSet rset = hotelDao.getRatingsANDComments(conn ,hotel);
ResultSet rs = hotelDao.getRatingsANDComments(conn, hotel);
int counter = 0;
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
    </div><%
}
}
%>
</div>
<div class="card my-5 col-4 ml-5">
<div class="card-header">
<h3>Rate the hotel and give it a comment</h3>
</div>
<div class="card-body">
<form  action="addComment.jsp" method="GET">
<label for="stars">Enter number of stars</label>
	  <input type ="number" id="stars" class="form-control"name ="stars" required /><br><br>
  <textarea name ="comment"  class="form-control" placeholder =" Add a Comment....." required ></textarea><br>
  <button type ="submit" class="btn btn-primary px-5 w-100"name ="submit">Submit</button>
</form>
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