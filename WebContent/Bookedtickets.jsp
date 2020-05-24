<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

   <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Bookings</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script src='https://kit.fontawesome.com/a076d05399.js'></script>
  
</head>
<body>
	 <%
			
		response.setHeader("Cache-Control", "no-cache , no-store , must-revalidate") ;  // works only on HTTP1.1
		response.setHeader( "Pragma" , "no-cache") ; // works for HTTP 1.0 
		response.setHeader("Expires" , "0") ;  //proxy servers 
	
	     if(session.getAttribute("username" ) == null)
			{
				response.sendRedirect("Login.jsp") ; 
			}
	
	%>
	  <nav class = "navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class= "navbar-toggle" data-toggle= "collapse" data-target = "#navs" name="button">
            <span class = "icon-bar"></span>
              <span class = "icon-bar"></span>
              <span class = "icon-bar"></span>
          </button>

          <a href="FindTrain.jsp"  class = "navbar-brand"><span class = "glyphicon glyphicon-home"></span>  Indian Railways</a>
        </div>


        <div class="collapse navbar-collapse" id = "navs">
          <ul class = "nav navbar-nav" id = "navs">
            <li>   <a href="FindTrain.jsp">My Bookings</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>
        
          </div>
    </nav>
    
    
    <!-- end of navigation bar -->
    
    
    <%
		    
		    String url =  "jdbc:mysql://localhost:3306/karthik" ; 
				String uname = "root" ; 
				String pwd = "root"  ; 
				String sql  = "select * from bookings where username = ? order by Bdate" ;
				String Bdates = " select Bdate from bookings  where username =?  group by Bdate  order by Bdate " ; 
				try 
				{
					Class.forName("com.mysql.jdbc.Driver") ; 
					Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
					PreparedStatement st = con.prepareStatement(sql) ;
					st.setString(1, (String)session.getAttribute("username"));
					ResultSet rs  = st.executeQuery() ; 
					
					
					//Bdates 
					PreparedStatement st2 = con.prepareStatement(Bdates) ;
					st2.setString(1, (String)session.getAttribute("username"));
					ResultSet rs2  = st2.executeQuery() ; 
					System.out.println("1"); 
					if(rs2.next())
					{
					
						
						int  i = 1 ; 
						
						%>
						
								<div class = "container"> 
    	   						
    	   								<table class="table">
    											  <thead>
    											    <tr>
    											      <th scope="col">#</th>
    											      <th scope="col">Date</th>
    											      <th scope="col">From</th>
    											      <th scope="col">To</th>
    											      <th scope="col">Name</th>
    											      <th scope="col">Age</th>
    											      <th scope="col">Gender</th>
    											      <th scope="col">Status</th>
    											    </tr>
    											  </thead>
    											  <tbody>
						
						
						
						<% 
						
						
						String sql3  = "select Tfrom , Tto  from trains where trainNo = ?" ; 
						PreparedStatement st3 = con.prepareStatement(sql3) ;
						 
						
						System.out.println("2"); 
						while(rs.next())
						{
							
							int train  = rs.getInt(3) ; 
							st3.setInt(1, train);
							ResultSet rs3  = st3.executeQuery() ; 
							rs3.next() ; 
							String from  = rs3.getString(1) ; 
							String to = rs3.getString(2) ; 
							
							
							System.out.println("3"); 
							
							%> 
									<tr>
    									      <th scope="row"><%=i %></th>
    									      <td><%=rs.getString(7) %></td>
    									      <td><%=from %></td>
    									      <td><%=to  %></td>
    									      <td><%=rs.getString(4)  %></td>
    									      <td><%=rs.getString(5)  %></td>
    									      <td><%=rs.getString(6)  %></td>
    									      <td><%=rs.getString(8)  %></td>
    									    </tr>
									
							
							
							<%
							
							i++ ; 
						}
					}
					else 
					{
						%>
						<div class = "alert alert-danger" >
									<h1> <i class='fas fa-frown'></i>No bookings are done yet</h1>
							</div>
						
						<% 
					}
					
				
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
					
				}
		
				
    
    
    %>

</body>
</html>