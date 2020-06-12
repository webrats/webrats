<%@ page errorPage="error_page.jsp"%>
<%@page import="com.webrats.entities.PostList"%>
<%@page import="com.webrats.dao.PostListDao"%>
<%@page import="com.webrats.entities.Categories"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Posts</title>


<!-- Css link -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Clip Path Css -->

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 64% 97%, 26% 92%, 0 100%, 0 0);
}
</style>



<!--  Hover Card css-->
<style type="text/css">
.card {
	width: 100%;
	display: inline-block;
	margin: 1rem;
	border-radius: 4px;
	box-shadow: 0 -1px 1px 0 rgba(0, 0, 0, 0.05), 0 1px 2px 0
		rgba(0, 0, 0, 0.2);
	-webkit-transition: all 0.2s ease;
	transition: all 0.2s ease;
	background: #fff;
	position: relative;
	overflow: hidden;
}

.card:hover, .card.hover {
	-webkit-transform: translateY(-4px);
	transform: translateY(-4px);
	box-shadow: 0 4px 25px 0 rgba(0, 0, 0, 0.3), 0 0 1px 0
		rgba(0, 0, 0, 0.25);
}

.card:hover .card-content, .card.hover .card-content {
	box-shadow: inset 0 3px 0 0 #ccb65e;
	border-color: #ccb65e;
}

.card:hover .card-img .overlay, .card.hover .card-img .overlay {
	background-color: rgba(25, 29, 38, 0.85);
	-webkit-transition: opacity 0.2s ease;
	transition: opacity 0.2s ease;
	opacity: 1;
}

.card-img {
	position: relative;
	height: 224px;
	width: 100%;
	background-color: #fff;
	-webkit-transition: opacity 0.2s ease;
	transition: opacity 0.2s ease;
	background-position: center center;
	background-repeat: no-repeat;
	background-size: cover;
}

.card-img .overlay {
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: #fff;
	opacity: 0;
}

.card-img .overlay .overlay-content {
	line-height: 224px;
	width: 100%;
	text-align: center;
	color: #fff;
}

.card-img .overlay .overlay-content a {
	color: #fff;
	padding: 0 2rem;
	display: inline-block;
	border: 1px solid rgba(255, 255, 255, 0.4);
	height: 40px;
	line-height: 40px;
	border-radius: 20px;
	cursor: pointer;
	text-decoration: none;
}

.card-img .overlay .overlay-content a:hover, .card-img .overlay .overlay-content a.hover
	{
	background: #ccb65e;
	border-color: #ccb65e;
}

.card-content {
	width: 100%;
	min-height: 104px;
	background-color: #fff;
	border-top: 1px solid #e9e9eb;
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px;
	padding: 1rem 2rem;
	-webkit-transition: all 0.2s ease;
	transition: all 0.2s ease;
}

.card-content a {
	text-decoration: none;
	color: #202927;
}

.card-content h2, .card-content a h2 {
	font-size: 1rem;
	font-weight: 500;
}

.card-content p, .card-content a p {
	font-size: 0.8rem;
	font-weight: 400;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	color: rgba(32, 41, 28, 0.8);
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
						style="max-height: 40px; max-width: 40px;">
				</a> <!-- Drop down - User Information -->

					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#exampleModal"> <i
							class="fa fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
						</a> <a class="dropdown-item" href="DoPost_Page.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> Do Post
						</a> <a class="dropdown-item" href="test.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> My Posts
						</a> <a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#CreatePostList"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> Create
							Post List
						</a> <a class="dropdown-item" href="Postlist_Page.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> My Post
							List
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



	<!-- Get post by user id  -->

	<div class="container">



		<div class="row ">
			<div class="col-md-12 col-sm-12 col-12 " style="text-align: center;">
				<h2 class="font-weight-light">My Posts</h2>
			</div>

		</div>


		<div class="row">
			<%
				PostDao pd = new PostDao(ConnectionProvider.GetConnection());

			int uid = user.getId();
			ArrayList<Posts> list = null;
			list = pd.getPostByUserId(uid);

			if (list.size() == 0) {
				out.print("<h3 class='display-3 text-center'>You have no Post</h3>");
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
			<div
				class="col-lg-4 col-md-6 col-sm-6 col-12  mt-auto ml-auto mr-auto">

				<div class="card">
					<div class="card-header text-right">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fa fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<!-- <div class="dropdown-header">Dropdown Header:</div> -->
							<a class="dropdown-item" href="PostEdit_Page.jsp?pid=<%=pId%>">Edit
								Post</a> <a class="dropdown-item" href="#">Change Cover Photo</a> <a
								class="dropdown-item" onclick="deletePost(<%=pId%>)" href="#">Delete
								Post</a>

							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#"
								onclick="AddtoPostList(<%=pId%>)">Add to PostList</a>
						</div>

					</div>
					<div class="card-img"
						style="background-image: url('blogPics/<%=pPicture%>');">
						<div class="overlay">
							<div class="overlay-content">
								<a href="post_page.jsp?pid=<%=pId%>">Read More</a>
							</div>
						</div>
					</div>

					<div class="card-content">
						<a href="post_page.jsp?pid=<%=pId%>">
							<h2><%=pTitle%></h2>
							<p>Lorem ipsum dolor sit amet consectetur, lorem ipsum dolor</p>
						</a>
						<div class="row">
							<div class="col-md-4 col-4  col-sm-4  text-right"
								style="font-size: 90%;">Posted :</div>
							<div class="col-md-8 col-8  col-sm-8 text-center "
								style="font-size: 80%;">
								<%=p.getPdate().toLocaleString()%>
							</div>
						</div>
						<div class="row ">
							<div class="col-md-6 col-6  col-sm-6  ">
								<!--1 s -->
								<%
									LikedDao ld = new LikedDao(ConnectionProvider.GetConnection());
								ld.countLike(pId);
								%>
								<!-- 1 e  -->

								<!-- 2 s -->
								<%
									if (ld.isAlreadyLiked(user.getId(), pId)) {
								%>
								<a href="#" onclick="insertLike(<%=user.getId()%>,<%=pId%>)"><i
									class="fa fa-thumbs-o-up " style="color: blue;"></i> <%=ld.countLike(pId)%></a>
								<%
									} else {
								%>
								<a href="#" onclick="insertLike(<%=user.getId()%>,<%=pId%>)"><i
									class="fa fa-thumbs-o-up "></i> <%=ld.countLike(pId)%></a>
								<%
									}
								%>
								<!-- 2 e -->

							</div>


							<div class="col-md-6 col-6  col-sm-6">
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

	</div>




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
				<div class="modal-body">Select Logout below if you are ready
					to end your session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="LogoutServlet">Logout</a>
				</div>
			</div>
		</div>
	</div>




	<!-- Delete Modal-->
	<div class="modal fade" id="deleteModel" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to delete
						?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>

				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal" value="0" id="cancel-btn">Cancel</button>
					<button class="btn btn-primary" id="delete-btn" value="1">Delete</button>
				</div>
			</div>
		</div>
	</div>





	<!-- Profile And Edit Profile  Modal -->
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
							<input type="text" class="form-control" required="required"
								name="PostListName" placeholder="PostList Name">
						</div>
						<div class="form-group">
							<textarea type="text" class="form-control" rows="5"
								name="PostListDesc" placeholder="PostList Description"> </textarea>
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


	<!--Add Post to Post List Model -->

	<div class="modal fade" id="PLModel" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">

			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="CreatePostListLabel">Select a
						Postlist</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">

					<form action="" id="Add-to-post-list-form" method="post">


						<div class="form-group">

							<label style="color: black;"> <span
								class="glyphicon glyphicon-edit"></span> Select PostList <span
								style="color: red;">*</span></label> <select class="form-control"
								name="Addplid" id="Addplid" required="required">



								<%
									PostListDao pldao = new PostListDao(ConnectionProvider.GetConnection());
								ArrayList<PostList> arr = pldao.getAllPostListByWriterId(user.getId());
								for (PostList pl : arr) {
								%>
								<option value="<%=pl.getPlid()%>"><%=pl.getPlname()%></option>
								<%
									}
								%>
							</select>

						</div>


						<div class="form-group">

							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary " id="add-btn">Add</button>
							</div>

						</div>



					</form>
				</div>

			</div>
		</div>
	</div>



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

	<script src="js/js.js" type="text/javascript"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>



	<!-- particles.js lib - https://github.com/VincentGarreau/particles.js -->
	<script
		src="http://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>
	<!-- stats.js lib -->
	<script src="http://threejs.org/examples/js/libs/stats.min.js"></script>






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




	<!-- Delete Post Script -->
	<script>
function deletePost ( pid) {
	   $('#deleteModel').modal('show');
	
	let fdata ={
			
			dpid :pid		
	};
	
	$("#cancel-btn").click(function() {
		 $('#deleteModel').modal('hide');
	});
	
	$("#delete-btn").click(function() {
		 $('#deleteModel').modal('hide');
		$.ajax({
			type:"POST",
			url : "DeletePostServlet",
			data :fdata,
			success : function(data,textStatus,jqXHR) {
				
				if(data.trim() == "done"){
					swal("Deleted ");
				}
				else{
					swal("AHH!", "Something Wrong", "warning");
				}
			},
			
			error : function(jqXHR,textStatus,errorThrown) {
				//error
				console.log(data);
				
			} 
		})
	})
	
	
}
	
</script>

	<!-- insret Like -->
	<script>

function insertLike ( uid, pid) {
	
	let fdata ={
			uid :uid,
			pid :pid		
	}
	
	$.ajax({
		url : "likedServlet",
		data :fdata,
		success : function(data,textStatus,jqXHR) {
			
			if(data.trim() == "done"){
				swal("Good job!", "You Like!", "success");
			}
			else{
				swal("AHH!", "You already Like!", "warning");
			}
		},
		
		error : function(jqXHR,textStatus,errorThrown) {
			//error
			console.log(data);
			
		} 
	})
}
</script>




	<!-- Add to Postlist -->
	<script>
	
	function AddtoPostList ( pid) {
		   $('#PLModel').modal('show');
		
		
		   let fdata =null;
		
		$("#add-btn").click(function(event) {
		event.preventDefault(); 
			var plid = $("#Addplid option:selected" ).val();
			var pltxt = $("#Addplid option:selected" ).text();
			
			fdata= {pid:pid,
						plid:plid		
			};
	 		//$('#PLModel').modal('hide');
			
			$.ajax({
		 	
	 			url : "UpdatePostListServlet",
	 			data :fdata,
	 			success : function(data,textStatus,jqXHR) {
	 				
	 				if(data.trim() == "done"){
	 					swal(" Added Succesfully!", "success");
	 				}
	 				else{
	 					swal("AHH!", "Somethig Wrong!", "warning");
	 				}
	 			},
	 			
	 			error : function(jqXHR,textStatus,errorThrown) {
	 				//error
	 				console.log(data);
	 				
	 			} 
	 		})
			 
	
		})
		
		 		
		
		
	}
		
	
/* $(document).ready(function() {
	
	
	$("#Add-to-post-list-form").on("submit",function(event){
	
		
		let fdata = new FormData(this);
		$.ajax({
			url : "PostListServlet",
			type :"POST",
			data :{
				Addplid:fdata
			},
			success : function(data,textStatus,jqXHR) {
				
				if(data.trim() == "done"){
					swal( "Added to Post List!", "success");
				}
				else{
					swal("AHH!", "Could Not added", "warning");
				}
			},
			
			error : function(jqXHR,textStatus,errorThrown) {
				//error
				console.log(data);
				
			} 
		})
	})
}) */

</script>




	<!--hover Card Script -->
	<script type="text/javascript">
$(document).ready(function() {
	
	$('.card').delay(1800).queue(function(next) {
		$(this).removeClass('hover');
		$('a.hover').removeClass('hover');
		next();
	});
});
</script>


</body>
</html>