package com.webrats.helper;

import java.sql.*;

public class ConnectionProvider {

	public static Connection con =null;
	
	public static Connection GetConnection() {
		
		try {
			if(con == null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost/webrats","root","rindows");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
		
	}
}
