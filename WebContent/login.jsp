<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error_page.jsp"%>
<%@ page import="com.tech.blog.entities.Message" %>
<%@ page isELIgnored="false" %>
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

<!-- Clip path -->
<style>
.banner {
	clip-path: circle(94.0% at 0 51%);
}
</style>

</head>
<body>
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


	<!-- NaV BAR -->
	<%@ include file="normal_navbar.jsp"%>

	<!-- image on left side-->
	<div class="container-fluid ml-0 pl-0 ">
			<div class="row">
			<div class="col-md-5 col-2 banner">
				<image  class="banner" src="https://source.unsplash.com/700x655/?technology,dark"
					alt=" This is the login page" class="img-fluid"> </image>
			</div>
			<div class="col-6 pt-3 mt-1 ml-4">
				<!-- Login card-->
				<div class="card">
					<div class="card-header text-center primary-background text-light">
						<span class="fa fa-user-circle-o fa-3x"></span>
						<h3>Login here</h3>
					</div>
					<!-- Altert if login is wrong -->

					<%  HttpSession s = request.getSession();
						Message msg=(Message)s.getAttribute("message");
						if(msg!=null)
						{
					%>
					<div class="alert <%=msg.getCssClass() %>">
						<%=msg.getContent() %>
					</div>
					<%
					  s.removeAttribute("message");
						}
					%>




					<div class="card-body">
						<form action="LoginServlet" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="user_email" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="user_password" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					<!--<div class="card-footer"></div>-->

				</div>

			</div>
		</div>
	</div>

</body>
</html>