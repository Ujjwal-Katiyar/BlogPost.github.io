package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LikesDao {

	
	/*
	 * private int lid; private int pid; private int uid;
	 */
	private Connection conn ;
	public LikesDao(Connection conn)
	{
		this.conn=conn;		
	}
	public boolean insertLikes(int pid ,int uid)
{
		boolean result=false ;
		try 
		{
			
			String query="insert into likes(pid,uid) values("+pid+","+ uid +")";
			Statement st=conn.createStatement();
			int x=st.executeUpdate(query);
			if(x!=0)
			{
				result=true;
			}
		}catch(Exception e){
			e.printStackTrace();
		
		}
		
		
		return result;
}
		public int countLikes(int pid )
		{
			int count =0;
			try 
			{
				
				String query="select count(*) from likes where pid="+pid;
				Statement st=conn.createStatement();
				ResultSet rs=st.executeQuery(query);
				if(rs.next())
				{
					count=rs.getInt(1);
				}
			}catch(Exception e){
				e.printStackTrace();
			
			}
			return count;
		}
		public boolean isLikedByUser(int pid,int uid)
		{
			boolean result=false;
			try 
			{
				
				String query="select count(*) from likes where pid="+pid+" and uid="+uid;
				Statement st=conn.createStatement();
				ResultSet rs=st.executeQuery(query);
				if(rs.next())
				{
				
					int count=rs.getInt(1);
					if(count!=0)
					{
						result=true;
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			
			}
			return result;
		}
		public boolean deleteLike(int pid,int uid)
		{
			boolean result=false;
			try 
			{
				
				String query="delete from likes where pid="+pid+" and uid="+uid;
				Statement st=conn.createStatement();
				st.executeUpdate(query); 
					result=true;
			}catch(Exception e){
				e.printStackTrace();
			
			}
			return result;
		}
	}
	

