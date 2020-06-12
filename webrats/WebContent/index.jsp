
<%@page import="com.webrats.helper.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>WebRats</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 64% 97%, 26% 92%, 0 100%, 0 0);
}

.primary-background {
	background: #2196f3;
}

</style>



<!-- Hover Card css -->


<style type="text/css">

.card {
	width: 300px;
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


<style type="text/css">
.jumbotron {
	background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
	background-size: 400% 400%;
	animation: gradient 15s ease infinite;
}

@keyframes gradient {
	0% {
		background-position: 0% 50%;
	}
	50% {
		background-position: 100% 50%;
	}
	100% {
		background-position: 0% 50%;
	}
}
</style>

</head>
<body>





<!-- navbar -->
<%@ include file="normal_navbar.jsp" %>

<!-- banner -->

<div class="container-fluid p-0 m-0  ">

	<div class="jumbotron primary-background banner-background">
			<div class="container text-light">
		
			<h3 class="display-2"> Welcome to Webrats</h3>
			<p>Welcome to webrats the world of technology</p>
			<p>A programming language is a formal language comprising a set of instructions that produce various kinds of output.
		 	Programming languages are used in computer programming to implement algorithms.
			Most programming languages consist of instructions for computers. 
			There are programmable machines that use a set of specific instructions, rather than general programming languages.
			</p>
			
			<button class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span> Start ! it's Free</button>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="	fa fa-sign-in"></span> Login</a>
		</div>
	</div>

</div>

<div class="container">
	<div class="row mb-2">
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white" >Read more</a>
  			</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white">Read more</a>
  			</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white">Read more</a>
  			</div>
			</div>
		</div>
	
	</div>
	<div class="row ">
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white">Read more</a>
  			</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white">Read more</a>
  			</div>
			</div>
		</div>
		<div class="col-md-4">
			<div class="card" >
  			<div class="card-body">
    		<h5 class="card-title">Java Programming</h5>
    		<p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    		<a href="#" class="btn primary-background text-white">Read more</a>
  			</div>
			</div>
		</div>
	
	</div>

</div>

<!-- javascript -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>