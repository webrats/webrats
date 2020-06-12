<%@page import="com.webrats.entities.User"%>
<%@page import="com.webrats.dao.LikedDao"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.webrats.entities.Posts"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.webrats.helper.ConnectionProvider"%>
<%@page import="com.webrats.dao.PostDao"%>

<%
	User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
	
	
}
%>



<!-- Get post by category id  -->

<div class="row">
	<%
		Thread.sleep(1000);
	PostDao pd = new PostDao(ConnectionProvider.GetConnection());

	int c = Integer.parseInt(request.getParameter("cid"));
	ArrayList<Posts> list = null;
	if (c == 0) {
		list = pd.getAllPost();
	} else {
		list = pd.getAllPostById(c);
	}
	if (list.size() == 0) {
		out.print("<h3 class='display-3 text-center'>No post available</h3>");
	}

	for (Posts p : list) {

		int pId = p.getpId();
		int pcId = p.getPcId();
		int userId = p.getUserId();
		String pTitle = p.getpTitle();
		String pContent = p.getpContent();
		String pPicture = null;
		try {
			pPicture = p.getpPicture();
		} catch (Exception e) {

		}
		Timestamp pdate = p.getPdate();
	%>
	<div class="col-lg-4 col-md-6 mt-auto ml-auto mr-auto">

		<div class="card">
			<div class="card-img"
				style="background-image: url('blogPics/<%=pPicture %>');">
				<div class="overlay">
					<div class="overlay-content">
						<a href="post_page.jsp?pid=<%=pId%>" >Read More</a>
					</div>
				</div>
			</div>

			<div class="card-content">
				<a href="post_page.jsp?pid=<%=pId%>">
					<h2><%=pTitle %></h2>
					<p>Lorem ipsum dolor sit amet consectetur, lorem ipsum dolor</p>
				</a>
				<hr>
				<div class="row">
						<div class="col-md-4 col-4  col-sm-4  text-right" style="font-size: 90%;">
							Posted :
						</div>
						<div class="col-md-8 col-8  col-sm-8 text-center " style="font-size: 80%;">
							<%=p.getPdate().toLocaleString() %>
						</div>
				</div>
				<div class="row ">
						<div class="col-md-6 col-6  col-sm-6 ">
						<!--1 s -->
						<%
						LikedDao ld = new LikedDao (ConnectionProvider.GetConnection());
						ld.countLike(pId);
				
						%>
						<!-- 1 e  -->
						
						<!-- 2 s -->
						<%
						
						 if(ld.isAlreadyLiked(user.getId(), pId)){
							 
							 %>
							 <a href="#" onclick="insertLike(<%=user.getId()%>,<%=pId%>)"><i class="fa fa-thumbs-o-up " style="color: blue;" ></i> <%=ld.countLike(pId) %></a>
							 <% 
						 }
						else{
							
							%>
							 <a href="#" onclick="insertLike(<%=user.getId()%>,<%=pId%>)"><i class="fa fa-thumbs-o-up " ></i> <%=ld.countLike(pId) %></a>
							 <% 
						}
					
						%>
						<!-- 2 e -->

						</div>

						
						<div class="col-md-6 col-6  col-sm-6 ">
							<a href="#" class="fa fa-commenting-o "><span> 20</span></a>

						</div>

					</div>
			</div>
		</div>

	</div>


	<%
		}
	%>
</div>

