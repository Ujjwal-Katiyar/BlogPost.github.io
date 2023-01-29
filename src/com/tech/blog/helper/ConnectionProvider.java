package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection()
	{
		
		
		try
		{
		if(con==null)
		{	
			//driver class load
			Class.forName("com.mysql.cj.jdbc.Driver");
			//create the connection
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","root1");
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return con;
	}

}
