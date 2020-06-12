package com.webrats.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.webrats.dao.UserDao;
import com.webrats.entities.Message;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = res.getWriter();
		
		String email= req.getParameter("user_email");

		String password= req.getParameter("user_password");
		
		Connection con = ConnectionProvider.GetConnection();

		UserDao dao = new UserDao(con);
		
		User  user =  dao.getUserbyEmailandPassword(email, password);
		
		
		
		if(user == null)
		{
			// user invalid
			Message msg = new Message("Invalid details!! Try again .", "Error");
			
			HttpSession session = req.getSession();
			session.setAttribute("msg", msg);
			res.sendRedirect("login_page.jsp");
			
		}
		else {
			//valid user
			
			out.print("valid user");
			
			out.print(user.getEmail());
			
			
		HttpSession session = req.getSession();
			session.setAttribute("current_user", user);
		res.sendRedirect("Profile_page.jsp");
			
			
		}
		
		
	}

}
