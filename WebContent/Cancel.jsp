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
<%@page import="java.util.*"%>
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
				String Bdates = " select Bdate from bookings  where username =? and Bdate group by Bdate  order by Bdate " ; 
				String username  = (String)session.getAttribute("username") ; 
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
					
						
						if(request.getParameter("returnAmt") == null)
				    	{
				    		%>
				    	    <div class = "alert alert-info container" >
				    	    	<h4>Only Half the amount will be repaid back</h4>
				    	    </div>
				    	    <% 
				    	}
				    	else 
				    	{
				    		%>
				    	    <div class = "alert alert-success container" >
				    	    	<h4>Half the amount Rupees  <%=request.getParameter("returnAmt")  %> has been repaid back</h4>
				    	    </div>
				    	    <% 
				    	}
				    
						
						
						
						
						
						
						int  i = 1 ; 
						
						%>
							
								<div class = "container"> 
    	   							
    	   							<form action="">
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
    									      <th scope="row"><input type = "checkBox" name  ="id" value =<%=rs.getInt(1) %> > <%=i %></th>
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
						
						
						
						
						%>
						
						     		</tbody>
									</table>
		 
									<button class= "btn btn-info" type = "submit"  data-toggle="modal" data-target="#myModal" >Cancel</button>
						<% 
					}
					else 
					{
						
						
						   if(request.getParameter("returnAmt") == null)
					    	{
					    		%>
					    	    <div class = "alert alert-info container" >
					    	    	<h4>Only Half the amount will be repaid back</h4>
					    	    </div>
					    	    <% 
					    	}
					    	else 
					    	{
					    		%>
					    	    <div class = "alert alert-success container" >
					    	    	<h4>Half the amount Rupees <%=request.getParameter("returnAmt")  %> has been repaid back</h4>
					    	    </div>
					    	    <% 
					    	}
						
						
						
						
						%>
						
						
						
						
						
							<div class = "alert alert-danger  container" >
									<h1><i class='fas fa-frown'></i>  No bookings are done yet</h1>
							</div>
							
							
						
						<% 
					}
					
				
					
				}
				catch(Exception e)
				{
					e.printStackTrace();
					
				}
		
				
    
    
    %>
	
		
	
	</form>
	</div>
	
	
		
	
	<% 
			String select[] = request.getParameterValues("id") ;
			if( select != null && select.length != 0 )
			{
				
				String del  = "delete from bookings where bid = ?" ;
				String SU = "set sql_safe_updates = 0 ;" ;
				String getDate = "select Bdate , trainNo ,Status from bookings where bid  = ? and dAmt = ? " ; 
				String sql2  = "select aval , general , rac , lk , wait from trains where trainNo = ?" ; 
				
				
				Set<String> dates  = new HashSet<String>() ; 
				 
				try 
				{
					Class.forName("com.mysql.jdbc.Driver") ; 
					Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
					PreparedStatement delete = con.prepareStatement(del) ;
					PreparedStatement SUPS = con.prepareStatement(SU) ;
					PreparedStatement getBdate = con.prepareStatement(getDate) ;
					PreparedStatement st2 = con.prepareStatement(sql2) ; 
					SUPS.executeUpdate() ; 
					System.out.println("updates are made safe") ; 
					int returnAmt  = select.length ;
				
					for (int i = 0; i < select.length; i++) 
					{
						 
						System.out.println(Integer.parseInt(select[i])) ; 
						getBdate.setInt(1, Integer.parseInt(select[i])) ;
						getBdate.setInt(2, 1) ; 
						ResultSet mydate  = getBdate.executeQuery(); 
						if(mydate.next()) 
						{System.out.println(mydate.getString(1)) ; 
								
						
						st2.setInt(1, mydate.getInt(2));
					    ResultSet rs2  = st2.executeQuery() ; 
					    rs2.next() ; 
						int aval  = rs2.getInt(1) ; 
						int general = rs2.getInt(2) ; 
						int rac  = rs2.getInt(3) ; 
						int lk  = rs2.getInt(4) ; 
						int wait  = rs2.getInt(5) ;
						String status  = mydate.getString(3) ; 
						
						//checking the status to get back the seats 
						
						if(status.contains("GN"))
						{
							general+=1 ; 
						}
						else if (status.contains("RAC"))
						{
							rac +=1  ; 
						}
						else if(status.contains("LK"))
						{
							
							lk+=1 ; 
						}
						else 
						{
							wait -=1 ; 
						}
						aval  = general + rac + lk ; 
						String uSeats   = "update trains set  aval=? , general = ? , rac= ?  , lk=? , wait=? where trainNo = ?" ; 
						PreparedStatement st3 = con.prepareStatement(uSeats) ; 
						st3.setInt(1, aval);
						st3.setInt(2, general);
						st3.setInt(3, rac);
						st3.setInt(4, lk);
						st3.setInt(5, wait);
						st3.setInt(6, mydate.getInt(2));
						st3.executeUpdate() ; 
					  	dates.add(mydate.getString(1)) ; }
					  	
					  	System.out.println("collecting dates") ; 
					  
					  	delete.setInt(1, Integer.parseInt(select[i])) ; 
					  	System.out.println("setting to dels") ; 

					  	delete.executeUpdate() ; 
					
					}
					System.out.println("collected all dates") ; 
					returnAmt = returnAmt - (dates.size()) ; 
					
					
					
					returnAmt *= 100 ; 
					returnAmt /=2 ; 
					String RA = "update users set amount = amount + ? where username =  ? " ; 
					PreparedStatement rAmt = con.prepareStatement(RA) ;
					rAmt.setInt(1, returnAmt) ; 
					rAmt.setString(2,username);
					System.out.println("updating amounts") ; 
					rAmt.executeUpdate() ; 
					
					response.sendRedirect("Cancel.jsp?returnAmt="+ returnAmt) ; 
					
					
				}
				catch(Exception e ){
					e.printStackTrace(); 
				}
			}
			else 
			{
				
			}
	
			%>
					<script type="text/javascript">
					
						window
					</script>
			
			<% 
	%>
	
</body>
</html>