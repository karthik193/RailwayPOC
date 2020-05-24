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
            <li>   <a href="FindTrain.jsp">My Account</a> </li>
            
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
	String sql  = "select * from users where  username = ?" ; 
	String username  = (String )session.getAttribute("username") ; 
	try 
	{
		Class.forName("com.mysql.jdbc.Driver") ; 
		Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
		String UU  = "update users set password = ? , fname = ? , lname = ? , age = ? , gender = ? , email = ? where username = ? " ; 
		PreparedStatement SU = con.prepareStatement("set sql_safe_updates = 0 ") ; 
		SU.executeUpdate() ; 
		PreparedStatement Uu = con.prepareStatement(UU) ; 
		PreparedStatement st = con.prepareStatement(sql) ; 
		st.setString(1 , username);
		ResultSet rs = st.executeQuery() ; 
		rs.next() ; 
		String pass =  (String)rs.getString(3)  ; 
		String fname =   (String)rs.getString(4)   ; 
		String lname =   (String)rs.getString(5 )  ; 
		String email =   (String)rs.getString(6)  ; 
		String age =   (String)rs.getString(7)  ; 
		String gender =   (String)rs.getString(8)   ; 
		int Balance =   (int)rs.getInt(9)   ; 
		
		
		%>
		
			<div class = "container">
			
				 <div class = "col-md-6">
				 
				 <form>
				 			
		    			<label for = "username">Password:</label>
		    			<input name = "pass" class = "form-control" type = "text" value  =<%=pass %>>
		    			<label for = "username">First Name:</label>
		    			<input name = "fname" class = "form-control" type = "text" value  =<%=fname %>>
		    			<label for = "username">Last Name:</label>
		    			<input name  = "lname" class = "form-control" type = "text" value  =<%=lname %>>
		    			<label for = "username">Email id:</label>
		    			<input name  = "email" class = "form-control" type = "email" value  =<%=email %>>
		    			<label for = "username"   >Age:</label>
		    			<input name = "age" class = "form-control" type = "text" style = "width:50px;" value  =<%=age %>>
		    			<label for = "username">Gender:</label>
		    			<input name = "gender" class = "form-control" type = "text" style = "width:100px; display :float;" value  =<%=gender %>>
		    			<br>
		    			<button class = "btn btn-primary" type = "submit">Save Changes</button>

				 </form>
				 	
				
				 </div>
				 
				 <div class = col-md-6>
				    <h1 class = "alert alert-info"> Username:<%=username %></h1>
				 	<h1 class = "alert alert-success"> Bank balance:<%=Balance %></h1>
				 </div>
		    			
		    			
		    			
		    </div>
		
		
		
		<% 
		
			
	}
	catch(Exception e)
	{
		e.printStackTrace();
		
	}
    
	
	String newPass  = request.getParameter("pass") ; 
	String newfname  = request.getParameter("fname") ; 
	String newlname  = request.getParameter("lname") ; 
	String newage  = request.getParameter("age") ; 
	String newgender  = request.getParameter("gender") ; 
	String newemail  = request.getParameter("email") ;
	

	
	
	
	 
    
    %>

</body>
</html>