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
<title>Check availability</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
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

          <a href="FindTrain.jsp"  class = "navbar-brand">Indian Railways</a>
        </div>


        <div class="collapse navbar-collapse" id = "navs">
          <ul class = "nav navbar-nav" id = "navs">
            <li>   <a href="FindTrain.jsp">Availability</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>
        
          </div>
    </nav>
    
    <!-- end of the navigation bar -->
    
    <div class = "container">
		<form >
			<label for = "from">FROM:</label>
			<select class = "form-control"  id = "from"  name = "from">
				<option value="hyderabad">Hyderabad</option>
				<option value="tirupati">tirupati</option>
				<option value="chennai">chennai</option>
				<option value="gujrat">gujrat</option>
			</select>
			
			<label for = "to">TO:</label>
			<select class = "form-control"  id = "to"  name = "to">
				<option value="hyderabad">Hyderabad</option>
				<option value="tirupati">tirupati</option>
				<option value="chennai">chennai</option>
				<option value="gujrat">gujrat</option>
			</select>	
			<br> 	
			<button class  = "btn btn-warning"  type  = "submit" name  = "getTrains" >Check avalability</button>

		</form>
		<hr>
    
    
    <%
    
			    String from  =  request.getParameter("from") ; 
				String to  =  request.getParameter("to") ;
				session.setAttribute("from", from);
				session.setAttribute("to", to);
				
				
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
				
						%> 
							
							
							<div class = "container">
								<table class="table">
    											  <thead>
    											    <tr>
    											      <th scope="col">#</th>
    											      <th scope="col">Train No</th>
    											      <th scope="col">From</th>
    											      <th scope="col">To</th>
    											      <th scope="col">Availability</th>
    											      
    											    </tr>
    											  </thead>
    											  <tbody>
    											  
    											  
    							<%  
    							
    								int i = 1 ; 
    								while(rs.next())
    								{
    									
    									%>
    									
    										<tr>
    									      <th scope="row"><%=i %></th>
    									      <td><%=rs.getString(2)  %></td>
    									      <td><%=rs.getString(3)  %></td>
    									      <td><%=rs.getString(4)  %></td>
    									      
    									      <% 
    									      		if(rs.getInt(7) == 0)
    									      		{
    									      			%>
    									      			
    									      				 <td>waiting</td>
    									      			<% 
    									      		}
    									      		else if (rs.getInt(8) > 0 )
    									      		{
    									      			%>
    									      			
									      				 <td>General</td>
									      				<% 
    									      		}
    									      		else if (rs.getInt(9) > 0 )
    									      		{
    									      			%>
    									      			
									      				 <td>RAC</td>
									      				<% 
    									      		}
    									      		else if (rs.getInt(10) > 0 ) 
    									      		{
    									      			%>
    									      			
									      				 <td>Ladies Kota</td>
									      				<% 
    									      		}
    									      
    									      %>
    									     
    									    </tr>
    									
    									
    									
    									
    									
    									<% 
    									i++ ; 
    								}
    							 
	
				}
				catch(Exception e)
				{
					e.printStackTrace();
					
				}
    
    
    
    
    %>
    
    
    		
    		</tbody>
		</table>
		
		
    
    	</div>
    

</body>
</html>