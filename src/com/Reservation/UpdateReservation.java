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



import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hotel.*;
import com.room.*;
import com.user.*;

/**
 * Servlet implementation class UpdateReservation
 */
@WebServlet("/UpdateReservation")
public class UpdateReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReservation() {
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

			String Datefrom = request.getParameter("from");
			java.sql.Date from = hotelDao.sqlDateConverter(Datefrom);	

			String Dateto = request.getParameter("to");
			java.sql.Date to = hotelDao.sqlDateConverter(Dateto);

			String reservationID = request.getParameter("reservationID");//


			int adults = Integer.parseInt(request.getParameter("adults")); 
			int children = Integer.parseInt(request.getParameter("children"));

			System.out.println(  from +" "+ to+" "+ adults+" "+children);

			
			String queryUpdate = "update Reservation set fromDate=?, toDate=?, adults=?, children=? where reservationID ='"+ reservationID+"'";
			java.sql.PreparedStatement stmt = null;
			stmt = con.prepareStatement(queryUpdate);
			stmt.setDate(1, from);
			stmt.setDate(2, to);
		    stmt.setInt(3, adults);
		    stmt.setInt(4,children);
			stmt.executeUpdate();
		    	response.sendRedirect("viewUserReservations.jsp"); 
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
