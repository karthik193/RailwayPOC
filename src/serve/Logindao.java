package serve;

import java.sql.* ; 

public class Logindao {
	
	
	public boolean check(String username  , String pass) throws ClassNotFoundException
	{
		
		
		

		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from users where  username = ? and password = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			st.setString(1 , username);
			st.setString(2, pass);
			ResultSet rs = st.executeQuery() ; 
			if(rs.next())
			{
				System.out.println(rs.getString(1)) ; 
				return true  ; 
			}
			else return false  ;
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		return false  ; 
	}
	public boolean userpresent(String username , String password)
	{
		
		
		

		
		System.out.println("badcowlara in dao");
		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from users where  username = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			st.setString(1 , username);
			
			ResultSet rs = st.executeQuery() ; 
			if(rs.next())
			{
				System.out.println(rs.getString(1)) ; 
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
	public int getAmount(String username)
	{
		
		System.out.println("badcowlara in dao");
		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select amount from users where  username = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			st.setString(1 , username);
			ResultSet rs = st.executeQuery() ; 
			rs.next(); 
			int amount =   rs.getInt(1) ; 
			return amount  ; 
			
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
		return 0;
		
	}
	
	public String getemail(String username)
	{
		
		System.out.println("badcowlara in dao");
		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select email from users where  username = ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			st.setString(1 , username);
			ResultSet rs = st.executeQuery() ; 
			rs.next(); 
			String email =   rs.getString(1) ; 
			return email  ; 
			
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return "" ; 
		
	}

}