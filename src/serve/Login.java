package serve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username  = request.getParameter("username") ; 
		String pass  =     request.getParameter("pass") ; 
		
		
		Logindao jd  = new Logindao() ; 
	
		try {
			
			
			if(jd.userpresent(username, pass))
			{
				if(jd.check(username, pass) == true)
				{
					
					HttpSession  session  = request.getSession(); 
					session.setAttribute("username" , username) ; 
					
					
					
					session.setAttribute("Amount", jd.getAmount(username));
					session.setAttribute("email", jd.getemail(username));

					response.sendRedirect("FindTrain.jsp");
				}
				else 
				{
					response.sendRedirect("Login.jsp?sign=wrong");
				}
			}
			else
			{
				response.sendRedirect("Login.jsp?sign=nfound");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
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
