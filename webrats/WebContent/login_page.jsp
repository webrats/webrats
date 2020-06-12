<%@page import="com.webrats.entities.Message"%>
<%@page errorPage ="error_page.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/mystyle.css" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
.banner-background{
clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 64% 97%, 26% 92%, 0 100%, 0 0);
}
</style>




</head>
<body>
	<!-- navbar -->
	<%@ include file="normal_navbar.jsp"%>
	
	

	<main class="d-flex align-items-center primary-background banner-background"  style="height :80vh">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">


					<div class="card">
						<div class="card-header primary-background text-center text-white"><span class="fa fa-user-circle fa-3x"></span> Login here
						
						</div>
						
						<%
						Message msg = (Message) session.getAttribute("msg");
						if(msg != null){
							
						%>
						<div class="alert alert-danger" role="alert">
 							<%=msg.getContent() %>
						</div>
							<% 
							
							
						}
						session.removeAttribute("msg");
						
						%>
						
						<div class="card-body">
							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" class="form-control" required="required" name="user_email" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="user_password" required="required" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>
						</div>

					</div>

				</div>
			</div>
		</div>
	</main>







	<!-- javascript -->
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
	
	
	
	
	
</body>
</html>