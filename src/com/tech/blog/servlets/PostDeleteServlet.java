package com.tech.blog.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Message;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class PostDeleteServlet
 */
@WebServlet("/PostDeleteServlet")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id=Integer.parseInt(request.getParameter("id"));
		System.out.println(id);
		PostDao pd=new PostDao(ConnectionProvider.getConnection());
		if(pd.deletePostById(id))
		{
			HttpSession ht=request.getSession();
			Message msg=new Message("Post Deleted Sucessfully","delete","alert alert-success");
			ht.setAttribute("message",msg);
			response.sendRedirect("profile.jsp");
		}
		else
		{
			System.out.println("Erroe in deleting post");
		}
		
	}


	}


