package com.webrats.dao;

import java.sql.*;


import com.webrats.entities.User;

public class UserDao {
	
private Connection con = null;

/**
 * @param con
 */
public UserDao(Connection con) {
	super();
	this.con = con;
}


//Save user in db
public boolean SaveUser(User user) {

	
	boolean f=false;
	
	try {
		
		String quary = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
		PreparedStatement pstmt = this.con.prepareStatement(quary);
		
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getEmail());
		pstmt.setString(3,user.getPassword());
		pstmt.setString(4, user.getGender());
		pstmt.setString(5, user.getAbout());
		
		
		pstmt.executeUpdate();
		f=true;
		
		
	} catch (Exception e) {
		
		e.printStackTrace();
		// TODO: handle exception
	}
	return f;
	
}

//getting user by email and password

public User getUserbyEmailandPassword (String email,String password) {
	User user = null;
	
	try {
		String Query = "select * from user where email = ? and password = ?";
		
		PreparedStatement pstmt = con.prepareStatement(Query);
		
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		
		 ResultSet rs =  pstmt.executeQuery();
		 
		 
		 
		 if(rs.next()) {
			 user = new User();
			 
			 user.setId(rs.getInt("id"));
			 user.setName(rs.getString("name"));
			 user.setEmail(rs.getString("email"));
			 user.setPassword(rs.getString("password"));
			 user.setGender(rs.getString("gender"));
			 user.setProfile(rs.getString("profile"));
			 user.setAbout(rs.getString("about"));
			 
			 
			 user.setDatetimTime(rs.getTimestamp("rdate"));
			 
			 
		 }
		 
		
		
	} catch (Exception e) {
		// TODO: handle exception
		System.out.print("user null "+ e);
	}
	
	
	return user;
}

//Update user in db

public boolean updateUser(User user) {
	boolean f =false;
	try {

		String query = "update user set name=? , email=? ,password=? , profile=?,about=? where id =? ";
		PreparedStatement pstmt = con.prepareStatement(query);
		
		pstmt.setString(1, user.getName());
		pstmt.setString(2,user.getEmail());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getProfile());
		pstmt.setString(5,user.getAbout());
		pstmt.setInt(6, user.getId());
		
		
		pstmt.executeUpdate();
		f=true;
		
	} catch (Exception e) {
		// TODO: handle exception
		
		e.printStackTrace();
	}
	
	return f;
}

//Getting user by id
public User getUserbyId (int id) {
	User user = null;
	
	try {
		String Query = "select * from user where id = ? ";
		
		PreparedStatement pstmt = con.prepareStatement(Query);
		
		pstmt.setInt(1, id);
		
		
		 ResultSet rs =  pstmt.executeQuery();
		 
		
		 
		 if(rs.next()) {
			 
			 
			 
			 String name = rs.getString("name");
			 String email = rs.getString("email");
			 
			 String gender = rs.getString("gender");
			String pPicture = rs.getString("profile");
			 String about = rs.getString("about");
			 
			 
			user = new User(name, email, null, gender, about, pPicture);
			 
			 
		 }
		 
		
		
	} catch (Exception e) {
		// TODO: handle exception
		System.out.print("user null "+ e);
	}
	
	
	return user;
}



//dao class end
}
