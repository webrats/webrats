<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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


<style type="text/css">



.HtoPbtn:active {
  -webkit-animation: animation 750ms linear 1000ms both;
  animation: animation 750ms linear infinite both;
}

/* Generated with Bounce.js. Edit at http://bouncejs.com#%7Bl%3A1%2Cs%3A%5B%7BT%3A%22k%22%2Ce%3A%22s%22%2Cd%3A750%2CD%3A0%2Cf%3A%7Bx%3A0%2Cy%3A0%7D%2Ct%3A%7Bx%3A40%2Cy%3A60%7D%2Cs%3A3%2Cb%3A4%7D%2C%7BT%3A%22c%22%2Ce%3A%22b%22%2Cd%3A750%2CD%3A0%2Cf%3A%7Bx%3A1%2Cy%3A1%7D%2Ct%3A%7Bx%3A2%2Cy%3A2%7D%2Cs%3A2%2Cb%3A4%7D%5D%7D */

@-webkit-keyframes animation { 
  0% { -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  3.2% { -webkit-transform: matrix3d(1.345, 0.383, 0, 0, 0.252, 1.345, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.345, 0.383, 0, 0, 0.252, 1.345, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.5% { -webkit-transform: matrix3d(1.485, 0.5, 0, 0, 0.326, 1.485, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.485, 0.5, 0, 0, 0.326, 1.485, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  6.41% { -webkit-transform: matrix3d(1.673, 0.603, 0, 0, 0.393, 1.673, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.673, 0.603, 0, 0, 0.393, 1.673, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  9.01% { -webkit-transform: matrix3d(1.88, 0.616, 0, 0, 0.403, 1.88, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.88, 0.616, 0, 0, 0.403, 1.88, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.71% { -webkit-transform: matrix3d(2.064, 0.467, 0, 0, 0.308, 2.064, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.064, 0.467, 0, 0, 0.308, 2.064, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  13.51% { -webkit-transform: matrix3d(2.087, 0.424, 0, 0, 0.28, 2.087, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.087, 0.424, 0, 0, 0.28, 2.087, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  17.92% { -webkit-transform: matrix3d(2.139, 0.197, 0, 0, 0.131, 2.139, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.139, 0.197, 0, 0, 0.131, 2.139, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.92% { -webkit-transform: matrix3d(2.137, 0.155, 0, 0, 0.103, 2.137, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.137, 0.155, 0, 0, 0.103, 2.137, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  25.23% { -webkit-transform: matrix3d(2.075, -0.003, 0, 0, -0.002, 2.075, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.075, -0.003, 0, 0, -0.002, 2.075, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  29.03% { -webkit-transform: matrix3d(2.032, -0.03, 0, 0, -0.02, 2.032, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.032, -0.03, 0, 0, -0.02, 2.032, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  31.43% { -webkit-transform: matrix3d(2.012, -0.033, 0, 0, -0.022, 2.012, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.012, -0.033, 0, 0, -0.022, 2.012, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  34.63% { -webkit-transform: matrix3d(1.994, -0.029, 0, 0, -0.019, 1.994, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.994, -0.029, 0, 0, -0.019, 1.994, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  40.14% { -webkit-transform: matrix3d(1.985, -0.015, 0, 0, -0.01, 1.985, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.985, -0.015, 0, 0, -0.01, 1.985, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  56.46% { -webkit-transform: matrix3d(2, 0.002, 0, 0, 0.001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0.002, 0, 0, 0.001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  62.36% { -webkit-transform: matrix3d(2.002, 0.001, 0, 0, 0.001, 2.002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.002, 0.001, 0, 0, 0.001, 2.002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  81.48% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  84.68% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); } 
}

@keyframes animation { 
  0% { -webkit-transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  3.2% { -webkit-transform: matrix3d(1.345, 0.383, 0, 0, 0.252, 1.345, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.345, 0.383, 0, 0, 0.252, 1.345, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.5% { -webkit-transform: matrix3d(1.485, 0.5, 0, 0, 0.326, 1.485, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.485, 0.5, 0, 0, 0.326, 1.485, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  6.41% { -webkit-transform: matrix3d(1.673, 0.603, 0, 0, 0.393, 1.673, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.673, 0.603, 0, 0, 0.393, 1.673, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  9.01% { -webkit-transform: matrix3d(1.88, 0.616, 0, 0, 0.403, 1.88, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.88, 0.616, 0, 0, 0.403, 1.88, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  12.71% { -webkit-transform: matrix3d(2.064, 0.467, 0, 0, 0.308, 2.064, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.064, 0.467, 0, 0, 0.308, 2.064, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  13.51% { -webkit-transform: matrix3d(2.087, 0.424, 0, 0, 0.28, 2.087, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.087, 0.424, 0, 0, 0.28, 2.087, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  17.92% { -webkit-transform: matrix3d(2.139, 0.197, 0, 0, 0.131, 2.139, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.139, 0.197, 0, 0, 0.131, 2.139, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.92% { -webkit-transform: matrix3d(2.137, 0.155, 0, 0, 0.103, 2.137, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.137, 0.155, 0, 0, 0.103, 2.137, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  25.23% { -webkit-transform: matrix3d(2.075, -0.003, 0, 0, -0.002, 2.075, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.075, -0.003, 0, 0, -0.002, 2.075, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  29.03% { -webkit-transform: matrix3d(2.032, -0.03, 0, 0, -0.02, 2.032, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.032, -0.03, 0, 0, -0.02, 2.032, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  31.43% { -webkit-transform: matrix3d(2.012, -0.033, 0, 0, -0.022, 2.012, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.012, -0.033, 0, 0, -0.022, 2.012, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  34.63% { -webkit-transform: matrix3d(1.994, -0.029, 0, 0, -0.019, 1.994, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.994, -0.029, 0, 0, -0.019, 1.994, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  40.14% { -webkit-transform: matrix3d(1.985, -0.015, 0, 0, -0.01, 1.985, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(1.985, -0.015, 0, 0, -0.01, 1.985, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  56.46% { -webkit-transform: matrix3d(2, 0.002, 0, 0, 0.001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0.002, 0, 0, 0.001, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  62.36% { -webkit-transform: matrix3d(2.002, 0.001, 0, 0, 0.001, 2.002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2.002, 0.001, 0, 0, 0.001, 2.002, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  81.48% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  84.68% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% { -webkit-transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); transform: matrix3d(2, 0, 0, 0, 0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); } 
}

body {
  margin: 0;
}
#particles-js {
  position: absolute;
  height: 100%;
  width: 100%;
}
</style>





</head>



<body >

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
						</a> 
						<a class="dropdown-item" href="test.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> My Posts
						</a>
						 <a class="dropdown-item" href="#" data-toggle="modal"
							data-target="#CreatePostList"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> Create
							Post List
						</a> 
						<a class="dropdown-item" href="Postlist_Page.jsp"> <i
							class="fa fa-edit fa-sm fa-fw mr-2 text-gray-400"></i> My Post
							List
						</a><a class="dropdown-item" href="#"> <i
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



	




	<div class="container-fluid text-center" >
		<div class="row ">
			<div class="col-sm-2 sidenav"></div>
			<div class="col-sm-8 text-left mt-4" style="background-color: white;">
				<div class="container text-center">
				<button class="btn btn-danger btn-lg HtoPbtn " data-toggle="collapse" data-target="#demo">How
					to Post</button>
				</div>
				<br>
				
				<div class="container">
				<div class="box">
				<div class="content">
						<div id="demo" class="collapse" style="text-align: left; font-size: 120%; color: black;">
						<h3 style="text-align:center;">How To Post</h3>
						<p >
						
					Step 1: Select a Category of your Post .<br> <br> Step 2:
					Give a attractive Title of your Post .<br> <br> Step 3:
					Upload a Squire Size Cover Picture .<br> <br> Step 4:
					Write a description of your post .<br> <br> NOTE: You can
					style your content with the help of text editor <br>and also
					you can upload image in the description section also .<br> <br>
					Step 5:After complete your writing you have to CLICK
					<mark style="background: yellow;">Generate Code</mark>
					button . <br> <br> Step 6: At last your have to click
					<mark style="background: yellow;">Submit </mark>
					button for submit your post.

				</p>
				</div>
				</div>
				
				</div>
				</div>
				<hr>

				<form action="AddPostServlet" id="add-post-form" method="post"
					enctype="multipart/form-data">

					<div class="form-group">
						<label style="color: black;"> <span
							class="glyphicon glyphicon-edit"></span> Select Category <span
							style="color: red;">*</span></label> <select class="form-control"
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

					<div class="form-group">
						<label style="color: black;"> <span
							class="glyphicon glyphicon-edit"></span> Post Title <span
							style="color: red;">*</span></label> <input type="text"
							required="required" class="form-control" name="pTitle"
							placeholder="Title of your Post">
					</div>

						<div class="form-group">
						<label style="color: black;"> <span class="glyphicon glyphicon-picture"></span>
							Upload Cover Picture For your Post <span style="color: red;">*</span></label>
						<input type="file" required="required" class="form-control" name="pPicture">
					</div>



					<div class="form-group " style="padding-top: 20px;">


						<label class="form-control"><span
							class="glyphicon glyphicon-edit"></span> Write Description <span
							style="color: red;">*</span></label>


						<div id="summernote" ></div>


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
						<button type="submit" class="btn btn-primary HtoPbtn" id="sub-btn">
							<span class="glyphicon glyphicon-globe fa-spin"></span> Submit
							Post
						</button>
					</div>
				</form>




				<!--End of Post Form  -->
			</div>

			<div class="col-sm-2 sidenav"></div>

		</div>


	</div>

	<!--  Summer note script-->
	<script>
      $('#summernote').summernote({
        placeholder: 'Hello Bootstrap 4',
        tabsize: 2,
        height: 400
      });
    </script>

	<!-- Submit btn and Gen btn toggling  -->
	<script type="text/javascript">
		$(document).ready(function() {
			
			$("#sub-btn").hide()
			

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
				
			},
			
			error : function(jqXHR,textStatus,errorThrown) {
				//error		},
			
			processData:false,
			contentType:false
			
		
		})
		
	})
	
})

</script>



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



  <script src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js" type="text/javascript"></script>
  
 
</body>
</html>
