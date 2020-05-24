package serve;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fname  =  request.getParameter("fname") ; 
		String lname  =  request.getParameter("lname") ; 
		String username =  request.getParameter("username") ; 
		String password  =  request.getParameter("pass") ; 
		String email  =  request.getParameter("email") ; 
		int age =  Integer.parseInt(request.getParameter("age")) ; 
		String gender =  request.getParameter("gender") ; 
		
		

		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "select * from users where  email= ?" ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			st.setString(1, email);
			ResultSet rs = st.executeQuery() ;

			if(rs.next())
			{
				response.sendRedirect("Signup.jsp?signup=exist");
			}
			else
			{
				String sql2  = "select * from users where username= ?" ; 
				PreparedStatement st2 = con.prepareStatement(sql2) ; 
				st2.setString(1 , username);
				ResultSet rs2 = st2.executeQuery() ;

				if(rs2.next())
				{
					response.sendRedirect("Signup.jsp?signup=uexist");
					
				}
				else
				{
					String insert = "insert into users(username , password ,fname ,lname , email , age , gender, amount)values(?, ?, ?, ?, ?, ?, ? , 500)" ;
					
					PreparedStatement st3 = con.prepareStatement(insert) ; 
					st3.setString(1 , username);
					st3.setString(2 , password) ;
					st3.setString(3 , fname) ; 
					st3.setString(4 , lname) ; 
					st3.setString(5 , email) ; 
					st3.setInt(6 , age) ; 
					st3.setString(7 , gender) ; 
					
					int rs3 = st3.executeUpdate() ;

					
					HttpSession session = request.getSession() ; 
					session.setAttribute("username", username);
					session.setAttribute("password",password);
					session.setAttribute("fname", fname);
					session.setAttribute("lname", lname);
					session.setAttribute("email", email);
					session.setAttribute("age", age);
					session.setAttribute("gender", gender);
					session.setAttribute("Amount", 500);
					
					response.sendRedirect("FindTrain.jsp");
					
				}
			}
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
