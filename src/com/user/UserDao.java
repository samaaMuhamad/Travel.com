package com.user;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

public class UserDao {
	
	public ResultSet getClients(java.sql.Connection con, String username) throws SQLException {
		java.sql.Statement stmt1 = null;

		String sql = "SELECT * from User where username=  '" + username +"' and type = 'client' ";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		return rset;
		}
	
	public ResultSet getAllClients(java.sql.Connection con) throws SQLException {
		java.sql.Statement stmt1 = null;

		String sql = "SELECT * from User where type= 'client' ";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		return rset;
		}
	
	public String getAdminForHotel(java.sql.Connection con , String hotel) throws SQLException {
		
		java.sql.Statement stmt1 = null;

		String sql = "SELECT email from User where hotelName='"+ hotel +"' and type= 'admin'";
		stmt1 = con.createStatement();
		ResultSet rset = stmt1.executeQuery(sql);
		String email = "";
		
		if(rset.next())
		{
			email= rset.getString("email");
		}
		return email;
		
		}
	
	
	// WOrks
	public boolean validateInfo (String username, String password, java.sql.Connection con) throws SQLException {
		java.sql.Statement stmt1 = null;
		
		String sql = "SELECT username , password from User where username= '" + username + "' and password = '"
				+ password + "'";

		stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery(sql);
		
		if (rs.next()) {
			return true;
		} else {
               	
			return false;
		}
		
	}
	// WOrks
		public boolean userExistIn (String username, java.sql.Connection con) throws SQLException {
			java.sql.Statement stmt1 = null;
			
			String sql = "SELECT username from User where username= '" + username + "'";

			stmt1 = con.createStatement();
			ResultSet rs = stmt1.executeQuery(sql);
			
			if (rs.next()) {
				return true;
			} else {
	               	
				return false;
			}
			
		}
		
		// WOrks
				public boolean emailExistIn (String email, java.sql.Connection con) throws SQLException {
					java.sql.Statement stmt1 = null;
					
					String sql = "SELECT email from User where email= '" + email + "'";

					stmt1 = con.createStatement();
					ResultSet rs = stmt1.executeQuery(sql);
					
					if (rs.next()) {
						return true;
					} else {
			               	
						return false;
					}
					
				}
		
	//Works
	public void updateInfo(User user, java.sql.Connection con) throws SQLException {
		
		String username = user.getUsername();
		String queryUpdate = "update User set name=?, password=?, email=?, mobile=? where username='"+ username+"'";
		java.sql.PreparedStatement stmt = null;
		stmt = con.prepareStatement(queryUpdate);
		stmt.setString(1,user.getName());
		stmt.setString(2,user.getPassword());
		stmt.setString(3,user.getEmail());
		stmt.setString(4,user.getMobile());

		stmt.executeUpdate();
		
	}
	// Works
	public void registerUser(User user, java.sql.Connection con) throws SQLException {
		
		String query = " insert into user (username, name, password, email, mobile, type, hotelName)"
		        + " values (?, ?, ?, ?, ?, ?, ?)";

		      PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
		      preparedStmt.setString (1, user.getUsername());
		      preparedStmt.setString (2, user.getName());
		      preparedStmt.setString  (3, user.getPassword());
		      preparedStmt.setString(4, user.getEmail());
		      preparedStmt.setString(5, user.getMobile());
		      preparedStmt.setString(6, user.getType());
		      preparedStmt.setString(7, user.getHotelName());
		      preparedStmt.execute();
		      
	}
	// WORKS
	public String generatePasswordint(int length) {
			
			String capitalCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		      String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
		      String specialCharacters = "!@#$";
		      String numbers = "1234567890";
		      String combinedChars = capitalCaseLetters + lowerCaseLetters + specialCharacters + numbers;
		      Random random = new Random();
		      char[] password = new char[length];
	
		      password[0] = lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length()));
		      password[1] = capitalCaseLetters.charAt(random.nextInt(capitalCaseLetters.length()));
		      password[2] = specialCharacters.charAt(random.nextInt(specialCharacters.length()));
		      password[3] = numbers.charAt(random.nextInt(numbers.length()));
		   
		      for(int i = 4; i< length ; i++) {
		         password[i] = combinedChars.charAt(random.nextInt(combinedChars.length()));
		      }
		      String pw = new String(password);
		      return pw;
			
		}
	

	public String getType (String username, String password, java.sql.Connection con) throws SQLException {
		java.sql.Statement stmt1 = null;
		
		String sql = "SELECT type from User where username= '" + username + "' and password = '"
				+ password + "'";

		stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery(sql);
		 String type="";
		if (rs.next()) {
			 type=rs.getString("type");
			return type;
		}
		return type;
		
	}
	public String getHotelName (String username, java.sql.Connection con) throws SQLException {
		java.sql.Statement stmt1 = null;
		
		String sql = "SELECT  hotelName from User where username= '" + username + "'";

		stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery(sql);
		 String hotelName="";
		if (rs.next()) {
			hotelName=rs.getString("hotelName");
			return hotelName;
		}
		return hotelName;
		
	}
}
