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
 * Servlet implementation class DeletePostServlet
 */
@WebServlet("/DeletePostServlet")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		int dpid =  Integer.parseInt(request.getParameter("dpid"));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("current_user");
		
		PostDao pd = new PostDao(ConnectionProvider.GetConnection());
		if(pd.deltePostByPid(dpid, user.getId())) {
			out.print("done");
		}
		else {
			out.print("Can not delete !!");
		}
	}

}
