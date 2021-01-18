package com.user;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static  Connection con ;
	public static Connection initializeDB() throws SQLException, ClassNotFoundException {
		String dbDriver = "com.mysql.jdbc.Driver";
		String database = "hotel";
		String url = "jdbc:mysql://localhost:3306/";
		String user = "root";
		String password = "root";

		Class.forName(dbDriver);
		
		if (con == null || con.isClosed())
			con= DriverManager.getConnection(url + database, user, password);
		return con;
	}
}