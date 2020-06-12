package com.webrats.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;


import com.webrats.entities.PostList;

public class PostListDao {

	Connection con;

	public PostListDao(Connection con) {
		super();
		this.con = con;
	}
	
	//creating Postlist using plname and pluserid
	public boolean createPostList(PostList postlist) {
		boolean f =false;
		
		try {
			String sql = "insert into postlist (plname,pldesc,pluserid) values (?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setString(1,postlist.getPlname());
			pstmt.setString(2,postlist.getPldesc());
			pstmt.setInt(3, postlist.getPluserid());
			
			 pstmt.executeUpdate();
			 f= true;
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return f;
	}
	

//getting Writter PostList by Writer id
	
public ArrayList<PostList> getAllPostListByWriterId(int pluserid) {
		
		ArrayList<PostList> list = new ArrayList<PostList>();
		
		try {
			
			String sql = "Select * from postlist where pluserid =? ";
			PreparedStatement pstmt = this.con.prepareStatement(sql);
			pstmt.setInt(1, pluserid);
	
			
			ResultSet rs =  pstmt.executeQuery();
			
			while(rs.next()) {
				int plid = rs.getInt("plid");
				String plname = rs.getString("plname");
				String pldesc = rs.getString("plname");
				int pluser = rs.getInt("pluserid");
				
				PostList pl = new PostList(plid, plname,pldesc, pluser);
				
				list.add(pl);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return list ;
	}
	
	
}
