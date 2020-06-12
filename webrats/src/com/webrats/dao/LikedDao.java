package com.webrats.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikedDao {

	
	Connection con ;

	public LikedDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	
	
	public boolean insertLike(int uid,int pid) {
		
		boolean f = false;
		
		try {
			String sql = "insert into liked (uid,pid) values (?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setInt(1,uid);
			pstmt.setInt(2,pid);
			
			 pstmt.executeUpdate();
			 f= true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}

	
	public int countLike(int pid) {
		int count=0;
		String sql = "select count(*) from liked where pid =?";
		try {
			
			
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			
		 	 ResultSet rs = pstmt.executeQuery();
		 	 if(rs.next()) {
		 		 count = rs.getInt("count(*)");
		 		 
		 	 }
		 	 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return count;
	}

	public boolean isAlreadyLiked(int uid,int pid) {
		boolean f= false;
		
		String sql = "select * from liked where uid =? and pid=?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, pid);
			
			ResultSet rs =  pstmt.executeQuery();
			if(rs.next())
			{
				f=true;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	public boolean deleteLike(int uid,int pid) {
		boolean f= false;
		
		String sql = "delete from liked where uid =? and pid=?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			pstmt.setInt(2, pid);
			
				pstmt.executeUpdate();
				f=true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
