<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>


<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/mystyl.css" rel="stylesheet" type="text/css">
<!-- clip path -->
<style>
.banner
{
clip-path: circle(94.0% at 0 51%);
}

</style>
</head>
<body>
	
	<!-- NaV BAR -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- image on left side-->
	<div class="container-fluid ml-0 pl-0">
		<div class="row">
			<div class="col-5 banner">
				<image  class="banner" src="https://source.unsplash.com/700x655/?technology,dark"
					alt=" This is the login page" class="img-fluid"> </image>
			</div>
			<div class="col-6 pt-3 mt-1 ml-4">
			<!-- Login card-->
				<div class="card">
					<div class="card-header text-center primary-background text-light" ><span class="fa fa-user-plus fa-3x"></span>
					<br>
					
					<span style=" font-weight:bold;"><h3>Register here</h3></span>
					</div>
					<div class="card-body">
					<!-- form -->
						<form id="reg-form" action="RegisterServlet" method="Post">
							<div class="form-group">
								<label for="User Name">User Name</label> 
								<input type="text"  name="user_name"class="form-control" id="UserName"
									placeholder="Enter the User Name">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email">
								<small id="emailHelp" class="form-text text-muted">We'll
									never share your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control" id="exampleInputPassword1"
									placeholder="Password">
							</div>
							<div class="form-group">
								<label>Gender</label> <br/>
								<input type="radio" name=user_gender id="male" value="male">
								<label for="Male">Male</label>
								<input type="radio"  name=user_gender id="Female" value="Female">
								<label for="Female">Female</label>
					
							</div>
							<div class="form-check">
								<input type="checkbox" name="user_check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Check me out</label>
							</div>
							 <br>
							 
							  <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                
                                
							<button id="sumbimt-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					<!--<div class="card-footer"></div>-->

				</div>

			</div>
		</div>
	</div>
	
	<!-- java script -->
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>

	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<script src="js/myjs.js" type="text/javascript"></script>

	
	 <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
 <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    console.log(form);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "RegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                           
                            console.log("aaaaaaaaaa")
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "login.jsp"
                                        });
                            
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>

</body>
</html>