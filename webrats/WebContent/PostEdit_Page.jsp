<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.webrats.entities.Posts"%>
<%@page import="com.webrats.entities.User"%>
<%@page import="com.webrats.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.webrats.helper.ConnectionProvider"%>
<%@page import="com.webrats.dao.PostDao"%>

<%
	User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
	PostDao pd = new PostDao(ConnectionProvider.GetConnection());

	int pid =-1;
		pid= Integer.parseInt(request.getParameter("pid"));
	if(pid == -1)
	{
		response.sendRedirect("login_page.jsp");
	}

	Posts post = pd.getPostByPostId(pid);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Your Post</title>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	
	
<!-- Extra all css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style >
.primary-background {
	background: #2196f3;
}
</style>
</head>



<body>


	<!--Navbar  -->

	<nav
		class="navbar navbar-expand-lg navbar-dark primary-background sticky-top">
		<a class="navbar-brand" href="#"><span
			class="fa fa-asterisk fa-spin"></span> WebRats</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Profile_page.jsp"><span class="	fa fa-bell-o"></span>
						Learn Programming <span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-clone"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<%
							ArrayList<Categories> list2 = new ArrayList<Categories>();

						PostDao pd2 = new PostDao(ConnectionProvider.GetConnection());
						list2 = pd2.getAllCategories();

						for (Categories c2 : list2) {

							String name2 = c2.getcName();
						%>
						<a class="dropdown-item" href="#"><%=name2%></a>

						<%
							}
						%>
						<a class="dropdown-item" href="#">Programming Language</a> <a
							class="dropdown-item" href="#">Data Structure</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Advance Java</a>
					</div></li>
				<li class="nav-item active"><a class="nav-link" href="#"> <span
						class="	fa fa-address-card"></span> Contact
				</a></li>





			</ul>

			<ul class="navbar-nav mr-right">

				<%-- <li class="nav-item active"><a class="nav-link" href="AdvanceEdit.jsp" > <span
						class="fa fa-edit"></span> Do Post
				</a></li>

				<li class="nav-item active"><a href="#!" class="nav-link"
					data-toggle="modal" data-target="#exampleModal"> <span
						class="	fa fa-user-circle"></span> <%=user.getName()%></a></li>

				<li class="nav-item active"><a href="LogoutServlet"
					class="nav-link"> <span class="	fa fa-sign-in"></span> Log out
				</a></li> --%>


				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="mr-2 d-none d-lg-inline text-gray-600 "><%=user.getName()%></span>
						<img class="img-profile rounded-circle" alt="Upload Photo"
						src="assets/img/faces/avatar.jpg"
						style="max-height: 40px; max-width: 40px;"">
				</a> <!-- Dropdown - User Information -->

					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#exampleModal"> <i
							class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						</a> <a class="dropdown-item" href="DoPost_Page.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> Do Post
						</a> <a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#CreatePostList"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> Create
							Post List
						</a> <a class="dropdown-item" href="#"> <i
							class="fa fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
						</a> <a class="dropdown-item" href="#"> <i
							class="fa fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity
							Log
						</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#logoutModal"> <i
							class="fa fa-sign-out fa-sm fa-fw mr-2 text-gray"></i> Logout
						</a>
					</div></li>


			</ul>



		</div>
	</nav>
				<!-- End of Navbar -->
	
	
	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="LogoutServlet">Logout</a>
				</div>
			</div>
		</div>
	</div>



	<!--Create Post List Model -->

	<div class="modal fade" id="CreatePostList" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="CreatePostListLabel">Create a
						Postlist</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">

					<form action="PostListServlet" id="post-list-form" method="post">
						

						<div class="form-group">
							<input type="text" class="form-control" name="PostListName"
								placeholder="PostList Name">
						</div>

						<div class="form-group">

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary ">Create</button>
							</div>

						</div>



					</form>
				</div>

			</div>
		</div>
	</div>







	<div class="container-fluid text-left ">
		<div class="row ">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left mt-4" style="background-color: white;">
				<div class="container text-center">
				
				<hr>

				<form action="EditPostServlet" id="add-post-form" method="post">

					<div class="form-group text-left">
						<label style="color: black;"> <span
							class="glyphicon glyphicon-edit"></span> Select Category <span
							style="color: red;">*</span></label> 
							<select class="form-control"
							name="pcId" required="required">

							<option selected="selected" disabled="disabled">---Select
								Category ---</option>
							<%
								PostDao pdao = new PostDao(ConnectionProvider.GetConnection());

							ArrayList<Categories> list = pdao.getAllCategories();
							for (Categories cat : list) {
							%>
							<option value="<%=cat.getcId()%>"><%=cat.getcName()%>
							</option>
							<%
								}
							%>


						</select>

					</div>

					<div class="form-group text-left">
						<label style="color: black;"> <span
							class="glyphicon glyphicon-edit"></span> Post Title <span
							style="color: red;">*</span></label> <input type="text"
							required="required" value="<%=post.getpTitle() %>" class="form-control" name="pTitle"
							placeholder="Title of your Post">
							<input  id="postid" name="Postid" value="<%=post.getpId()%>" >
					</div>

						



					<div class="form-group " style="padding-top: 20px;">


						<label class="form-control text-left"><span
							class="glyphicon glyphicon-edit"></span> Write Description <span
							style="color: red;">*</span></label>


						<div class="container text-left">
						<div id="summernote" <%= post.getpContent()%> ></div>
						</div>


						<div class="form-group">
							<textarea rows="" cols="" class="form-control "
								id="text-area-html" name="pContent"></textarea>
						</div>


					</div>

					<div class="form-group text-center">
						<button type="button" class="btn btn-primary form-control "
							id="code-gen">
							<span class="	glyphicon glyphicon-repeat"></span> Generate Code
						</button>
					</div>

					<div class="form-group text-center">
						<button type="submit" class="btn btn-primary" id="sub-btn">
							<span class="glyphicon glyphicon-globe fa-spin"></span> Submit
							Post
						</button>
					</div>
				</form>




				<!--End of Post Form  -->
			</div>
			</div>

			<div class="col-sm-2 sidenav"></div>

		</div>


	</div>

	<!--  Summer note script-->
	<script>
      $('#summernote').summernote({
        placeholder: 'Write Here!',
        tabsize: 2,
        height: 400
      });
    </script>

	<!-- Submit btn and Gen btn toggling  -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#sub-btn").hide()
			$("#postid").hide()
			

			$("#code-gen").click(function() {
				var html = $('#summernote').summernote('code');
				console.log(html)
				$("#sub-btn").show()
			$("#text-area-html").html(html);

			})
		})
	</script>

	<!-- form submit with summer note data -->

	<script>
		$(document).ready(function (e) {

		$("#add-post-form").on("submit",function(event) {
		event.preventDefault();
		
		var html = $('#summernote').summernote('code');
		console.log(html);
		$("#text-area-html").html(html);
		
		let form = new FormData(this);
		console.log(form);
		
		$.ajax({
			url : "AddPostServlet",
			type : 'POST',
			data : form ,
			success : function(data,textStatus,jqXHR) {
			console.log("success")
				swal("Successfully Edited post");
			},
			
			error : function(jqXHR,textStatus,errorThrown) {
				
				//error		},
			
			processData:false,
			contentType:false
			
		
		})
		
	})
	
})

</script>


</body>
</html>
