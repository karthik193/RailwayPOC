<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Find Trains</title>
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
		<div id="myModal" class="modal fade">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title">Notifications</h4>
		            </div>
		            <div class="modal-body">
		            
		            <div class="alert alert-danger" >
						  No trains available from Hyderabd to chennai
					</div>
					<div class="alert alert-danger">
						  Seats have been made limited due to COVID-19
					</div>
					<div class="alert alert-success">
						  STAY HOME STAY SAFE
					</div>
		           </div>
		        </div>
		    </div>
		</div>
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
            <li>   <a href="FindTrain.jsp">Find Trains</a> </li>
            <li>   <a href="Bookedtickets.jsp">My Bookings</a> </li>
            <li>   <a href="Account.jsp">My Account</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = ""  data-toggle="modal" data-target="#myModal"  > <span class = "glyphicon glyphicon-bell" ></span></a>  </li> 
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>


      </div>
    </nav>
    
    <div class="alert alert-success  container">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	  <h4  id = "welcome"><strong>Hi!</strong> ${username} ,Welcome to Indian Railways Ticket Management Services</h4>
	</div>
	<div class = "container">
		<form action="FindTrains">
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
			<button class  = "btn btn-warning"  type  = "submit" name  = "getTrains" >Get Trains</button>
			
			<a class  = "btn btn-warning"  name  = "pnrStatus"  href = "PnrStat.jsp">get pnr status</a> 
			<a class  = "btn btn-warning"  type  = "submit" name  = "availableT"  href = "Checkaval.jsp">Check availability</a> 
			<a class  = "btn btn-info"  name  = "cancel"  href = "Cancel.jsp">Cancel Tickets</a> 
		
		</form>
		<hr>
		<%
		     
		
			 
			
		   if(request.getParameter("trains")==null)
		     {
		    	
		     }
		   else 
		   {
			   
		    	
		    		%>
		    		<h1><i class='fas fa-frown'></i> No Trains available from ${from}  to  ${to} </h1>
		    		<%
		    	
		   }
		
		if(request.getParameter("wait")==null)
	     {
	    	
	     }
	   else 
	   {
		   
	    	
	    		%>
	    		<h1><i class='fas fa-frown'></i> No seats are available<h1>
	    		<%
	    	
	   }
		
		   
			
		%>

	</div>
</body>
</html>