package com.Reservation;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;




public class ReservationDao {
public int reservationID() {
	
	Random r = new Random();
   	int low = 200;
   	int high = 2000;
   	int ID = r.nextInt(high-low) + low;
   	return ID;
}
public ResultSet viewReservationsToChange(java.sql.Connection con , String reserID) throws SQLException {
	java.sql.Statement stmt1 = null;
	String sql = "SELECT * from Reservation where reservationID = '"+reserID+"'";
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	return rset;	
}
public ResultSet getReservations(java.sql.Connection con, String hotel) throws SQLException {
		
	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from Reservation where hotel = '" + hotel+ "'";
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	return rset;
	}

public boolean getCertainReservation(java.sql.Connection con , String reserveID) throws SQLException {
	
	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from Reservation where reservationID='"+ reserveID +"'";
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	if (rset.next())
		return true;
	else
		return false;
	}

public String getCertainReservationAndHotel(java.sql.Connection con , String reserveID) throws SQLException {
	
	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from reservation where reservationID='"+ reserveID +"'";
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	String hotel= "";
	if (rset.next())
	{
		hotel= rset.getString("hotel");
	}
	return hotel;
	
	}




public ResultSet getReservationsNotConfirmed(java.sql.Connection con,String hotel) throws SQLException {
	
	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from Reservation where payment = 'false'  and hotel = '"+ hotel+ "'";;
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	return rset;
	}

public ResultSet getReservationsByDate(java.sql.Connection con, String from, String to, String hotel) throws SQLException {
	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from Reservation where fromDate >=  '" + from +"' and toDate <= '" + to +"' and hotel = '"+ hotel+ "'";
	stmt1 = con.createStatement();
	ResultSet rset = stmt1.executeQuery(sql);
	return rset;
	}

public void cancelReservation(java.sql.Connection con, String id) throws SQLException {

	java.sql.PreparedStatement pstmt3=con.prepareStatement("DELETE FROM Reservation where reservationID= ?" );
	pstmt3.setString(1,id);
	pstmt3.executeUpdate();

	}
public int generateReservationID()
{
	Random rand = new Random();  
    int randTrans = rand.nextInt(99); 
    return randTrans;
}
public void addReservation(Reservation reservation, java.sql.Connection con) throws SQLException {
	
	String query = " insert into Reservation (reservationID,fromDate, toDate, hotel, client, payment,roomNumber, adults, children )"
	        + " values (?, ?, ?, ?,?,?,?,?,?)";

	      PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
	      preparedStmt.setString (1, reservation.getReservationID());
	      preparedStmt.setDate (2, reservation.getFromDate());
	      preparedStmt.setDate  (3,  reservation.getToDate());
	      preparedStmt.setString(4, reservation.getHotel());
	      preparedStmt.setString(5, reservation.getClient());
	      preparedStmt.setString(6, reservation.getPayment());
	      preparedStmt.setString(7, reservation.getRoomNumber());
	      preparedStmt.setInt(8, reservation.getAdults());
	      preparedStmt.setInt(9, reservation.getChildren());
	      
	      preparedStmt.execute();
	      
}

public ResultSet viewUserReservations (String client, java.sql.Connection con) throws SQLException {

	java.sql.Statement stmt1 = null;

	String sql = "SELECT * from Reservation where client = '"+client+"'";

	stmt1 = con.createStatement();

	ResultSet rset = stmt1.executeQuery(sql);

	return rset;

}

public void updatePayement(String reserveID, java.sql.Connection con, String payment) throws SQLException {

	String queryUpdate = "update Reservation set payment =? where reservationID='"+ reserveID +"'";

	java.sql.PreparedStatement stmt = null;

	stmt = con.prepareStatement(queryUpdate);

	stmt.setString(1, payment);

	stmt.executeUpdate();

}

}

