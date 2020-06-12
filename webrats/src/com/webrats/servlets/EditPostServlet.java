package com.webrats.servlets;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.webrats.dao.PostDao;
import com.webrats.entities.Message;
import com.webrats.entities.Posts;
import com.webrats.entities.User;
import com.webrats.helper.ConnectionProvider;

/**
 * Servlet implementation class EditPostServlet
 */
@WebServlet("/EditPostServlet")
public class EditPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditPostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("current_user");
		int userId = user.getId();
		
		String pTitle = request.getParameter("pTitle");
		int  pId = Integer.parseInt(request.getParameter("Postid"));
		
	
		int pcId = Integer.parseInt(request.getParameter("pcId"));
		String pContent = request.getParameter("pContent");
		
		//Default Post List  value is -1 
		int plid = -1;
		
		System.out.print("tit:"+pTitle+"Cont:"+pContent+"pid:"+pId+"userid:"+userId+"plid:"+plid);
		
	
		//Posts post =  new Posts(pTitle, pContent, null, null, pcId, userId);
		Posts post = new Posts(pTitle, pContent,pId, pcId, userId, plid);
		
		PostDao pd = new PostDao(ConnectionProvider.GetConnection());
		
	
		if (pd.EditPost(post)) {
			
			//Post Save
			Message msg = new Message("Post Succesfully Edited", "success", "alert-success");
			
			session.setAttribute("msg", msg);
			
			response.sendRedirect("Profile_page.jsp");
	
		}
		else {
			// Post Not Save
			Message msg = new Message("Post Not Edited !!", "success", "alert-danger");
			
			session.setAttribute("msg", msg);
			
			response.sendRedirect("Profile_page.jsp");
			System.out.println("Post Not Upload ");
		}
	}

}
