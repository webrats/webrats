package com.webrats.servlets;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.webrats.dao.UserDao;
import com.webrats.entities.Message;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;
import com.webrats.helper.PictureSaveDeleteHelper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		//Editing User profile
		
		
		
		String name =request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String about = request.getParameter("user_about");
		Part part = request.getPart("user_picture");
		
		
		String pictureName = part.getSubmittedFileName();
		
		
		
		
		//get user from session and update user new value
		
		HttpSession session = request.getSession();
		
		User user = (User) session.getAttribute("current_user");
		
		String oldPicName = user.getProfile();
		
		
	
		
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		
		if(pictureName.contains(".")) {
			user.setProfile(pictureName);
			String	 Path = request.getSession().getServletContext().getRealPath("/")+"pics"+File.separator +oldPicName;
			oldPicName = null;
			PictureSaveDeleteHelper.deletePicture(Path);
		}
		else {
		}
		
		UserDao ud = new UserDao(ConnectionProvider.GetConnection());
		
		if (ud.updateUser(user)) {
			
			String	 Path = request.getSession().getServletContext().getRealPath("/")+"pics"+File.separator +user.getProfile();
			
			
			if (PictureSaveDeleteHelper.savePicture(part.getInputStream(), Path)) {
				
				Message msg = new Message("Successfully Updated ! ","success" , "alert-success");
				session.setAttribute("msg", msg);
				
				response.sendRedirect("Profile_page.jsp");
				
			}
			
			else {

				Message msg = new Message("picture not updated  ! ","success" , "alert-danger");
				session.setAttribute("msg", msg);
				
				response.sendRedirect("Profile_page.jsp");
				
			}
			
		}
		else {
			Message msg = new Message("Profile can not Update ! ","error" , "alert-danger");
			session.setAttribute("msg", msg);
			
			response.sendRedirect("Profile_page.jsp");
		}
		
		
		//update user information 
		
	}

}
