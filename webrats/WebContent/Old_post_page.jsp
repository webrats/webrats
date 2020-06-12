<%@page import="com.webrats.dao.UserDao"%>
<%@page import="com.webrats.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.webrats.entities.Message"%>
<%@page import="com.webrats.helper.ConnectionProvider"%>
<%@page import="com.webrats.dao.PostDao"%>
<%@page import="com.webrats.entities.Posts"%>
<%@page import="com.webrats.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page errorPage="error_page.jsp"%>

<%
	User user = (User) session.getAttribute("current_user");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>

<%
	int pid = Integer.parseInt(request.getParameter("pid"));

PostDao pd = new PostDao(ConnectionProvider.GetConnection());
Posts post = pd.getPostByPostId(pid);


UserDao ud = new UserDao(ConnectionProvider.GetConnection());
User pWriter=  ud.getUserbyId(post.getUserId());

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=post.getpTitle()%></title>



<!-- Css link -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 64% 97%, 26% 92%, 0 100%, 0 0);
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
						Learn Code with Amit <span class="sr-only">(current)</span></a></li>

				<li class="nav-item dropdown active"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="		fa fa-clone"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
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

				<li class="nav-item active"><a class="nav-link" href="AdvanceEdit.jsp" > <span
						class="fa fa-edit"></span> Do Post
				</a></li>

				<li class="nav-item active"><a href="#!" class="nav-link"
					data-toggle="modal" data-target="#exampleModal"> <span
						class="	fa fa-user-circle"></span> <%=user.getName()%></a></li>

				<li class="nav-item active"><a href="LogoutServlet"
					class="nav-link"> <span class="	fa fa-sign-in"></span> Log out
				</a></li>
			</ul>



		</div>
	</nav>



	<!-- End of Navbar -->


	<!--Alert Message -->
	<%
		Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCsstype()%>" role="alert">
		<%=msg.getContent()%>
	</div>
	<%
		}

	session.removeAttribute("msg");
	%>




	<!-- main Body -->



	<main>

		<div class="container-fluid mt-3">

			<div class="row">


				<!-- Left Column -->

				<div class="col-md-3 sidenav text-center ">
					<!-- all categories -->
					<div class="conteiner " >
						<div class="list-group">
							<a href="#" 
								class="cat-link list-group-item list-group-item-action active">Post Details</a>
							


						</div>
						
						<div class="container " id="Writer-profile-details">
						<div class="container text-center mt-3 mb-4">
						<img alt="<%=user.getProfile()%>"
							src="pics/<%=user.getProfile()%>"
							style="border-radius: 50%; width: 100px;">
						</div>

						<table class="table">
							<thead>

							</thead>
							<tbody>
								<tr>
									<th scope="row">Writer :</th>
									<td><%=pWriter.getName()%></td>

								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=pWriter.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=pWriter.getGender()%></td>

								</tr>

								<tr>
									<th scope="row">About :</th>
									<td><%=pWriter.getAbout()%></td>

								</tr>
								<tr>
									<th scope="row">Posted on :</th>
									<td><%=post.getPdate().toLocaleString()%></td>

								</tr>
							</tbody>
						</table>
					</div>

					</div>
					
				</div>

				<!-- End of Left Column -->


				<!-- Right column  -->


							<!--  post  Body-->
				<div class="col-md-8">




					<div class="container-fluid">
						<div class="card">


							<div class="col-md-12 text-center">
								<img src="blogPics/<%=post.getpPicture()%>" class="img-fluid "
									style="max-height: 400px; max-width: 400px;">

							</div>
							<div class="card-header text-center">
								<div>
									<%=post.getpTitle()%>
								</div>

							</div>

							<div class="card-body ">
								<div class="container">
									<%=post.getpContent()%>
								</div>
								
								<br>


								


							</div>
						</div>

					</div>


			f



				</div>

							<!-- End of post body -->
				
				
				<!--End of RIght column  -->


	<!--  -->
	<div class="col-md-1  ">
	
	</div>
				

			</div>

		</div>



	</main>






	<!-- End of main body -->








	<!--  Profile Model -->



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white "
					style="align-items: center;">
					<h5 class="modal-title " id="exampleModalLabel">
						<span class="fa fa-asterisk fa-spin"> </span> WebRats
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>






				<div class="modal-body">

					<div class="container text-center">
						<img alt="<%=user.getProfile()%>"
							src="pics/<%=user.getProfile()%>"
							style="border-radius: 50%; width: 100px;">
						<h5 class="modal-title" id="exampleModalLabel">
							<%=user.getName().toUpperCase()%></h5>
					</div>



					<!-- Profile details   -->



					<div class="container " id="profile-details">

						<table class="table">
							<thead>

							</thead>
							<tbody>
								<tr>
									<th scope="row">ID :</th>
									<td><%=user.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Email :</th>
									<td><%=user.getEmail()%></td>

								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender()%></td>

								</tr>

								<tr>
									<th scope="row">About :</th>
									<td><%=user.getAbout()%></td>

								</tr>
								<tr>
									<th scope="row">Registration Data :</th>
									<td><%=user.getDatetimTime()%></td>

								</tr>
							</tbody>
						</table>
					</div>

					<!-- End of profile Details  -->




					<!-- Edit profile Details -->


					<form action="EditServlet" method="post"
						enctype="multipart/form-data">
						"

						<div class="container  " id="profile-details-edit"
							style="display: none;">
							<table class="table">

								<tr>
									<th scope="row">Id :</th>
									<td><%=user.getId()%></td>
								</tr>

								<tr>
									<th scope="row">Email :</th>
									<td><input type="email" class="form-control"
										required="required" name="user_email"
										value="<%=user.getEmail()%>"></td>
								</tr>
								<tr>
									<th scope="row">Name :</th>
									<td><input type="text" class="form-control"
										required="required" name="user_name"
										value="<%=user.getName()%>"></td>

								</tr>
								<tr>
									<th scope="row">Password :</th>
									<td><input type="password" class="form-control"
										required="required" name="user_password"
										value="<%=user.getPassword()%>"></td>

								</tr>
								<tr>
									<th scope="row">Gender :</th>
									<td><%=user.getGender()%></td>

								</tr>
								<tr>
									<th scope="row">About :</th>
									<td><textarea class="form-control" rows="3" cols=""
											name="user_about"><%=user.getAbout()%></textarea></td>

								</tr>

								<tr>
									<th scope="row">Profile Picture :</th>
									<td><input class="form-control" type="file"
										name="user_picture"></td>

								</tr>

							</table>

							<!-- Edit profile Submit Button -->

							<div class="container text-center">
								<button type="submit" class="btn btn-outline-primary"
									id="profile-edit-save-btn">Save</button>

							</div>

						</div>


					</form>

					<!-- End of Edit profile Details -->


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary  "
						id="profile-edit-btn">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of Profile Model  -->





	<!--Do Post Model -->




	<!-- Modal -->
	<div class="modal fade" id="postModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Description of
						your Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">




					<!--do Post Form   -->


					<form action="AddPostServlet" id="add-post-form" method="post"
						enctype="multipart/form-data">

						<div class="form-group">
							<select class="form-control" name="pcId">
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

						<div class="form-group">
							<input type="text" class="form-control" name="pTitle"
								placeholder="Title of your Post">
						</div>

						<div class="form-group">
							<textarea rows="10" cols="" class="form-control" name="pContent"
								placeholder="Description "></textarea>
						</div>
						<div class="form-group">
							<textarea rows="10" cols="" class="form-control" name="pCode"
								placeholder="Write example Code of your Post (if any)  "></textarea>
						</div>
						<div class="form-group">
							<label for="pPicture">Upload post Image</label> <input
								type="file" class="form-control" name="pPicture">

						</div>
						<div class="form-group text-center">
							<button type="submit" class="btn btn-primary">Submit
								Post</button>
						</div>
					</form>

					<!--End of Post Form  -->



				</div>

			</div>
		</div>
	</div>

	<!-- End of Do Post Model -->





	<!-- java script -->


	<script src="https://code.jquery.com/jquery-3.5.1.min.js"
		integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>



	<!-- profile edit Script -->

	<script>
$(document).ready(function() {
	
	let edit = false ;
	$('#profile-edit-btn').click(function() {
		if(edit==false){
			$('#profile-details-edit').show();
			$('#profile-details').hide();
			$(this).text("back");
			edit = true;
				
		}
		else{
			$('#profile-details-edit').hide();
			$('#profile-details').show();
			$(this).text("Edit");
			edit = false;
				
		}
	});
});
</script>

	<!-- End of Profile Edit Script -->






	<!-- post-form  Script -->


	<script>
$(document).ready(function (e) {
	//alert("Loaded");
	
	$("#add-post-form").on("submit",function(event) {
		event.preventDefault();
		
		
		let form = new FormData(this);
		
		$.ajax({
			url : "AddPostServlet",
			type : 'POST',
			data : form ,
			success : function(data,textStatus,jqXHR) {
				swal({
					  title: "Good job!",
					  text: data,
					  icon: "success",
					})
				.then((value) => {
              	  window.location ="Profile_page.jsp";
              	});
				
			},
			
			error : function(jqXHR,textStatus,errorThrown) {
				//error
				swal("Something Wrong Try again!!")
			},
			
			processData:false,
			contentType:false
			
		
		})
		
	})
	
})

</script>

	<!-- End-post-form Script -->






</body>
</html>