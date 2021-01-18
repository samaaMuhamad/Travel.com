package com.room;

import java.sql.*;



public class RoomDao {
	

public void addRoom(Room room, java.sql.Connection con) throws SQLException {
		
		String query = " insert into room "
		        + " values (?, ?, ?, ?, ?, ?,?)";

		      PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
		      preparedStmt.setString (1, room.getRoomType());
		      preparedStmt.setString (2, room.getRoomNumber());
		      preparedStmt.setString  (3, room.getRoomFacilities());
		      preparedStmt.setString(4, room.getStartAvDate());
		      preparedStmt.setString(5,room.getEndAvDate());
		      preparedStmt.setString(6, room.getHotel());
		      preparedStmt.setString(7, room.getReserved());
		      preparedStmt.execute();
		      
	}

public void updateRoomInfo(Room room, java.sql.Connection con) throws SQLException {
	
	String roomNumber = room.getRoomNumber();
	String queryUpdate = "update room set type=?, roomFacilities=?, startAvDate=?, endAvDate=? where roomNumber='"+ roomNumber+"'";
	java.sql.PreparedStatement stmt = null;
	stmt = con.prepareStatement(queryUpdate);
	stmt.setString(1, room.getRoomType());
	stmt.setString(2,room.getRoomFacilities());
    stmt.setString(3, room.getStartAvDate());
    stmt.setString(4,room.getEndAvDate());
	stmt.executeUpdate();
}
public ResultSet viewAllRooms (String hotel, java.sql.Connection con) throws SQLException{

	String query = "select * from room where hotel = '"+hotel+"' and  reserved = 'false' ";
	java.sql.Statement stmt1 = null;
	stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery(query);
	
	return rs;	
}
public String roomFromDate (String roomNumber, java.sql.Connection con) throws SQLException {
	
	String query = "select * from room where roomNumber = '"+roomNumber+"'";
	String from = "";
	java.sql.Statement stmt1 = null;
	stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery(query);
	while(rs.next()) {
		from = rs.getString("startAvDate");
	}
	
	return from;
}
public String roomToDate (String roomNumber, java.sql.Connection con) throws SQLException {
	
	String query = "select * from room where roomNumber = '"+roomNumber+"'";
	String to = "";
	java.sql.Statement stmt1 = null;
	stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery(query);
	while(rs.next()) {
		to = rs.getString("endAvDate");
	}
	
	return to;
}
public String roomHotel (String roomNumber, java.sql.Connection con) throws SQLException {
	
	String query = "select * from room where roomNumber = '"+roomNumber+"'";
	String hotelName = "";
	java.sql.Statement stmt1 = null;
	stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery(query);
	while(rs.next()) {
		hotelName = rs.getString("hotel");
	}
	
	return hotelName;
}


public ResultSet getRoom (String roomNumber, java.sql.Connection con) throws SQLException{

	String query = "select * from room where roomNumber = '"+roomNumber+"'";
	java.sql.Statement stmt1 = null;
	stmt1 = con.createStatement();
	ResultSet rs = stmt1.executeQuery(query);
	
	return rs;	
}


public void updateReserved(String roomNumber, java.sql.Connection con, String reserve) throws SQLException {

	String queryUpdate = "update Room set reserved =? where roomNumber='"+ roomNumber +"'";

	java.sql.PreparedStatement stmt = null;

	stmt = con.prepareStatement(queryUpdate);

	stmt.setString(1, reserve);

	stmt.executeUpdate();

}

public String getroomFromReservation (String reservationID, java.sql.Connection con) throws SQLException{

	String roomNumber="";

	String query = "select roomNumber from Reservation where reservationID = '"+reservationID+"'";

	java.sql.Statement stmt1 = null;

	stmt1 = con.createStatement();

	ResultSet rs = stmt1.executeQuery(query);

	while(rs.next()) {

		roomNumber = rs.getString("roomNumber");

	}

	return roomNumber;	

}



}
