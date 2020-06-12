package com.webrats.dao;


import java.sql.*;
import java.util.ArrayList;

import com.webrats.entities.Categories;
import com.webrats.entities.Posts;

public class PostDao {
	
	Connection con ;
	
	
	
	
	
	/**
	 * @param con
	 */
	public PostDao(Connection con) {
		super();
		this.con = con;
	}



//Get all Category

	public ArrayList<Categories> getAllCategories() {
		
		ArrayList<Categories> list = new ArrayList<Categories>();
		
		try {
			
			String query = "Select * from categories ";
			
			Statement stmt = this.con.createStatement();
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				int cId = rs.getInt("cId");
				String cName = rs.getString("cName");
				String cDesc = rs.getString("cDesc");
				
				Categories c = new Categories(cId,cName,cDesc);
				
				list.add(c);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return list ;
	}
	
	
//	Getting All post by category id  
	
	public ArrayList<Posts> getAllPostById(int id){
		
		ArrayList<Posts> list =new ArrayList<Posts>();
		

		try {
			
			String query = "Select * from posts where pcId=? order by pId desc";
			
			PreparedStatement  pstmt=con.prepareStatement(query);
			
			pstmt.setInt(1, id);
			
		    ResultSet rs= 	pstmt.executeQuery();
			
			while(rs.next()) {
				int pId = rs.getInt("pId");
				int pcId = rs.getInt("pcId");
				int userId = rs.getInt("userId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				
				String pPicture = rs.getString("pPicture");
				Timestamp pdate = rs.getTimestamp("pDate");
				
				
				Posts post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
				
				list.add(post);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return list;
	}
	

	
//	Getting All post in descending order 
	
public ArrayList<Posts> getAllPost(){
		
		ArrayList<Posts> list =new ArrayList<Posts>();
		

		try {
			
			String query = "Select * from posts order by pId desc ";
			
			PreparedStatement  pstmt=con.prepareStatement(query);
			
			
			
		    ResultSet rs= 	pstmt.executeQuery();
			
			while(rs.next()) {
				int pId = rs.getInt("pId");
				int pcId = rs.getInt("pcId");
				int userId = rs.getInt("userId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				String pPicture = rs.getString("pPicture");
				Timestamp pdate = rs.getTimestamp("pDate");
				
				
				Posts post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
				
				list.add(post);
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return list;
	}
	
	

// post saving into db
	
	public boolean SavePost (Posts post) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into posts(pTitle,pContent,pPicture,pcId,userId ,plid) values(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			
			
			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpPicture());
			pstmt.setInt(4, post.getPcId());
			pstmt.setInt(5, post.getUserId());
			pstmt.setInt(6, post.getPlid());
			
			
			pstmt.executeUpdate();
			
			f= true;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	// Edit Post in db
	
		public boolean EditPost (Posts post) {
			
			boolean f = false;
			
			
			try {
				
				String sql = "update posts set pTitle= ?,pContent=?,pcId=? ,plid=?  where pId=? and userId =? ";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				
				
				pstmt.setString(1, post.getpTitle());
				pstmt.setString(2, post.getpContent());
				pstmt.setInt(3, post.getPcId());
				pstmt.setInt(4, post.getPlid());
				pstmt.setInt(5,post.getpId());
				pstmt.setInt(6, post.getUserId());
				
				
				pstmt.executeUpdate();
				
				f= true;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return f;
		}
	
// Update Post List id in db
		
		public boolean UpdatePostListId (int uid,int pid,int plid) {
			
			boolean f = false;
			
			
			try {
				
				String sql = "update posts set plid= ?  where pId=? and userId =? ";
				
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				
				
				
				  pstmt.setInt(1,plid); 
				  pstmt.setInt(2,pid); 
				  pstmt.setInt(3, uid);
				 
				
				
				pstmt.executeUpdate();
				
				f= true;
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return f;
		}
		

	
//Getting ONE post by post id 
	
public Posts getPostByPostId(int id){
		
		Posts post = null;
		

		try {
			
			String query = "Select * from posts where pId=? ";
			
			PreparedStatement  pstmt=con.prepareStatement(query);
			
			pstmt.setInt(1, id);
			
		    ResultSet rs= 	pstmt.executeQuery();
			
			while(rs.next()) {
				int pId = rs.getInt("pId");
				int pcId = rs.getInt("pcId");
				int userId = rs.getInt("userId");
				String pTitle = rs.getString("pTitle");
				String pContent = rs.getString("pContent");
				
				String pPicture = rs.getString("pPicture");
				Timestamp pdate = rs.getTimestamp("pDate");
				
				
				post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
				
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		return post;
	}

// Getting LIST of post by post writer id 

public ArrayList<Posts> getPostByWriterId(int id){
	ArrayList<Posts>  list =new ArrayList<Posts>();
	
	

	try {
		
		String query = "Select * from posts where userId=? order by pId desc";
		
		PreparedStatement  pstmt=con.prepareStatement(query);
		
		pstmt.setInt(1, id);
		
	    ResultSet rs= 	pstmt.executeQuery();
		
		while(rs.next()) {
			int pId = rs.getInt("pId");
			int pcId = rs.getInt("pcId");
			int userId = rs.getInt("userId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			
			String pPicture = rs.getString("pPicture");
			Timestamp pdate = rs.getTimestamp("pDate");
			
			
			Posts post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
			list.add(post);
			
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		
		e.printStackTrace();
	}
	
	return list;
}


//Getting LIST of post by postlist-id 

public ArrayList<Posts> getPostByPlid(int id){
	ArrayList<Posts>  list =new ArrayList<Posts>();
	
	

	try {
		
		String query = "Select * from posts where plid=? order by pId desc ";
		
		PreparedStatement  pstmt=con.prepareStatement(query);
		
		pstmt.setInt(1, id);
		
	    ResultSet rs= 	pstmt.executeQuery();
		
		while(rs.next()) {
			int pId = rs.getInt("pId");
			int pcId = rs.getInt("pcId");
			int userId = rs.getInt("userId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			
			String pPicture = rs.getString("pPicture");
			Timestamp pdate = rs.getTimestamp("pDate");
			
			
			Posts post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
			list.add(post);
			
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		
		e.printStackTrace();
	}
	
	return list;
}


//Getting list of  post by post userid 
public ArrayList<Posts> getPostByUserId(int uid){
	ArrayList<Posts>  list =new ArrayList<Posts>();
	
	

	try {
		
		String query = "Select * from posts where userId=? order by pId desc";
		
		PreparedStatement  pstmt=con.prepareStatement(query);
		
		pstmt.setInt(1, uid);
		
	    ResultSet rs= 	pstmt.executeQuery();
		
		while(rs.next()) {
			int pId = rs.getInt("pId");
			int pcId = rs.getInt("pcId");
			int userId = rs.getInt("userId");
			String pTitle = rs.getString("pTitle");
			String pContent = rs.getString("pContent");
			
			String pPicture = rs.getString("pPicture");
			Timestamp pdate = rs.getTimestamp("pDate");
			
			
			Posts post = new Posts(pId, pTitle, pContent, pPicture, pcId, pdate, userId);
			list.add(post);
			
		}
		
		
	} catch (Exception e) {
		// TODO: handle exception
		
		e.printStackTrace();
	}
	
	return list;
}



// Delete one Post using pid and user-id

public  boolean deltePostByPid(int dpid,int userid){
	
	boolean f = false;
	

	try {
		
		String query = "delete from posts where pId=? and userId=? ";
		
		PreparedStatement  pstmt=con.prepareStatement(query);
		
		pstmt.setInt(1, dpid);
		pstmt.setInt(2, userid);
		
	    pstmt.executeUpdate();
		f=true;
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		
		e.printStackTrace();
	}
	
	return f;
}








}
