package com.tech.blog.dao;

import java.sql.*;

import java.util.ArrayList;
import com.tech.blog.entities.*;

import com.tech.blog.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

// method to insert user data
	public boolean saveUser(User user) {
		boolean flag = false;
		try {
			String query = "insert into user(name,email,password,gender)values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());

			ps.executeUpdate();
			flag = true;
			System.out.println(flag);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		try {
			// creat query
			String query = "Select * from user where email=? and password=?";
			// cerate Statement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("login sucess");
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("uprofile"));

			} else {
				System.out.println("login again");

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}

	public boolean updateUser(User user) {
		boolean f = false;

		try {
			String query = "update user set name=?,email=?,password=?,uprofile=? where id=?";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getProfile());
			ps.setInt(5, user.getId());
			ps.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public ArrayList<Categories> getCategories() {
		ArrayList<Categories> al = new ArrayList<>();
		String query = "Select * from categories";
		try {
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				Categories c = new Categories(rs.getInt("cid"), rs.getString("name"), rs.getString("description"));
				al.add(c);
				System.out.println("Categoris fetch sucessfully");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return al;

	}

	public boolean savePost(Post p) {
		boolean f = false;

		try {
			// write code for insert the post data in the database

			String query = "insert into posts (pTitle,pContent,pCode,pPic,catId,userId)values(?,?,?,?,?,?) ";
			System.out.println("Second1");
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpContent());
			ps.setString(3, p.getpCode());
			ps.setString(4, p.getpPic());
		//	ps.setTimestamp(5,p.getpDate());
			ps.setInt(5, p.getCatId());
			ps.setInt(6, p.getUserId());

			ps.executeUpdate();
			System.out.println("Second");
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}
	public User getUserById(int id)
	{
		User user = null;
		try {
			// creat query
			String query = "Select * from user where id=?";
			// cerate Statement
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				
				user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
		
	}

}
