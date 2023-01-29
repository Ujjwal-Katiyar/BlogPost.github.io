

<%
User user = null;
HttpSession hs = request.getSession();
user = (User) hs.getAttribute("currentUser");
System.out.println("fiest" + user);

if (user == null) {
	System.out.println("fiest1" + user);
	response.sendRedirect("LogoutServlet");
	System.out.println("fiest2" + user);
	return;
}
System.out.print("fiest3" + user);
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page
	import="com.tech.blog.dao.*,com.tech.blog.helper.*,java.util.*,com.tech.blog.entities.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
					data-toggle="modal" data-target="#model-profile"> <span>
							<!-- 	class="fa fa-user-circle"> --> <img
							src="profile_Image/<%=user.getProfile()%>" class="img-fluid"
							alt="profile image" class="img-fluid"
							style="height: 25px; width: 25px; border-radius: 90%;">
					</span> <%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-address-book-o"></span> Logout</a></li>

			</ul>
		</div>
	</nav>



	<!-- End of nav bar	 -->

	<!-- End of NavBar -->
	<!-- Model -->
	<!-- Button trigger modal -->
	<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button> -->

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

	<!-- Body -->
	<%
	PostDao p = null;
	int id = Integer.parseInt(request.getParameter("id"));
	p = new PostDao(ConnectionProvider.getConnection());
	Post post = p.getPostById(id);
	%>

	<div class="container">
		<div class="col-md-8 mt-2 mr-3  offset-2  "
			style="border-style: solid; border-width: 5px; border-color: #ffa900">
			<img class="card-img-top pt-2" style="height: 200px;"
				src="Post_Image/<%=post.getpPic()%>" alt="Card image cap">
			<div class="card">

				<div class="card-body" style="height: 200px;">
					<div class="row">
						<div class="col-6"
							style="font-weight: 600; font-size: 25px; font-family: ui-serif; color: #67a316">
							<%
							UserDao ud = new UserDao(ConnectionProvider.getConnection());
							User postUser = ud.getUserById(post.getUserId());
							%>
							Posted By:
							<p style="display: inline; color: #730d33">

								<%=postUser.getName()%>
							</p>
						</div>
						<div class="col-6"
							style="font-weight: 600; font-size: 25px; font-family: ui-serif; color: #67a316">
							Time:
							<p style="display: inline; color: #730d33"><%=post.getpDate().toString()%>
							</p>

						</div>

					</div>
					<b><h2><%=post.getpTitle()%></h2></b>
					<p><%=post.getpContent()%></p>
					<br>
					<p><%=post.getpCode()%></p>

				</div>
				<div class="card-footer mb-2 bg-warning ">

					<div>

						<%
						LikesDao ld = new LikesDao(ConnectionProvider.getConnection());
						int like = ld.countLikes(post.getPid());
						boolean islike = ld.isLikedByUser(post.getPid(), user.getId());
						String i_name="like-tog-"+post.getPid();
						System.out.print(i_name);
						if (islike) {
						%>
						<a href="#"
							onclick="doLike(<%=post.getPid()%>,<%=user.getId()%>)"
							class="btn btn-danger" id=<%=i_name %>><i class="fa fa-thumbs-o-up"
							id="like-button-<%=post.getPid()%>"><%=like%></i> </a>
						<%
						} 
						else {
						%>
						<a href="#"
							onclick="doLike(<%=post.getPid()%>,<%=user.getId()%>)"
							class="btn btn-primary" id=<%=i_name %>><i class="fa fa-thumbs-o-up"
							id="like-button-<%=post.getPid()%>"><%=like%></i> </a>
						<%
						}
						%>
						<a href="#" class="btn btn-primary"><span
							class="fa fa-comments"></span>10</a>
						<%
						if (user.getId() == post.getUserId()) {
						%>
						<a href="PostDeleteServlet?id=<%=post.getPid()%>"
							class="btn btn-danger pull-right">DeletePost</a>
						<%
						}
						%>



					</div>

				</div>
			</div>
		</div>

	</div>

	<!-- End of main body -->


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
		function getPost(catId, temp) {

			$('#loader').show();
			$("#post-container").hide();
			$(".c-link").removeClass("active");
			/* alert("Loading"); */
			$.ajax({
				data : {
					cid : catId
				},
				url : "Load_Post.jsp",
				success : function(data, textStatus, jqXHR) {
					//console.log(data);
					$("#loader").hide();
					$("#post-container").show();
					$('#post-container').html(data);
					$(temp).addClass('active')
				}

			})
		}
		$(document).ready(function(e) {
			let allPostRef = $(".c-link")[0];
			getPost(0, allPostRef);

		})
	</script>

</body>
</html>