
<%@page import="com.webrats.dao.LikedDao"%>
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
User pWriter = ud.getUserbyId(post.getUserId());
%>



<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title><%=post.getpTitle()%></title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- CSS Files -->
<link href="assets/css/material-kit.css?v=2.0.7" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet" href="css/mystyle.css" type="text/css">


<!-- Extra link for popover  -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>






<!-- Hover Card Css -->

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

<body class="profile-page sidebar-collapse">
	<nav
		class="navbar navbar-transparent navbar-color-on-scroll fixed-top navbar-expand-lg"
		color-on-scroll="100" id="sectionsNav">
		<div class="container">
			<div class="navbar-translate">
				<a class="navbar-brand " href="Profile_page.jsp"> <span
					class="fa fa-asterisk fa-spin"></span> WebRats
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="sr-only">Toggle navigation</span> <span
						class="navbar-toggler-icon"></span> <span
						class="navbar-toggler-icon"></span> <span
						class="navbar-toggler-icon"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="navbar-nav ml-auto">
					<li class="dropdown nav-item"><a href="Profile_page.jsp"
						class=" nav-link"> <i class="material-icons">apps</i> Home
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						target="_blank"> <i class="material-icons">unarchive</i>
							Upgrade to PRO
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="" data-placement="bottom" href="https://twitter.com"
						target="_blank" data-original-title="Follow us on Twitter"
						rel="nofollow"> <i class="fa fa-twitter"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="" data-placement="bottom" href="https://www.facebook.com"
						target="_blank" data-original-title="Like us on Facebook"
						rel="nofollow"> <i class="fa fa-facebook-square"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link" rel="tooltip"
						title="" data-placement="bottom" href="https://www.instagram.coml"
						target="_blank" data-original-title="Follow us on Instagram"
						rel="nofollow"> <i class="fa fa-instagram"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="page-header header-filter" data-parallax="true"
		style="background-image: url('assets/img/city-profile.jpg');"></div>
	<div class="main main-raised">
		<div class="profile-content">
			<div class="container">
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile">
							<div class="avatar">
								<img src="assets/img/faces/christian.jpg" alt="Circle Image"
									class="img-raised rounded-circle img-fluid">
							</div>
							<div class="name">
								<h3 class="title"><%=pWriter.getName()%></h3>
								<h6>Designer</h6>
								<a href="#pablo" class="btn btn-just-icon btn-link btn-dribbble"><i
									class="fa fa-dribbble"></i></a> <a href="#pablo"
									class="btn btn-just-icon btn-link btn-twitter"><i
									class="fa fa-twitter"></i></a> <a href="#pablo"
									class="btn btn-just-icon btn-link btn-pinterest"><i
									class="fa fa-pinterest"></i></a>
							</div>
						</div>
					</div>
				</div>
				<div class="description text-center">
					<p>
						An artist of considerable range, Chet Faker &#x2014; the name
						taken by Melbourne-raised, Brooklyn-based Nick Murphy &#x2014;<br>
						<span style="color: purple; font-weight: bold;">Email :<%=pWriter.getEmail()%></span>
						<br> <span style="color: purple; font-weight: bold;">Posted
							on : <%=post.getPdate().toLocaleString()%></span>
					</p>
				</div>
				<div class="row">
					<div class="col-md-6 ml-auto mr-auto">
						<div class="profile-tabs">
							<ul class="nav nav-pills nav-pills-icons justify-content-center"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="#studio" role="tab" data-toggle="tab"> <i
										class="material-icons">home</i> This Post
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#works"
									role="tab" data-toggle="tab"> <i class="material-icons">list</i>
										<%=pWriter.getName()%>'s All Post
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#favorite"
									role="tab" data-toggle="tab"> <i class="material-icons">playlist_play</i>
										Post List
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<hr style="margin-top: 30px; margin-buttom: 40px;">

				<div class="tab-content tab-space">
					<div class="tab-pane active " id="studio">
						<div class="row ">

							<div class="col-md-10 ml-auto  mr-auto  text-center">
								<%
									if (post.getpPicture() != null || post.getpPicture().trim() != "") {
								%>
								<img src="blogPics/<%=post.getpPicture()%>" class="img-fluid "
									style="max-height: 400px; max-width: 400px;">
								<%
									}
								%>
							</div>

							<div class="col-md-12 ml-auto  text-center"
								style="margin-top: 40px; margin-bottom: 40px;">
								<h4 class="text-primary display-3"><%=post.getpTitle()%></h4>
							</div>

							<div class="col-md-8 ml-auto  mr-auto mt-auto ">
								<%=post.getpContent()%>
							</div>

							<div class="col-md-12  like-comment">

								<hr style="margin-top: 20px; margin-bottom: 20px;">


								<%
									LikedDao ld = new LikedDao(ConnectionProvider.GetConnection());
								int totalLike = ld.countLike(post.getpId());
								%>

								<div class="text-center ">
									<button class="btn btn-primary btn-round"
										onclick="insertLike(<%=user.getId()%>,<%=post.getpId()%>)"
										id="Liked-btn">
										<i class="material-icons">favorite</i> <span><%=totalLike%></span>
										Like
									</button>



									<button class="btn btn-primary btn-round">
										<i class="material-icons">group</i><span>10</span> Comment
									</button>


								</div>



							</div>
						</div>
					</div>
					<div class="tab-pane text-center gallery" id="works">
						<div class="row">
							<%
								ArrayList<Posts> writerAllPosts = pd.getPostByWriterId(post.getUserId());

							for (Posts wPost : writerAllPosts) {
							%>

							<div class="col-lg-4 col-md-6">

								<div class="card hover">
									<div class="card-img"
										style="background-image: url('blogPics/<%=wPost.getpPicture()%>');">
										<div class="overlay">
											<div class="overlay-content">
												<a class="hover"
													href="post_page.jsp?pid=<%=wPost.getpId()%>">Read Post</a>
											</div>
										</div>
									</div>

									<div class="card-content">
										<a href="post_page.jsp?pid=<%=wPost.getpId()%>">
											<h2><%=wPost.getpTitle()%></h2>
											<p>Lorem ipsum dolor sit amet consectetur, lorem ipsum
												dolor</p>
										</a>
									</div>
									<div class="row">
										<div class="col-md-4 col-4  col-sm-4  text-right"
											style="font-size: 100%;">Posted :</div>
										<div class="col-md-8 col-8  col-sm-8 text-center "
											style="font-size: 100%;">
											<%=wPost.getPdate().toLocaleString()%>
										</div>
									</div>
									
									<div class="row ">
						<div class="col-md-6 col-6  col-sm-6 ">
						<!--1 s -->
						<%
						LikedDao ld1 = new LikedDao (ConnectionProvider.GetConnection());
						ld.countLike(wPost.getpId());
				
						%>
						<!-- 1 e  -->
						
						<!-- 2 s -->
						<%
						
						 if(ld1.isAlreadyLiked(user.getId(),wPost.getpId())){
							 
							 %>
							 <a href="#" onclick="insertLike(<%=user.getId()%>,<%=wPost.getpId()%>)"><i class="fa fa-thumbs-o-up " style="color: blue;" ></i> <%=ld.countLike(wPost.getpId()) %></a>
							 <% 
						 }
						else{
							
							%>
							 <a href="#" onclick="insertLike(<%=user.getId()%>,<%=wPost.getpId()%>)"><i class="fa fa-thumbs-o-up " ></i> <%=ld.countLike(wPost.getpId()) %></a>
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


							<%
								}
							%>

						</div>


					</div>


					<div class="tab-pane text-center gallery" id="favorite">
						<div class="row">
							<div class="col-md-3 ml-auto">
								<img src="assets/img/examples/mariya-georgieva.jpg"
									class="rounded"> <img
									src="assets/img/examples/studio-3.jpg" class="rounded">
							</div>
							<div class="col-md-3 mr-auto">
								<img src="assets/img/examples/clem-onojeghuo.jpg"
									class="rounded"> <img
									src="assets/img/examples/olu-eletu.jpg" class="rounded">
								<img src="assets/img/examples/studio-1.jpg" class="rounded">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="footer footer-default">
		<div class="container">
			<nav class="float-left">
				<ul>
					<li><a href="#"> WebRats </a></li>
					<li><a href="#"> About Us </a></li>
					<li><a href="#"> Blog </a></li>
					<li><a href="#"> Licenses </a></li>
				</ul>
			</nav>
			<div class="copyright float-right">
				&copy;
				<script>
          document.write(new Date().getFullYear())
        </script>
				, made with <i class="material-icons">favorite</i> by <a href="#"
					target="_blank">WebRats</a> for a better web.
			</div>
		</div>
	</footer>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.min.js" type="text/javascript"></script>
	<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="assets/js/core/bootstrap-material-design.min.js"
		type="text/javascript"></script>
	<script src="assets/js/plugins/moment.min.js"></script>
	<!--	Plugin for the Datepicker, full documentation here: https://github.com/Eonasdan/bootstrap-datetimepicker -->
	<script src="assets/js/plugins/bootstrap-datetimepicker.js"
		type="text/javascript"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Google Maps Plugin    -->
	<!-- Control Center for Material Kit: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/material-kit.js?v=2.0.7" type="text/javascript"></script>
	<script src="js/js.js" type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"
		type="text/javascript"></script>




	<!-- Hover Card Js  -->

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