package com.hotel;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
public class HotelDao {

	public HotelDao() {}
	
	public void insertComment(java.sql.Connection con , int stars, String comment ,String hotel ,String username) throws SQLException {
		String query = " insert into comments (stars, comment, hotel, username )"
		        + " values (?, ?, ?, ?)";

		      PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
		      preparedStmt.setInt (1, stars);
		      preparedStmt.setString   (2, comment);
		      preparedStmt.setString   (3,  hotel);
		      preparedStmt.setString (4, username);
		      preparedStmt.execute();
		      
	}
	public ResultSet getRatingsANDComments( java.sql.Connection con , String hotel) throws SQLException {
		String Query ="select * from comments where hotel ='" + hotel + "'";
		java.sql.Statement stmt1 = null;
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(Query);
		return rset;
	}
	public ResultSet SearchforHotel (java.sql.Connection con, Hotel h) throws SQLException {  /// DONE nada
		
		
		String sql="select * from hotel where location='"+h.getLocation()+"' and startAvDate<='"+h.getStartAvDate()+"' and endAvDate>='"+h.getEndAvDate()+"'";
		java.sql.Statement stmt1 = null;
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		System.out.println(rset);
		return rset;
		
	}
public ResultSet SearchforHotel2 (java.sql.Connection con, Hotel h) throws SQLException {  /// DONE nada
		System.out.println(h.getHotelName()+"' and location='"+h.getLocation()+" "+h.getStartAvDate()+"' and room.endAvDate>='"+h.getEndAvDate());
		
		String sql="select * from hotel  Inner Join room where room.hotel=hotel.name and location='"+h.getLocation()+"' and room.reserved='false' and room.startAvDate<='"+h.getStartAvDate()+"' and room.endAvDate>='"+h.getEndAvDate()+"'";
		java.sql.Statement stmt1 = null;
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		System.out.println(rset);
	
		
		//System.out.println(rs.getString("name"));
			
		return rset;
		
	}
	public ResultSet FilterBydistance (java.sql.Connection con, int choice, String location) throws SQLException { ///done nada
		//String sql = "SELECT * from Hotel where stars = '" + price + "'";
			java.sql.Statement stmt1 = null;
			String sql = "";
			if (choice == 1) {
				sql = "SELECT * from Hotel where distance < 3 and location = '" + location + "'";}
			else if (choice == 2) {
				sql = "SELECT * from Hotel where distance < 5 and location = '" + location + "'";}
			else if (choice == 3) {
				sql = "SELECT * from Hotel where distance < 10 and location = '" + location + "'";}
			else {
				sql = "SELECT * from Hotel where  distance < 20 and location = '" + location + "'";}
			
			stmt1 = con.createStatement();
			ResultSet rset = stmt1.executeQuery(sql);
			return rset;
			}
	public ResultSet FilterByMeals (java.sql.Connection con, int choice, String location) throws SQLException {	///done nada
		//String sql = "SELECT * from Hotel where stars = '" + price + "'";
			java.sql.Statement stmt1 = null;
			String sql = "";
			if (choice == 1) {
				sql = "SELECT * from Hotel where meals = 'Self catering' and location = '" + location + "'";}
			else if (choice == 2) {
				sql = "SELECT * from Hotel where meals = 'Breakfast included' and location = '" + location + "'";}
			else if (choice == 3) {
				sql = "SELECT * from Hotel where meals = 'Breakfast & lunch included' and location = '" + location + "'";}
			else {
				sql = "SELECT * from Hotel where  meals = 'Breakfast & dinner included' and location = '" + location + "'";}
			
			stmt1 = con.createStatement();
			ResultSet rset = stmt1.executeQuery(sql);
			return rset;
			}
	public ResultSet FilterByRating (java.sql.Connection con, int choice, String location) throws SQLException {  ///DONE nada
		//String sql = "SELECT * from Hotel where stars = '" + price + "'";
			java.sql.Statement stmt1 = null;
			String sql = "";
			if (choice == 1) {
				sql = "SELECT * from Hotel where rating >= 9 and location = '" + location + "'";}
			else if (choice == 2) {
				sql = "SELECT * from Hotel where rating between 8 and 8.99 and location = '" + location + "'";}
			else if (choice == 3) {
				sql = "SELECT * from Hotel where rating between 7 and 7.99 and location = '" + location + "'";}
			else {
				sql = "SELECT * from Hotel where  rating between 0 and 6.99 and location = '" + location + "'";}
			
			stmt1 = con.createStatement();
			ResultSet rset = stmt1.executeQuery(sql);
			return rset;
			}
	public ResultSet FilterByStars (java.sql.Connection con, int choice, String location) throws SQLException { //DONE nada
		//String sql = "SELECT * from Hotel where stars = '" + price + "'";
			java.sql.Statement stmt1 = null;
			String sql = "SELECT * from Hotel where stars = '" + choice + "' and location = '" + location + "'";
			stmt1 = con.createStatement();
			ResultSet rset = stmt1.executeQuery(sql);
			return rset;
			}
	
	public ResultSet FilterByPrice (java.sql.Connection con, int choice, String location) throws SQLException {    /// DONE nada
		//String sql = "SELECT * from Hotel where expectedPrice = '" + price + "'";
			java.sql.Statement stmt1 = null;
			String sql ="";
			if (choice == 1) {
				sql = "SELECT * from Hotel where expectedPrice between 0 and 1000 and location = '" + location + "'";}
			else if (choice == 2) {
				sql = "SELECT * from Hotel where expectedPrice between 1000 and 2000 and location = '" + location + "'";}
			else if (choice == 3) {
				sql = "SELECT * from Hotel where expectedPrice between 2000 and 3000 and location = '" + location + "'";}
			else if (choice == 4) {
				sql = "SELECT * from Hotel where expectedPrice between 3000 and 4000 and location = '" + location + "'";}
			else {
				sql = "SELECT * from Hotel where expectedPrice >= 4000 and location = '" + location + "'";}
			stmt1 = con.createStatement();
			ResultSet rset = stmt1.executeQuery(sql);
			return rset;
	}	
	
	
	
	public ResultSet getHotelsByRating (java.sql.Connection con, float rating) throws SQLException {  /// didn't use it
		
		java.sql.Statement stmt1 = null;
		String sql = "SELECT * from Hotel where expectedPrice = '" + rating + "'";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		return rset;
		}
	
	public java.sql.Date sqlDateConverter(String date) throws ParseException {   // didn't use it
		
		//out.println ("date is  " + date);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		java.util.Date dt=formatter.parse(date);   

		java.sql.Date sqlDate = new java.sql.Date(dt.getTime());
		return sqlDate;
		
		
	}
	
	
	public Set<String> getAllHotelNamed(java.sql.Connection con){   /// DONE
		
		Set<String> list  = new HashSet<String>();
        try{
           String query = "select location from Hotel";
           java.sql.Statement stmt1 = null;	
	   		stmt1 = con.createStatement();
	   		ResultSet rs = stmt1.executeQuery(query);
            while(rs.next()){
               
                list.add(rs.getString("location"));
            }
            
            
        }catch(SQLException e){
            e.printStackTrace();
        }
		return list;
       
    }
public Set<String> getAllHotels(java.sql.Connection con){   /// DONE
		
		Set<String> list  = new HashSet<String>();
        try{
           String query = "select name from Hotel";
           java.sql.Statement stmt1 = null;	
	   		stmt1 = con.createStatement();
	   		ResultSet rs = stmt1.executeQuery(query);
            while(rs.next()){
               
                list.add(rs.getString("name"));
            }
            
            
        }catch(SQLException e){
            e.printStackTrace();
        }
		return list;
}
	public void updateHotelInfo(Hotel hotel, java.sql.Connection con) throws SQLException {   //	Samaa
			
		String name = hotel.getHotelName();
		String queryUpdate = "update Hotel set location=?, contactInformation=?, hotelFacilities=?, otherBranches=? , meals =?, rating = ?,  stars=? where name='"+ name+"'";
		java.sql.PreparedStatement stmt = null;
		stmt = con.prepareStatement(queryUpdate);
		stmt.setString(1,hotel.getLocation());
		stmt.setString(2,hotel.getContactInformation());
		stmt.setString(3,hotel.getHotelFacilities());
		stmt.setString(4,hotel.getOtherBranches());
		stmt.setString(5,hotel.getMeals()); 
		stmt.setFloat(6, hotel.getRating());
		stmt.setInt(7,hotel.getStars());
		
		//stmt.setString(6,hotel.getRating());				el rating mafrood yb2aa float mesh String

		stmt.executeUpdate();
		}
	
public String getHotelRating(java.sql.Connection con, String hotel) throws SQLException { // Samaa
		
		java.sql.Statement stmt1 = null;

		String sql = "SELECT * from Hotel where name= '" + hotel+ "'";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		if (rset.next())
		{
			return rset.getString("rating");
		}
		return null;
		}
	public ResultSet getHotels(java.sql.Connection con) throws SQLException { // Samaa
		
		java.sql.Statement stmt1 = null;

		String sql = "SELECT * from Hotel";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		return rset;
		}
		
	}