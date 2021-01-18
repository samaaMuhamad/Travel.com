<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.io.*" %>
  <%@ page import = "java.text.*" %>
  <%@ page import = "java.sql.*" %>
  <%@ page import ="com.user.*" %>
  <%@ page import ="com.hotel.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <%
HttpSession session2 = request.getSession();
String username=(String)session2.getAttribute("username");


if (username==null) 

{
	response.sendRedirect("login.jsp"); 
}
%>
  <title>My Google Map</title>
  <style>
    #map{
    	height:700px;
      	width:100%;
    }
  </style>
</head>
<body>
  <%  String hotelName = request.getParameter("map");%>
  <h1><%=hotelName %></h1>
  <div id="map"></div>
  <%
  Connection conn = DBConnection.initializeDB();
 
  System.out.println("nameee= "+hotelName);
  double langitude=0;
  float latitude=0;
  String sql="select langitude, latitude from hotel where name='"+hotelName+"'";
	java.sql.Statement stmt1 = null;
	stmt1 = conn.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	while(rset.next()){
		langitude=Double.parseDouble(rset.getString("langitude"));
		latitude=Float.parseFloat(rset.getString("latitude"));
		
	}
  %>
  <script>
    function initMap(){
      // Map options
      var options = {
        zoom:7,
        center:{lat:<%=latitude%>,lng:<%=langitude%>}
      }
      console.log(<%=latitude%>+" "+<%=langitude%>);
      // New map
      var map = new google.maps.Map(document.getElementById('map'), options);

      // Listen for click on map
      google.maps.event.addListener(map, 'click', function(event){
        // Add marker
        addMarker({coords:event.latLng});
      });

      /*
      // Add marker
      var marker = new google.maps.Marker({
        position:{lat:42.4668,lng:-70.9495},
        map:map,
        icon:'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
      });

      var infoWindow = new google.maps.InfoWindow({
        content:'<h1>Lynn MA</h1>'
      });

      marker.addListener('click', function(){
        infoWindow.open(map, marker);
      });
      */

      // Array of markers
      var markers = [
        {
          coords:{lat:<%=latitude%>,lng:<%=langitude%>},
        }
      ];

      // Loop through markers
      for(var i = 0;i < markers.length;i++){
        // Add marker
        addMarker(markers[i]);
      }

      // Add Marker Function
      function addMarker(props){
        var marker = new google.maps.Marker({
          position:props.coords,
          map:map,
          //icon:props.iconImage
        });

        // Check for customicon
        if(props.iconImage){
          // Set icon image
          marker.setIcon(props.iconImage);
        }

        // Check content
        if(props.content){
          var infoWindow = new google.maps.InfoWindow({
            content:props.content
          });

          marker.addListener('click', function(){
            infoWindow.open(map, marker);
          });
        }
      }
    }
  </script>
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB19_B4CZSUZZKYkUHo8TE2lysArO1KdIc&callback=initMap">
    </script>
</body>
</html>
    