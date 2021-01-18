<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- navigation bar -->
		<nav class="navbar navbar-expand p-3 pl-5">
		 	<div class="row w-100">				
		 		 <div class="col-9">
			        <a class="navbar-brand font-weight-bold "href="HomePageClient.jsp"><h1>Travel.com</h1></a>
			   	 </div>
			   	 <div class="col-3">
					<div class="dropdown">
						<button class="roomdropdown btn dropdown-toggle nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						 <%
							String username=(String)session.getAttribute("username");
							out.print(username);
						%>
						</button>
						<div class="dropdown-menu roomdropdown-div" aria-labelledby="dropdownMenuButton">
						  <a class="dropdown-item" href="updateClientInfo.jsp">Update Info</a>
						  <a class="dropdown-item" href="logOut">Logout</a>
						</div>
					  </div>
				</div>
		 	</div>
		 </nav>
		 <nav class="navbar navbar-expand p-0 pl-5">
			 <div class="row w-100">
			 	<div class="col-12 links">
			 		<ul class="list-inline mb-0">
			 			<li class="nav-item list-inline-item">
		                      <a class="nav-link" href="viewUserReservations.jsp">View Your Reservations</a>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                      <a class="nav-link" href="EnterHotel.jsp">View Hotel Commnets & Rate</a>
		                  </li>
		                <!--   <li class="nav-item list-inline-item">
		                      <a class="nav-link" href="checkOut.jsp">Rate Hotel</a>
		                  </li>-->
		                  
		                  
			 		</ul>
			 	</div>
			 </div>
	    </nav>
    