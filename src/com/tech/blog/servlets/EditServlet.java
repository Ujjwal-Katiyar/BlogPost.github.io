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
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("user_name");
		String email = request.getParameter("user_email");
		String password = request.getParameter("user_password");
		Part part = request.getPart("user_image");
		System.out.println(part);
		String imagename = part.getSubmittedFileName();

		// Fetch the old data of the user from the session

		HttpSession hs = request.getSession();
		User user = (User) hs.getAttribute("currentUser");
		//Get the path of old profie
		String old_imagename=user.getProfile();
		String old_path = request.getRealPath("/") + "profile_Image" + File.separator + user.getProfile();
		
		//use old_imagenam or old_path
		//
		//Set the data to the user object 
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setProfile(imagename);
		//
		
		// update database
		UserDao dao = new UserDao(ConnectionProvider.getConnection());
		boolean result = dao.updateUser(user);
		System.out.println("Edit servlet for updateUser"+result);
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if (result == true) {
			out.print("update to databse");
			String path = request.getRealPath("/") + "profile_Image" + File.separator + user.getProfile();
			if(!old_imagename.equals("default.png"))
			Helper.deleteFile(old_path);

			if (Helper.saveFile(part.getInputStream(), path)) {
				out.print("file updated to db");
				
				HttpSession hs1=request.getSession();
				Message msg=new Message("Edit Sucessfully","Edit message","alert-success");
				hs1.setAttribute("message", msg);
				response.sendRedirect("profile.jsp");
				
				
				
			} else {
				out.print("image not uploded");
			}

		} else {
			out.print("NotSucess");
		}
	}


}
