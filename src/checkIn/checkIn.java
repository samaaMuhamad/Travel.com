package checkIn;

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
@WebServlet("/checkIn")
public class checkIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkIn() {
        super();
        // TODO Auto-generated constructor stub
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
		            String checkInDate= request.getParameter("checkIn");
		            ReservationDao reservationDao = new ReservationDao();
		           boolean exist=  reservationDao.getCertainReservation(con, reservationID);
		           if (exist) {
					String query = " insert into checkIn(checkinDate, checkoutDate, reservationID)"
						        + " values (?, ?,?)";
	
					PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(query);
					preparedStmt.setString (1, checkInDate);
					preparedStmt.setString(2, null);
					preparedStmt.setString(3, reservationID);
					
					preparedStmt.execute();
						      
			
				    RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkIn.jsp");
			    	PrintWriter out1 = response.getWriter();
			    	out1.println("<html> <script>  alert(\"Check in was made SUCCESSFULLY \"); </script> </html>");
			    	rd.include(request, response);
		           }
		           else
		           {
		        	   RequestDispatcher rd = getServletContext().getRequestDispatcher("/checkIn.jsp");
				    	PrintWriter out1 = response.getWriter();
				    	out1.println("<html> <script>  alert(\"No reservation with this ID \"); </script> </html>");
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
