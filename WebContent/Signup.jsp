<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign up page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  
  <style type="text/css">
  	#signin{
  	
  			width:350px ; 
  			border :0px ; 
  			
  			margin-top:200px ; 
  			
  			
  	
  	}
  
  
  </style>
</head>
<body>

		
	<div class = "container"   id= "signin">
	<a class = "btn btn-warning"  name ="goback"   href= "Login.jsp"><span class = "glyphicon glyphicon-menu-left"><spans></a>
			<h1>Indian Railways</h1>
			<form  action="Signup">
				<label for = "fname">FirstName</label>
				<input class = "form-control " type = "text"  name  = "fname"  placeholder = "FirstName" >
				<label for = "fname">LasttName</label>
				<input class = "form-control " type = "text"  name  = "lname"  placeholder = "LastName" >
				<label for = "fname">UserName</label>
				<input class = "form-control " type = "text"  name  = "username"  placeholder = "Enter UserName" >
				<label for = "fname">Password</label>
				<input class = "form-control " type = "password"  name  = "pass"  placeholder = "Enter Password" >
				<label for = "fname">Email id</label>
				<input class = "form-control "  type="email" name  = "email"  placeholder = "Email" >
				<label for = "fname">Age</label>
				<input class = "form-control " type = "text"  name  = "age"  placeholder = "Age" >
				<label for = "fname">Gender</label>
				<input class = "form-control " type = "text"  name  = "gender"  placeholder = "Gender" >
				<br>
				<button class = "btn btn-primary"  type = "submit" name ="signup">Sign up</button>
				
			</form>
			<br>
			<br>
			<br>
			<br>
		
		<%
		
			if(request.getParameter("signup") == null){}
			else if(request.getParameter("signup").equals("uexist")) 
			{
				%> 
				
					<h4>A account already exits with this username</h4>
				
				<%
			}
			else if(request.getParameter("signup").equals("exist"))
			{
				%> 
				
				<h4>A account already exits with this Email id</h4>
			
				<%
			}
		
		
		
		%>
		
	
				
	</div>
	
</body>
</html>