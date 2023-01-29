
<%@ page
	import="com.tech.blog.dao.*,com.tech.blog.helper.*,com.tech.blog.entities.*,java.util.*"%>
<script>
	console.log("this is the load post")
	<script src="js/myjs1.js" type="text/javascript"></script>
</script>


	<%
	HttpSession hs = request.getSession();
	User user = (User) hs.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("LogoutServlet");
	}
	String name = user.getName();
	%>
<div class="row mt-3">
	<%
	PostDao p = new PostDao(ConnectionProvider.getConnection());
	Thread.sleep(100);
	ArrayList<Post> al = null;
	int cid = Integer.parseInt(request.getParameter("cid"));
	if (cid == 0) {
		al = p.getAllPost();
	} else {
		al = p.getPostByCatId(cid);
	}
	if (al.size() == 0) {
		out.println("<div class='text-center'><h2><center>No post in the Cagegories</center><h2></div>");
		return;
	}
	for (Post post : al) {
	%>
	<div class="col-md-5 mt-2 mr-3   " style=" border-style: solid; border-width: 5px;border-color:#ffa900">
		<img class="card-img-top pt-2" style="height:200px;" src="Post_Image/<%=post.getpPic()%>"
			alt="Card image cap">
		<div class="card">

			<div class="card-body" style="height:200px;">

				<b><%=post.getpTitle()%></b>
				<p  ><%=post.getpContent()%></p>

			</div>
			<div class="card-footer mb-2 bg-warning ">

				<div>
			<!-- 	likes execution code -->
			
				
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
					<a href="#"class="btn btn-primary"><span class="fa fa-comments"></span>10</a>
					<a href="show_blog_post.jsp?id=<%=post.getPid() %>" class="btn btn-danger pull-right">View More</a>
				</div>


			</div>

		</div>
	</div>

	<%
	}
	%>
</div>




