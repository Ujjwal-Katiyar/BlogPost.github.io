package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.tech.blog.entities.Post;

public class PostDao {
	private Connection con;
	
	
	public PostDao(Connection con)
	{
		this.con=con;
	}
	
	//Code to retrive all the post present in the database
	public ArrayList<Post> getAllPost()
	{
		ArrayList<Post> al=new ArrayList<>();
		try
		{
			String query="select * from posts order by pid desc ";
			Statement s=con.createStatement();
			ResultSet rs = s.executeQuery(query);
			while(rs.next())
			{
				Post p=new Post(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7),rs.getInt(8));
				al.add(p);
				
			}
			
			
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return al;
		
	}
	public ArrayList<Post> getPostByCatId(int catId)
	{
		ArrayList<Post> al=new ArrayList<>();
		try
		{
			String query="select * from posts where catId="+catId;
			Statement s=con.createStatement();
			ResultSet rs = s.executeQuery(query);
			while(rs.next())
			{
				Post p=new Post(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7),rs.getInt(8));
				al.add(p);
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return al;
		

		
	}
	public Post getPostById(int id)
	{

		Post p=null;
		try
		{
			String query="select * from posts where pid="+id;
			Statement s=con.createStatement();
			ResultSet rs = s.executeQuery(query);
			if(rs.next())
			{
				 p=new Post(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getTimestamp(6),rs.getInt(7),rs.getInt(8));
				
				
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return p;
	}
	public boolean deletePostById(int id)
	{ 
		boolean result=false;
		try
		{
			
			String query="Delete from posts where pid="+id;
			Statement s=con.createStatement();
		     s.executeUpdate(query);
			result=true;
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		return result;
		
	}

}
