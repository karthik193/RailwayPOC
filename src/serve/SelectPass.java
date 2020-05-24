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
 * Servlet implementation class SelectPass
 */
@WebServlet("/SelectPass")
public class SelectPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPass() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		HttpSession session = request.getSession() ; 
		
		
		int count  =  (int) session.getAttribute("nPass") ; 
		
		int Amount = (int) session.getAttribute("Amount") ;
		

		String url =  "jdbc:mysql://localhost:3306/karthik" ; 
		String uname = "root" ; 
		String pwd = "root"  ; 
		String sql  = "insert into bookings(username , trainNo, Pname , age , gender , Bdate  ,status , dAmt) values(?,?,?,?,? , current_date() ,? , ? ) " ; 
		try 
		{
			Class.forName("com.mysql.jdbc.Driver") ; 
			Connection con =  DriverManager.getConnection(url , uname , pwd) ; 
			PreparedStatement st = con.prepareStatement(sql) ; 
			
			int train  = (int) session.getAttribute("train") ;
			String sql2  = "select aval , general , rac , lk , wait from trains where trainNo = ?" ; 
			PreparedStatement st2 = con.prepareStatement(sql2) ; 
			st2.setInt(1, train);
		    ResultSet rs2  = st2.executeQuery() ; 
		    rs2.next() ; 
			int aval  = rs2.getInt(1) ; 
			int general = rs2.getInt(2) ; 
			int rac  = rs2.getInt(3) ; 
			int lk  = rs2.getInt(4) ; 
			int wait  = rs2.getInt(5) ;
		
		
				
				
				String username  = (String) session.getAttribute("username") ; 
				
				String Name  = request.getParameter("Name") ; 
				String age = request.getParameter("age") ; 
				String gender = request.getParameter("gender") ;

				String Status  = "WA" ; 
				if(general > 0)
				{
					general-=1  ;
					Status  = "GN" ; 
					
				}
				else if (rac > 0 )
				{
					rac-= 1 ; 
					Status  = "RAC" ; 
				}
				else if ((lk > 0  && gender.equals("female") ) || gender.equals("60"))
				{
					lk-= 1 ; 
					Status  = "LK" ; 
				}
				else 
				{
					wait+= 1  ; 
				}

				aval = general + rac + lk  ; 
				if (Status.equals("WA"))
				{
					
					if(wait > 3)
					{
						response.sendRedirect("FindTrain.jsp?wait=exceed");
					}
					Status+= wait ; 
				}
				else {Status += aval  ; } 
				

				String safe  = "set sql_safe_updates = 0 " ; 
				PreparedStatement safeUpdate  = con.prepareStatement(safe) ;
				safeUpdate.executeUpdate() ; 
				String uSeats   = "update trains set  aval=? , general = ? , rac= ?  , lk=? , wait=? where trainNo = ?" ; 
				PreparedStatement st3 = con.prepareStatement(uSeats) ; 
				st3.setInt(1, aval);
				st3.setInt(2, general);
				st3.setInt(3, rac);
				st3.setInt(4, lk);
				st3.setInt(5, wait);
				st3.setInt(6, train);
				if (wait <=3)
					st3.executeUpdate() ; 
				
				
				
				st.setString(1, username);
				st.setInt(2 ,train)   ; 
				st.setString(3, Name);
				st.setString(4, age);
				st.setString(5, gender);
				st.setString(6,  Status);
				st.setInt(7, 0);
				
				int n = st.executeUpdate() ; 
				
				count = count-1 ; 
				Amount = Amount - 100 ; 
				
				
				String Uamount  = "Update users set amount = ? where username = ?" ; 
				safeUpdate.executeUpdate() ; 
				PreparedStatement UA = con.prepareStatement(Uamount) ;
				UA.setInt(1, Amount);
				UA.setString(2,  username);
				UA.executeUpdate() ; 				
				
				response.sendRedirect("SelectPass.jsp?nPass="+count +"&Amount="+ Amount);
				
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
