package com.tech.blog.servlets;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		//get Connection 
		UserDao dao= new UserDao( ConnectionProvider.getConnection());
		User user=dao.getUserByEmailAndPassword(email, password);
		 
		if(user==null)
		{
			//login error.............
			System.out.println("Not sucess");
			out.print("not sucess"); 
			Message ms =new Message("Invalid Message Plese enter the correct User Name and Password"," alert","alert-danger" );
			
			HttpSession s=request.getSession(); 
			s.setAttribute("message", ms);
			response.sendRedirect("login.jsp");
		}else
		{
			// login......................
			System.out.println("sucess");
			//RequestDispatcher rd=request.getRequestDispatcher("testlogin");
//			request.setAttribute("name", user);
//			response.sendRedirect("testlogin");
		//s	rd.forward(request, response);
//			
		HttpSession s=request.getSession(); 
		s.setAttribute("currentUser", user);
		response.sendRedirect("profile.jsp");
//			 
		}
		
		
	
		
		
	}

}
