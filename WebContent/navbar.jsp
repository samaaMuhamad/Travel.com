<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!-- navigation bar -->
		<nav class="navbar navbar-expand p-3 pl-5">
		 	<div class="row w-100">				
		 		 <div class="col-9 logo">
			        <a class="navbar-brand font-weight-bold" href="HomePage.jsp"><h1>Travel.com</h1></a>
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
						  <a class="dropdown-item" href="updateUserInfo.jsp">Update Info</a>
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
		                      <a class="nav-link" href="checkIn.jsp">Check-IN</a>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                      <a class="nav-link" href="checkOut.jsp">Check-out</a>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                      <a class="nav-link" href="confirmReservation.jsp">Confirm Reservation</a>
		                  </li>
		                  
		                  <li class="nav-item list-inline-item">
		                  	 <div class="dropdown">
	                            <button class="roomdropdown btn dropdown-toggle nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                              Update Hotel
	                            </button>
	                            <div class="dropdown-menu roomdropdown-div" aria-labelledby="dropdownMenuButton">
	                              <a class="dropdown-item" href="updateHotel.jsp">Info</a>
	                              <a class="dropdown-item" href="uploadImages.jsp">Photos</a>
	                            </div>
                          	</div>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                  	 <div class="dropdown">
	                            <button class="roomdropdown btn dropdown-toggle nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                              Room
	                            </button>
	                            <div class="dropdown-menu roomdropdown-div" aria-labelledby="dropdownMenuButton">
	                              <a class="dropdown-item" href="addRoom.jsp">Add</a>
	                              <a class="dropdown-item" href="updateRoom.jsp">Update</a>
	                            </div>
                          	</div>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                  	 <div class="dropdown">
	                            <button class="roomdropdown btn dropdown-toggle nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                              View
	                            </button>
	                            <div class="dropdown-menu roomdropdown-div" aria-labelledby="dropdownMenuButton">
	                              <a class="dropdown-item" href="viewClient.jsp">Client Info</a>
	                              <a class="dropdown-item" href="viewHotelRating.jsp">Hotel Rating</a>
	                        
	                            </div>
                          	</div>
		                  </li>
		                  <li class="nav-item list-inline-item">
		                  	 <div class="dropdown">
	                            <button class="roomdropdown btn dropdown-toggle nav-link" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	                              View Reservations
	                            </button>
	                            <div class="dropdown-menu roomdropdown-div" aria-labelledby="dropdownMenuButton">
	                              <a class="dropdown-item" href="viewReservations.jsp">All</a>
	                              <a class="dropdown-item" href="viewReservationDate.jsp">By Date</a>
	                            </div>
                          	</div>
		                  </li>
			 		</ul>
			 	</div>
			 </div>
	    </nav>
    