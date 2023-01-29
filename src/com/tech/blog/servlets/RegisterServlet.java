package com.tech.blog.servlets;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//fetch all the data from the register servlet
		String check=request.getParameter("user_check");
		if(check==null)
		{
		System.out.println("Error in check box");	
		}
		else
		{
		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		String gender = request.getParameter("user_gender");
		User s=new User(name,email,password,gender);
		Connection con=ConnectionProvider.getConnection();
		UserDao ud= new UserDao(con);
		if(ud.saveUser(s))
		{
			System.out.println(name+" data is inserted");
		}
		else
		{
			System.out.println("Error");
		}
		}
		
	}

}
