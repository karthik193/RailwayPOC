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
<title>Insert title here</title>

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
            <li>   <a href="FindTrain.jsp">Select Passengers</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>
        
          </div>
    </nav>


		<%
					

			
		    if(request.getParameter("train") == null){} 
		    else 
		    {
		    	
		    	int train  = Integer.parseInt((String)request.getParameter("train") )    ; 
		    	session.setAttribute("train" ,train) ; 
		    }
			
		
		%>

		<div class = "container"  style = "width : 500px ;">
		
			<h4>Select No of Passengers</h4>
				<form >
			<select name  = "nPass" class = "form-control">
			<option value  = "1">1</option>
			<option value  = "2">2 </option>
			<option value  = "3">3</option>
			</select>
			<br> 
			<button class ="btn btn-warning" type = "submit" >Go</button>
		</form>
		
		
		</div>
		<br>
		
		
		<%
		
		
			if(request.getParameter("nPass") == null)
			{
				
			}
			else {
				
				int count  = Integer.parseInt(request.getParameter("nPass")); 
				int icount  = 0 ; 
				
				session.setAttribute("nPass" , count) ; 
				
				
				if(request.getParameter("Amount") !=null) {
					
					session.setAttribute("Amount" ,Integer.parseInt(request.getParameter("Amount"))) ; 
				}
				
				  if(count == 0 && (int)session.getAttribute("nPass") ==  0 )   
				    {
				    	
				    	%>
				    	
				    	
				    	<div class="alert alert-success  container">
						  <strong>Success!</strong> The Amount for passenger <%=count+1 %> has been deducted
						</div>
					<% 
					
						response.sendRedirect("CheckDeduct.jsp") ; 
				    	//response.sendRedirect("Ticket.jsp") ; 
				    }
				    else 
				    {
				    	
				      if (request.getParameter("Amount") !=null)
				      {
				    	  %>
					    	
					    	
					    	<div class="alert alert-success  container">
							  <strong>Success!</strong> The Amount for passenger <%=count+1 %> has been deducted
							</div>
						<% 
				      }

				    }
				
				
				
				if(request.getParameter("Amount") ==null  && request.getParameter("nPass") !=null)
		    	{
		    		
		    		int amount  = (int)session.getAttribute("Amount") ;
		    		int nPass  = (int)session.getAttribute("nPass")  ; 
		    		
		    		session.setAttribute("actualnPass", nPass) ; 
		    		if (amount < (100*nPass))
		    		{

			    		%>
				    	
				    	<br>
				    	<div class="alert alert-danger  container">
						  <strong>Failed!</strong> you Donot have Sufficient Amount in your Account to Book <%=nPass %> Passengers  
						</div>
					<% 
			    
		    		}
		    		else 
		    		{
		    			  while(count > 0 )
		  			    {
		  			    	
		  			    	icount++ ;
		  			    	
		  			    	%> 
		  			    	
		  			    	
		  			    	<div class  = "container-left"  style = "width : 500px ; margin-left : 100px ;  ">
		  			    			<h1>Passenger <%=icount%></h1>
		  			    	<form action="SelectPass"> 
		  			    		Name :<input class = "form-control"  name = "Name" PlaceHolder = "name">
		  			    		age :<input class = "form-control"  name = "age"PlaceHolder = "age">
		  			    		gender :<input class = "form-control"  name = "gender"PlaceHolder = "gender">
		  			    		<br> 
		  			    		<button class  = "btn btn-primary	" type = "submit">Add</button>
		  			    	</form>
		  			    	
		  			    	
		  			    	</div> <hr>

		  			    	<%  
		  			    	
		  			    	count--;  
		  			    }
	
		    			
		    			
		    		}
		    		
		    	}
				else if(request.getParameter("Amount") !=null)
				{
					  while(count > 0 )
					    {
					    	
					    	icount++ ;
					    	
					    	%> 
					    	
					    	
					    	<div class  = "container-left"  style = "width : 500px ; margin-left : 100px ;  ">
					    			<h1>Passenger <%=icount%></h1>
					    	<form action="SelectPass"> 
					    		Name :<input class = "form-control"  name = "Name" PlaceHolder = "name">
					    		age :<input class = "form-control"  name = "age"PlaceHolder = "age">
					    		gender :<input class = "form-control"  name = "gender"PlaceHolder = "gender">
					    		<br> 
					    		<button class  = "btn btn-primary	" type = "submit">Add</button>
					    	</form>
					    	
					    	
					    	</div> <hr>

					    	<%  
					    	
					    	count--;  
					    }
					    
				}
				
			  
			  
			    
			    
				
				
				
			}
		
			
		
		%>
    
    
</body>
</html>