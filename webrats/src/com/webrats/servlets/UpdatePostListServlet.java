package com.webrats.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webrats.dao.PostDao;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class UpdatePostListServlet
 */
@WebServlet("/UpdatePostListServlet")
public class UpdatePostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pid = Integer.parseInt(request.getParameter("pid"));
		int plid =Integer.parseInt( request.getParameter("plid"));
		PrintWriter out = response.getWriter();
		
		HttpSession session =  request.getSession();
		User user = (User)session.getAttribute("current_user");
		int uid = user.getId();
		PostDao pd = new PostDao(ConnectionProvider.GetConnection());
		if(pd.UpdatePostListId(uid, pid, plid)) {
			out.print("done");
		}
		
		
	}

}
