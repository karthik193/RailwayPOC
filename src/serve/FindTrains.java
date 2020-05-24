package serve;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.*  ; 
/**
 * Servlet implementation class FindTrains
 */
@WebServlet("/FindTrains")
public class FindTrains extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindTrains() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String from  =  request.getParameter("from") ; 
		String to  =  request.getParameter("to") ;
		HttpSession session = request.getSession() ; 
		session.setAttribute("from", from);
		session.setAttribute("to", to);
		FindTrainsdao  ft  = new FindTrainsdao() ; 
		
		if(ft.available(from , to))
		{
			int count  = ft.getCount(from , to) ;

			session.setAttribute("count", count);
			
			response.sendRedirect("BookTrain.jsp");
		}
		else 
		{
			
			
			response.sendRedirect("FindTrain.jsp?trains=no");
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
