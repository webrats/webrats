package com.webrats.servlets;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webrats.dao.PostListDao;
import com.webrats.entities.Message;
import com.webrats.entities.PostList;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class PostListServlet
 */
@WebServlet("/PostListServlet")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("current_user");

		

			String plname = request.getParameter("PostListName");
			String pldesc = request.getParameter("PostListDesc");

			int pluserid = user.getId();

			PostList postlist = new PostList(plname, pldesc, pluserid);

			PostListDao pld = new PostListDao(ConnectionProvider.GetConnection());
			if (pld.createPostList(postlist)) 
				{

				Message msg = new Message("Postlist Created", "success", "alert-success");
				session.setAttribute("msg", msg);

				response.sendRedirect("Profile_page.jsp");
				}
			else {

				Message msg = new Message("Postlist Created", "success", "alert-danger");
				session.setAttribute("msg", msg);

				response.sendRedirect("Profile_page.jsp");

				}
		
		
		
		

	}

}
