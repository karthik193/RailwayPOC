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
<title>Insert title here</title>
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

         <a href="FindTrain.jsp"  class = "navbar-brand"><span class = "glyphicon glyphicon-home"></span>  Indian Railways</a>
        </div>


        <div class="collapse navbar-collapse" id = "navs">
          <ul class = "nav navbar-nav" id = "navs">
            <li>   <a href="FindTrain.jsp">Your Ticket</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>
        
          </div>
    </nav>
    
    <!-- end of the navigation bar -->
    
    <% 
       String from  = (String)session.getAttribute("from") ;
       String to  = (String)session.getAttribute("to") ; 
       
       Map m = new HashMap() ; 
       m.put("hyderabad" , "HYD") ; 
       m.put("tirupati" , "TRP") ; 
       
    %>
    
    
    <div class = "container"  style = "width : 500px ;">
		<form >
			<select name  = "pnr" class = "form-control">
			<option value  = "1">1</option>
			<option value  = "2">2 </option>
			<option value  = "3">3</option>
			</select>
			<br> 
			<button class ="btn btn-warning" type = "submit" >Go</button>
		</form>
		
		
		</div>
		<hr>
 
    
      <% 
				     
      
      					if(request.getParameter("pnr") == null)
      					{
      						
      					}
      					else 
      					{
      						
      						String url =  "jdbc:mysql://localhost:3306/karthik" ; 
    						String uname = "root" ; 
    						String pwd = "root"  ; 
    						String sql  = "select * from bookings where username =? and Bdate = current_date() and trainNo = ?" ;  
    						int train = Integer.parseInt(request.getParameter("pnr"));
    						try 
    						{
    							Class.forName("com.mysql.jdbc.Driver") ; 
    							Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
    							PreparedStatement st = con.prepareStatement(sql) ; 
    							
    							String username  = (String) session.getAttribute("username") ; 
    				
    							st.setString(1, username);
    							st.setInt(2, train) ; 
    							
    							ResultSet rs = st.executeQuery() ; 
    							
    							
    							//font-family: 'DM Mono', monospace;
    							%>
    							
    							 <div class = "container">
    							    	<div class = "row"  style = "text-align: center ;background-color :#B9EBCC ; "><h1>Indian Railways {PNR STATUS}</h1></div>
    							    	<div class  ="row"  style = "background-color :#B0E3EB; "> 
    							    		<div class = "col-sm-4" ><h4>Booked By : ${username} </h4></div>
    							    		<div class = "col-sm-4" ><h4>TrainNo:  <%=m.get(from) %><%=m.get(to)%> ${train} </h4></div>			
    							    		</div>
    							    	<div class= "row"  style = "background-color :#2EB4E8; " ><div class = "col-sm-4" ><h4>SOURCE: ${from} </h4></div>
    							    		<div class = "col-sm-4" ><h4>DESTINATION:  ${to} </h4></div>			

    							    		</div>
    							    	
    							    	
    	    	
    	   						</div>
    	   						
    	   						<div class = "container"> 
    	   						
    	   								<table class="table">
    											  <thead>
    											    <tr>
    											      <th scope="col">#</th>
    											      <th scope="col">Name</th>
    											      <th scope="col">Age</th>
    											      <th scope="col">Gender</th>
    											      <th scope="col">Status</th>
    											    </tr>
    											  </thead>
    											  <tbody>
    	   						     
    							<% 
    							
    							int i = 1  ; 
    							while(rs.next())
    							{
    								%> 
    									
    									
    									<tr>
    									      <th scope="row"><%=i %></th>
    									      <td><%=rs.getString(4)  %></td>
    									      <td><%=rs.getString(5)  %></td>
    									      <td><%=rs.getString(6)  %></td>
    									      <td><%=rs.getString(8)  %></td>
    									    </tr>
  
    								<% 

    								i++  ; 
    							}
    						
    							
    								
    						}
    						catch(Exception e)
    						{
    							e.printStackTrace();
    							
    						}
    				         	
    	       				
    	    	
    	    	
    	
      
     
        		
      					}
      
      %>
						
    		
    		</tbody>
		</table>
		
		<input  type="submit" value="print" onClick="window.print()"/> 
	
    </div>

</body>
</html>