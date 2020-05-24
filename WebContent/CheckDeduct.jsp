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
<title>Deduction</title>

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
	
	
	
	<%
			
			
	

		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from Bookings where username  = ? and date_format(sysdate() ,  'MM' ) = date_format(Bdate , 'MM') " ; 
		String sql2 = "update users set  amount = amount +100 where username  = ? " ; 
		String Ubook = "update bookings set dAmt = 1 where username  = ? and Bdate = current_date(); " ; 
		
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			
			String username  = (String) session.getAttribute("username") ; 
	
			st.setString(1, username);
			
			ResultSet rs = st.executeQuery() ; 
			
			int nPass  = (int) session.getAttribute("actualnPass") ; 
			rs.next() ; 
			rs.next() ;
			rs.next() ;
			if(rs.next())
			{
				
				if (nPass > 1)
				{
					PreparedStatement st2 = con.prepareStatement(sql2) ; 
					st2.setString(1,username) ; 
					st2.executeUpdate() ; 
					PreparedStatement Ubookings = con.prepareStatement(Ubook) ;
					Ubookings.setString(1 , username) ;
					Ubookings.executeUpdate() ; 
					
				}
				
				
				%> 
				
						<div class="alert alert-success  container"   style =" margin-top:170px;text-align: center ; width : 70% ;  ">
						  <h2><strong> Hey! you are our most regular customer of this month </strong></h2>
						  <h4> you will be Charged only for <%=nPass-1 %> Passengers among <%=nPass %> Passengers.</h4>
						  <h4> Rupees <%=((nPass-1)*100) %> has been deducted from your account.</h4>	
						  <h2>Thank you! Visit Again <i class='fas fa-laugh-wink'></i></h2>
						  <a class = "btn btn-primary" href = "Ticket.jsp">Dowload Ticket</a>	
						</div>
						
						
				
				<% 
			}
			else 
						{%> 
						
						<div class="alert alert-success  container"   style = " margin-top:170px;text-align: center ; width : 70% ;  ">
						  <h4> <%=(nPass)*100 %> has been deducted from your account.</h4>	
						  <h2>Thank you! for Choosing Indian Railways Services</h2>
						  <a class = "btn btn-primary" href = "Ticket.jsp">Dowload Ticket</a>		
						</div>
				
						<% 
			}
		}
		catch( Exception e )
		{
			e.printStackTrace() ;		}
		
	%>
</body>
</html>