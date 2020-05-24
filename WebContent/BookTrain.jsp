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
            <li>   <a href="FindTrain.jsp">Book Trains</a> </li>
            
          </ul>
          <ul class = " nav navbar-nav navbar-right">
          <li> <a href = "">  Signed in as ${username}  </a>  </li> 
          <li> <a  href = "Logout" >Logout</a></form> </li> 
          </ul>
        </div>


      </div>
    </nav>
    
    
   	<div  class = "container">
   	
   			<%
   		
   			
   			String url =  "jdbc:mysql://localhost:3306/karthik" ; 
   			String uname = "root" ; 
   			String pwd = "root"  ; 
   			String sql  = "select * from trains where  Tfrom = ? and Tto = ?" ; 
   			try 
   			{
   				Class.forName("com.mysql.jdbc.Driver") ; 
   				Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
   				PreparedStatement st = con.prepareStatement(sql) ;
   				st.setString(1, (String)session.getAttribute("from"));
   				st.setString(2, (String) session.getAttribute("to") );
   				ResultSet rs  = st.executeQuery() ; 
   				
   				out.println("<h1>Available Trains</h1> <hr>") ;
   				
   				while(rs.next())
   				{
   					%> <div class = "container">
   						<label for = "from">FROM : </label> <h4> ${from} </h4>
   						
   						<label for = "to">TO : </label>  <h4> ${to} </h4>
   						
   						<label for = "time">Day and Time : </label>  <h4><%=rs.getString(6) %>    ,<%=rs.getString(5) %> </h4> 
						<%  String mytrain = "SelectPass.jsp?train="+rs.getString(2)  ; %>
						<a class = "btn btn-warning"  href = <%=mytrain%>  name=<%=rs.getString(2)%>>BOOK</a>
						<a class = "btn btn-warning"   href = "" name="" +<%=rs.getString(2)%>>Check availability</a>
   					</div>
   					<hr>
   					<% 
   				}	
   				
   			}
   			catch(Exception e)
   			{
   				e.printStackTrace();
   				
   			}
   			
   					
			
   			%>
   	
   	</div>
   	
   	
   
</body>
</html>