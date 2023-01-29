package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.LikesDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class LikeServlet
 */
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			/*
			 * HttpSession hs = request.getSession(); User user = (User)
			 * hs.getAttribute("currentUser"); int uId=user.getId();
			 */

			System.out.println("Likes Servlet");

			String operation = request.getParameter("operation");
			int pId = Integer.parseInt(request.getParameter("pid"));
			int uId = Integer.parseInt(request.getParameter("uid"));
			LikesDao ld = new LikesDao(ConnectionProvider.getConnection());
			

			if (operation.equals("like")) {
				System.out.println(	ld.isLikedByUser(pId, uId));
				
				
				if (ld.isLikedByUser(pId, uId)) {
					boolean x=ld.deleteLike(pId, uId);
					int totalLike=ld.countLikes(pId);
					
					out.print(totalLike);
					System.out.println("delete like"+x);
				} else {

					if (ld.insertLikes(pId, uId)) {
						int totalLike=ld.countLikes(pId);
						
						out.print(totalLike);
				
						System.out.println("Like inserted sucess");
					}

					else {
						out.print("like notttttttttttttt");
						System.out.println("Likes not updated");
					}
				}
			}

		} catch (

		Exception e) {
			e.printStackTrace();
		}
	}

}
