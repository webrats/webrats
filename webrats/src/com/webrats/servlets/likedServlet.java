package com.webrats.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.webrats.dao.LikedDao;

import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class likedServlet
 */
@WebServlet("/likedServlet")
public class likedServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		 int uid =  Integer.parseInt(request.getParameter("uid"));
		 int pid =  Integer.parseInt(request.getParameter("pid"));
		 
		 
		 LikedDao ld = new LikedDao(ConnectionProvider.GetConnection());
		 
		 if (! ld.isAlreadyLiked(uid, pid)) {
			if(ld.insertLike(uid, pid)) {
				out.print("done");
			}
		}
		 else {
			 	out.print("Already Liked");
		}
		 
		
		
		
	}

}
