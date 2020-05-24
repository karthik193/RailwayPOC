<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login pagee</title>
<link href="https://fonts.googleapis.com/css2?family=DM+Mono&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <%
 
//font-family: 'DM Mono', monospace;
 %> 
  
  <style type="text/css">
  	#signin{
  	
  			width:350px ; 
  			border :0px ; 
  			
  			margin-top:200px ; 
  			
  			
  	
  	}
  	#insta{
  	
  		margin-top:200px ;
  		
  		text-align:left ;  
  	
  	}


  
  </style>
</head>
<body>
	<div class  = "container"  >
		<div class = "col-lg-6">
			<div class = "container-inner"  id = "insta">
				<h1  id = "logo">Indian Railways </h1>
		<pre   style  = " font-family: 'DM Mono', monospace;   width:100%; "  >
  Instructions: 
  1. Per day one Booking per One destination
  2. Only 6 trains are running for booking availability.
  3. Per User, Maximum Passengers are limited to 3 only.
  
  help: 
  1. On Successful Login, you are directed to Indian Railways Services.
  2. Please maintain <kbd>COVID-19</kbd> Rules due to panedemic situation.
   
	</pre>
	
			</div>
			
		</div>
	
	<div class = "col-lg-6">
	<div class = "container"   id= "signin">
	
			
			<h1>User Credentials</h1>
			<form  action="Login">
				<input class = "form-control " type = "text"  name  = "username"  placeholder = "Enter UserName" >
				<input class = "form-control " type = "password"  name  = "pass"  placeholder = "Enter Password" >
				<br>
				<button class = "btn btn-primary"  type = "submit" name ="signin">Sign in</button>
				<a class = "btn btn-primary" href= "Signup.jsp" >Sign up </a>
			</form>
			
	
	
	
	<%
		 if(request.getParameter("sign") == null){}
		 
		 else if (request.getParameter("sign").equals("nfound"))
		 {
			 %> <h1>No account is Registered with this username</h1>
			 <a class ="btn btn-primary"  href= "Signup.jsp">Signup</a>
			 <%
		 }
		 else if(request.getParameter("sign").equals("wrong")) 	 
		 {
				 
			 %> <h1>incorrect Username or Password</h1>			
			 <%
		 }

	%>

		</div> <!-- inner container for form -->
		</div> <!-- column for the form -->
	</div>
</body>
</html>