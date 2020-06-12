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

import com.webrats.dao.PostDao;
import com.webrats.entities.Message;
import com.webrats.entities.Posts;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;
import com.webrats.helper.PictureSaveDeleteHelper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("current_user");
		
		
		String pTitle = req.getParameter("pTitle");
		
		
		int pcId = Integer.parseInt(req.getParameter("pcId"));
		String pContent = req.getParameter("pContent");
		//String pCode = req.getParameter("pCode");
		Part part = req.getPart("pPicture");
		String pPicture = part.getSubmittedFileName();
		
		int plid = 0;
		int userId = user.getId();
		
	
		
		
		//Posts post =  new Posts(pTitle, pContent, null, null, pcId, userId);
		Posts post = new Posts(pTitle, pContent, pPicture, pcId, userId, plid);
		
		PostDao pd = new PostDao(ConnectionProvider.GetConnection());
		
		
		
		
		
		String path = req.getSession().getServletContext().getRealPath("/")+"blogPics"+File.separator+part.getSubmittedFileName();
		
		PictureSaveDeleteHelper.savePicture(part.getInputStream(), path);
		
		
		if (pd.SavePost(post)) {
			
			//Post Save
			Message msg = new Message("Post Succesfully Submited", "success", "alert-success");
			
			session.setAttribute("msg", msg);
			
			res.sendRedirect("Profile_page.jsp");
			
			
			
			
			
		}
		else {
			// Post Not Save
			Message msg = new Message("Post Not Submited !!", "success", "alert-danger");
			
			session.setAttribute("msg", msg);
			
			res.sendRedirect("Profile_page.jsp");
			System.out.println("Post Not Upload ");
		}
		
	}

}
