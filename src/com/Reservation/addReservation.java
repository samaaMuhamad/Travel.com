package com.Reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.concurrent.TimeUnit;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DBConnection;
import com.hotel.*;
import com.room.RoomDao;


/**
 * Servlet implementation class addReservation
 */
@WebServlet("/addReservation")
public class addReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			   Connection con = DBConnection.initializeDB();
			   
			   ReservationDao reservationDao = new ReservationDao();
			   
			   HotelDao hotelDao = new HotelDao();
			   RoomDao roomDao = new RoomDao();
			   
			   String id = Integer.toString(reservationDao.generateReservationID());
			   
			   String DateFrom = request.getParameter("fromDate");
			   java.sql.Date from = hotelDao.sqlDateConverter(DateFrom);	
			   String DateTo = request.getParameter("toDate");
			   java.sql.Date to = hotelDao.sqlDateConverter(DateTo);
			   
			   HttpSession session = request.getSession();
		       String s = (String)session.getAttribute("hotel");//
		       String hotel=s;
		       String client = request.getParameter("username");
		       String payment = "false";//
		       String roomNumber = request.getParameter("roomNumber");//
		      // int adults = (int)session.getAttribute("adults");
		       //int children=(int)session.getAttribute("children");
		       int adults = Integer.parseInt(request.getParameter("adults"));// 
		       int children = Integer.parseInt(request.getParameter("children"));
		       
		       System.out.println("nam: "+client);
		       Reservation reservation = new Reservation(id, from,to,hotel,client,payment , roomNumber, children, adults);
		       reservationDao.addReservation(reservation, con);
		       roomDao.updateReserved(roomNumber, con, "true");

		    	response.sendRedirect("HomePageClient.jsp"); 
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} catch (ParseException e) {
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
