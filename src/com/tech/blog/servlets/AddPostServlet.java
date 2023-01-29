package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class AddPostServlet
 */
@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		int cId=Integer.parseInt(request.getParameter("pCid"));
	String pTitle = request.getParameter("pTitle");
	String pContent = request.getParameter("pContent");
	String pCode = request.getParameter("pCode");
	Part  pPic = request.getPart("pPic");
	String pic_Name=pPic.getSubmittedFileName();
	HttpSession hs=request.getSession();
	User user=(User)hs.getAttribute("currentUser");
	int userId=user.getId();
	Post p=new Post(pTitle,pContent,pCode,pic_Name,null,cId,userId); 
	UserDao us=new UserDao(ConnectionProvider.getConnection());
	System.out.println("first");
	boolean result=us.savePost(p);
	if(result==true)
	{
		System.out.println("Sucess  save post ");
		@SuppressWarnings("deprecation")
		String path = request.getRealPath("/") + "Post_Image" + File.separator + pic_Name;
		
		if (Helper.saveFile(pPic.getInputStream(), path)) {
			System.out.println("file updated to db");
			out.print("sucess");
		}
		else
		{
			System.out.println("File is not updated to db");
			out.print("NotSucess");
		}
	}else
	{
		System.out.println("NOt Updated  save post ");
		out.print("NotSucess");
	}
	
	
	
	
	}

}
