<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>


<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 64% 97%, 26% 92%, 0 100%, 0 0);
}

.primary-background {
	background: #2196f3;
}

</style>




<style type="text/css">

.card {
	
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

	<%@ include file="normal_navbar.jsp"%>

	<main class="primary-background  banner-background "
		style="padding-bottom: 100px; padding-top: 20px;">
		<div class="container  ">
			<div class="row">
				<div class="col-md-6 offset-md-3">


					<div class="card">

						<div class="card-header primary-background text-white text-center">
							<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i> <br>
							Register Here
						</div>



						<div class="card-body">

							<form id="reg-form" action="RegisterServlet" method="post">
								<div class="form-group">
									<label for="user_name">User Name</label> <input type="text"
										class="form-control" required="required" name="user_name" id=""
										 placeholder="User Name"><br>
								</div>

								<div class="form-group">
									<label for="exampleInputEmail">Email address</label> <input
										type="email" class="form-control" required="required" name="user_email" id=""
										aria-describedby="emailHelpId" placeholder="Email id">
									<small id="emailHelpId" class="form-text text-muted">example@mail.com</small>
									<br>
								</div>

								<div class="form-group">
									<label for="user_password">Password</label> <input type="password"
										class="form-control" required="required" name="user_password" id=""
										placeholder="password">
								</div>

								<div class="form-group">
									<label class="genderLabel">Select Gender </label> <br> <input
										type="radio" class="radio" name="gender" id="" value="male"
										checked> Male <br> <input type="radio"
										class="radio" name="gender" id="" value="female" unchecked>Female
									<br>

								</div>
								
								<div class="form-group">
									<label class="aboutLabel">About Yourself </label>
									<textarea class="about" name="user_about" rows="5" cols="60" placeholder="Hey i am a programmer ."></textarea>
								
								</div>

								<div class="form-check text-center">
									<label class="form-check-label"> <input type="checkbox"
										class="form-check-input" name="check" id="" value="check" unchecked>
										Agree terms and conditions
									</label>
								</div>

								<br>
								<div class="container text-center"  id="loader" style="display: none;">
								<span class="fa fa-refresh fa-spin fa-3x"></span>
								<h4>Please wait ...</h4>
								
								</div>
								<button type="submit" id="submit-btn" class="btn btn-primary ">Submit</button>
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
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script >
	$(document).ready(function(){
        console.log("Loded.....")

        $('#reg-form').on("submit",function(event){
				event.preventDefault();
            let form = new FormData(this);
            
            $("#submit-btn").hide();
            $("#loader").show();
            

            //send register servlet

            $.ajax({
                url:"RegisterServlet",
                type:'POST',
                data:form,
                success : function(data,textStatus,jqXHR){
                	
                	if(data.trim()==='done'){
                		console.log(data);
                		swal("Register Succesful .. We are redirect to login Page")
                    	.then((value) => {
                    	  window.location ="login_page.jsp";
                    	});
                	}
                	
                	else if(data.trim()==='checknull'){
                		swal("Please check Terms and Condition .")

                		$("#submit-btn").show();
    		            $("#loader").hide();
                    	
                	}
                	
                	else{
                		
                    		swal("Email Already Exist");

                    		$("#submit-btn").show();
        		            $("#loader").hide();
            		
                	}
                	
                
                },
				error : function(jqXHR,textStatus,errorThrown){
					swal("something went wrong !! Try agian.")
					.then((value) => {
					  swal(`The returned value is: ${data}`);
					});
					$("#submit-btn").show();
		            $("#loader").hide();

				},
				processData: false,
				contentType :false

            });

        });
    });
	</script>

</body>
</html>