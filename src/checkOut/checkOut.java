package checkOut;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import com.Reservation.Reservation;
import com.Reservation.ReservationDao;
import com.hotel.Hotel;
import com.hotel.HotelDao;
import com.user.*;



/**
 * Servlet implementation class checkIn
 */
@WebServlet("/checkOut")
public class checkOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkOut() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		
			try 
			{
				  con = DBConnection.initializeDB();
				 // java.sql.Statement stmt1 = null;
				
					String reservationID= request.getParameter("reservationID");

		        	String checkOutDate= request.getParameter("checkOut");
		            
		            java.sql.Statement stmt1 = null;

		            String sql = "SELECT * from checkin where reservationID='"+  reservationID +"'";
		        	stmt1 = con.createStatement();
		        	ResultSet rset = stmt1.executeQuery(sql);
		        	
		        //	String checkInDate = rset.getString("checkinDate");
		        	
		        	//if(checkOutDate.compareTo(checkInDate)==1 || checkOutDate.compareTo(checkInDate)==0 )
		        	//{
		        	if(rset.next()) {
							String query = " UPDATE checkin SET checkoutDate = ? WHERE reservationID = ?";
			
							PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
							preparedStmt.setString (1, checkOutDate);
							preparedStmt.setString(2, reservationID);
							
							preparedStmt.execute();
								      
					
						    RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOut.jsp");
					    	PrintWriter out1 = response.getWriter();
					    	out1.println("<html> <script>  alert(\"Check out was made SUCCESSFULLY \"); </script> </html>");
					    	rd.include(request, response);
		        	}
		        	else
		        	{
		        		
		        		RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkOut.jsp");
				    	PrintWriter out1 = response.getWriter();
				    	out1.println("<html> <script>  alert(\"This reservation wasNOT checked-IN before.. \"); </script> </html>");
				    	rd.include(request, response);
		        	}
				
			} catch (ClassNotFoundException | SQLException e) {
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
