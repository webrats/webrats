package com.webrats.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.webrats.dao.UserDao;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
				String name = req.getParameter("user_name");
				String email = req.getParameter("user_email");
				String password = req.getParameter("user_password");
				String gender = req.getParameter("gender");
				String check = req.getParameter("check");
				String about = req.getParameter("user_about");
				
				PrintWriter out = res.getWriter();
			

				
				
				
				if(check == null) {
					out.print("checknull");
					
				}
				
				
				else {
					User user = new User(name,email,password,gender,about);
					
					Connection con = ConnectionProvider.GetConnection();
					
					UserDao userdao = new UserDao(con);
					if (userdao.SaveUser(user)) {
					
						out.print("done");
						
					}
				}
				
				
				
			}

}
