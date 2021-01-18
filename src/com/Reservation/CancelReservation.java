package com.Reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DBConnection;
import com.user.UserDao;
import com.hotel.HotelDao;
import com.others.EmailSender;
import com.room.RoomDao;
import com.user.DBConnection;
import com.others.EmailSender;

/**
 * Servlet implementation class CancelReservation
 */
@WebServlet("/CancelReservation")
public class CancelReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			   Connection con = DBConnection.initializeDB();
			   
			   ReservationDao reservationDao = new ReservationDao();
			   
			   HotelDao hotelDao = new HotelDao();
			   RoomDao roomDao = new RoomDao();
			   UserDao userDao = new UserDao();
			   
			   String reservationID = request.getParameter("reservationID");

		     //  String payment = "false";//
		       //String roomNumber = request.getParameter("roomNumber");//
		       
		   //    reservationDao.updatePayement(reservationID, con, "cancel");
			   
		       
			   HttpSession session2 = request.getSession();
		       String username = (String)session2.getAttribute("username");
		       String hotel = reservationDao.getCertainReservationAndHotel(con, reservationID);
		       String adminEmail = userDao.getAdminForHotel(con, hotel);
		
			   reservationDao.cancelReservation( con, reservationID);
		       String confirmationMessage = "Dear Admin,\n Client: "+username+" just canceled a reservation, ID: "+reservationID;
		       
		       EmailSender.SendCancelMail(confirmationMessage, adminEmail);
		       String roomNumber  = roomDao.getroomFromReservation(reservationID, con);
		       
		       
		       roomDao.updateReserved(roomNumber, con,"false"); //
		       

		    	
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		response.sendRedirect("viewUserReservations.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
