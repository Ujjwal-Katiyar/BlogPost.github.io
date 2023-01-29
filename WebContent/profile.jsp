<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.tech.blog.entities.User,com.tech.blog.dao.*"
	errorPage="error_page.jsp"%>
<%@ page
	import="com.tech.blog.entities.Message,com.tech.blog.entities.Categories,com.tech.blog.helper.ConnectionProvider"%>
<%@ page import="com.tech.blog.dao.UserDao,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>profile jsp</title>

<!-- css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="css/mystyl.css" rel="stylesheet" type="text/css">

</head>
<body class="primary-background-image">

	<%-- 	<%="Thsi is the profile page"%> --%>
	<%
	HttpSession hs = request.getSession();
	User user = (User) hs.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("LogoutServlet");
	}
	String name = user.getName();
	%>
	<%-- <%="The  name of the user is " + name%> --%>




	<!-- navbar -->

	<nav id="nav-bar"
		class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span>Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">LearnCode
						with Ujjwal <span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">

						<%
						UserDao ud1 = new UserDao(ConnectionProvider.getConnection());
						ArrayList<Categories> al = ud1.getCategories();
						for (Categories c : al) {
						%>

						<a class="dropdown-item" href="#"><%=c.getName()%></a>
						<%
						}
						%>

					</div> <!-- <div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					--></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-address-book-o"></span> Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#model-post"><span
						class="fa fa-upload"></span> Do Post</a></li>
			</ul>
			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#model-profile"> <span class="fa fa-user-circle"> </spam> <img
							src="profile_Image/<%=user.getProfile()%>" class="img-fluid"
							alt="profile image" class="img-fluid"
							style="height: 25px; width: 25px; border-radius: 90%;">
					</span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-address-book-o"></span> Logout</a></li>

			</ul>
		</div>
	</nav>

	<!-- End of NavBar -->
	<!-- Model -->
	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

	<!-- 	Alert for sucess update -->

	<%
	HttpSession s = request.getSession();
	Message msg = (Message) s.getAttribute("message");
	if (msg != null) {
	%>
	<div class="alert  <%=msg.getCssClass()%> " role="alert">
		<%=msg.getContent()%>
	</div>
	<%
	s.removeAttribute("message");
	}
	%>

	<!-- end of alert -->


	<!-- Modal -->
	<div class="modal fade" id="model-profile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-center text-light">
					<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center ">


						<img src="profile_Image/<%=user.getProfile()%>"
							alt="profile image" style="height: 100px; border-radius: 90%;">

						<h5 class="modal-title" id="exampleModalLabel"><%=user.getName()%></h5>

					</div>
					<!-- 	Profile  detail table   -->
					<div id="profile-details">

						<table class="table table-bordered">

							<tbody>
								<tr>
									<th scope="row">Id:</th>
									<td><%=user.getId()%></td>

								</tr>
								<tr>
									<th scope="row">Name:</th>
									<td><%=user.getName()%></td>

								</tr>
								<tr>
									<th scope="row">Email:</th>
									<td colspan="2"><%=user.getEmail()%></td>

								</tr>

								<tr>
									<th scope="row">Gender:</th>
									<td colspan="2"><%=user.getGender()%></td>

								</tr>

								<tr>
									<th scope="row">Ragistered On:</th>
									<td colspan="2"><%=user.getDateTime()%></td>

								</tr>
							</tbody>
						</table>
					</div>

					<!-- Profile  Edit -->

					<div id="profile-edit" style="display: none">
						<!--  style="display: none; -->

						<h3 style="text-align: center">Edit Your Details</h3>
						<div>
							<!-- 	Edit profile detail form  -->
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>Id:</td>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control"
											name="user_name" value=<%=user.getName()%>></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control"
											name="user_email" value=<%=user.getEmail()%>></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="Password" class="form-control"
											name="user_password" value=<%=user.getPassword()%>></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>Picture:</td>
										<td><input type="file" name="user_image"
											class="form-control"></td>
									</tr>
								</table>
								<div class="container text-center">
									<button type="submit" class="btn btn-outline-danger">Save</button>
								</div>
							</form>
						</div>

					</div>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- End of  editModel -->
	<!-- main body of the page  -->

	<main>


		<div class="container-fluid">
			<div class="row">
				<!-- page diveideed into two coloum
first coloum -->
				<div class="col-3 mt-4 pl-0">
					<div class="list-group">
						<a href="#" onclick="getPost(0,this)"
							class=" c-link list-group-item list-group-item-action active">All
							Categories</a>

						<%
						UserDao udListgroup = new UserDao(ConnectionProvider.getConnection());
						ArrayList<Categories> alListgroup = udListgroup.getCategories();
						for (Categories cListgroup : alListgroup) {
						%>
						<a href="#" onclick="getPost(<%=cListgroup.getCid()%>,this)"
							class=" c-link list-group-item list-group-item-action"><%=cListgroup.getName()%></a>
						<%
						}
						%>

					</div>
				</div>
				<!-- second coloum -->
				<div class="col-9">

					<!-- Display all the post -->
					<div class="container text-center mt-2" id="loader">
						<i class="fa fa-refresh fa-spin fa-3x"></i>
						<h3>Loading...</h3>

					</div>
					<div class="contoner-fluid  offset-1" id="post-container"></div>
				</div>
			</div>

		</div>
		</div>


		</div>
	</main>

	<!-- End of the main body of the page  -->






	<!-- Start of post model  -->


	<!-- Modal -->
	<div class="modal fade" id="model-post" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center primary-background text-light ">

					<h5 class="modal-title " id="exampleModalLabel">Enter the post
						details...</h5>
					<button type="button" class="close text-light" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="post-form">
						<div class="form-group">
							<select class="form-control" name="pCid">
								<option selected disabled>--Select the category--</option>
								<%
								UserDao us = new UserDao(ConnectionProvider.getConnection());
								ArrayList<Categories> cat = us.getCategories();
								for (Categories c : cat) {
								%>

								<option value=<%=c.getCid()%>><%=c.getName()%></option>
								<%
								}
								%>
							</select>



						</div>
						<div class="form-group">
							<input name="pTitle" type="text" placeholder="Enter post Title"
								class="form-control">
						</div>
						<div class="form-group">
							<textarea name="pContent"
								placeholder="Enter the Content of the post" class="form-control"
								style="height: 150px"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode"
								placeholder="Enter the Program of post(Optional)"
								class="form-control" style="height: 100px"></textarea>
						</div>
						<div class="form-group">
							<label>Uplode the picture</label> <br> <input type="file"
								name="pPic">
						</div>
						<div class="text-center">
							<button name="pSubmit" type="submit" class="btn btn-danger">Submit</button>

						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


	<!-- End of uplode model -->






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
	<script src="js/myjs1.js" type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			/* alert("Thesting") */
			let editStatus = false;
			$('#edit-profile-btn').click(function() {
				/* alert("click") */

				if (editStatus == false) {
					/* alert("if"); */
					$("#profile-details").hide();
					$("#profile-edit").show();

					$(this).text("Back")
					editStatus = true;
				} else {
					/* alert("else"); */
					$("#profile-details").show();
					$("#profile-edit").hide();
					$(this).text("Edit")
					editStatus = false;
				}

			})

		});
	</script>

	<!-- End OF java Script -->
	<!-- Script for the sweet alert  -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- add post java Script -->

	<script>
		$(document)
				.ready(
						function() {

							/* 	alert("This is the alert box in the name of the"); */
							$("#post-form")
									.on(
											"submit",
											function(event) {
												event.preventDefault();
												let form = new FormData(this);
												//now requestig to server
												console
														.log("requestingto server");
												$
														.ajax({
															url : "AddPostServlet",
															type : 'post',
															data : form,

															//incase of sucess
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																//success
																console
																		.log(data);
																swal(
																		"Post Submited Sucessfully",
																		"You clicked the button!",
																		"success");

															},
															error : function(
																	data,
																	textStatus,
																	errorThrown) {
																//error..
																swal(
																		"Plese try again",
																		"Error is :"
																				+ exception,
																		"success");
															},
															processData : false,
															contentType : false

														})
											})
						})
	</script>

	<!-- End of post java script -->
	<script>
	
	function getPost(catId, temp)
	{
		
	
		$('#loader').show();
		$("#post-container").hide();
		$(".c-link").removeClass("active");
		/* alert("Loading"); */
		$.ajax({
			data:{cid:catId},
			url : "Load_Post.jsp",
			success : function(data, textStatus, jqXHR) {
				console.log(data); 
				$("#loader").hide();
				$("#post-container").show();
				$('#post-container').html(data);
				$(temp).addClass('active')
			}

		})
	}
		$(document).ready(function(e) {
let allPostRef=$(".c-link")[0];
			getPost(0,allPostRef);

		})
	</script>



</body>
</html>