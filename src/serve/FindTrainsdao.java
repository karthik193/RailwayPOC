package serve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FindTrainsdao {
			
	public boolean available(String from , String to ) 
	{
		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from trains where  Tfrom = ? and Tto = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ;
			st.setString(1, from );
			st.setString(2, to);
			ResultSet rs  = st.executeQuery() ; 
			if(rs.next())
			{
				return true  ; 
			}
			else return false  ; 
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false;
	}
	public int getCount(String from  , String to )
	{
		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from trains where  Tfrom = ? and Tto = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ;
			st.setString(1, from );
			st.setString(2, to);
			ResultSet rs  = st.executeQuery() ; 
			int count  = 0  ; 
			while(rs.next())
			{
				count++; 
			}
			return count  ; 
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return  0 ; 
	}
}
