<%@page import="serve.testmail"%>
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

<%@page import="java.util.*"%>
<%@page import="javax.mail.*"%>
<%@page import="javax.mail.internet.*"%>

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
    
	   
	     
	        <% 
				     
						String url =  "jdbc:mysql://localhost:3306/karthik" ; 
						String uname = "root" ; 
						String pwd = "root"  ; 
						String sql  = "select * from bookings where username =? and Bdate = current_date() and trainNo = ?" ;  
						int train  = (int)session.getAttribute("train") ; 
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
							    	<div class = "row"  style = "text-align: center ;background-color :#B9EBCC ; "><h1>Indian Railways</h1></div>
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
				         	
						
						
 
    		%>
    		
    		</tbody>
		</table>
		
		<input  type="submit" value="print" onClick="window.print()"/> 
		
		<br>
		<br>
		
		
		<%

						
		
						final String mailTo  = (String)session.getAttribute("emazfvzxcil"); 
						final String mailSub  = "Indian Railway >> Ticket" ;
						String mailMsg  = "Booked By :" + session.getAttribute("username")+ "			" ;
						
						mailMsg += "TrainNo: "+m.get(from)+m.get(to)+ session.getAttribute("train") + "\n" ;  
						
						mailMsg += "SOURCE: "+from+ "			DESTINATION: "+ to +"\n"; 
			
					
						mailMsg += "#			Name			age			Gender			Status\n" ; 
						
						try 
					{
						Class.forName("com.mysql.jdbc.Driver") ; 
						Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
						PreparedStatement st = con.prepareStatement(sql) ; 
						
						String username  = (String) session.getAttribute("username") ; 
			
						st.setString(1, username);
						st.setInt(2, train) ; 
						
						ResultSet rs = st.executeQuery() ; 
						int i = 1  ; 
						while(rs.next())
						{
							
							mailMsg +=  i +"			"+ rs.getString(4)+"			"+ rs.getString(5)+"			"+rs.getString(6)+"			"+ rs.getString(8)+"\n" ; 
						}
						
					}
						catch(Exception e)
						{
							e.printStackTrace() ; 
						}
						
						
						try
						{
							 serve.testmail ts = new testmail() ; 
							 String mailFrom  = "karthik.pasupulatei@gmail.com"; 
							 String mailPass  = "prc@2001" ; 
							 ts.sendMail(mailFrom, mailPass, mailTo, mailSub, mailMsg) ; 
							 
							
			
				    	  %>
					    	<div class="alert alert-success  container">
							  <h3><strong>Sent!</strong>you will be receiving a mail with the copy of Ticket Details </h3>h3>
							</div>
						<% 
						}
						
						catch(Exception e)
						{
						  %>
				    	<div class="alert alert-danger  container">
						  <h3><strong>Failed!</strong>Unable to Send mail please Check you mail id.</h3>  
						</div>
					<% 
					
					e.printStackTrace() ; 
			}
			
		
		
		
		%>
		
	
    </div>

    
</body>
</html>