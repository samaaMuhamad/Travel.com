package com.others;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.Reservation.Reservation;
import com.Reservation.ReservationDao;
import com.hotel.HotelDao;
import com.room.RoomDao;
import com.user.DBConnection;

/**
 * Servlet implementation class Deletephoto
 */
@WebServlet("/Deletephoto")
public class Deletephoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deletephoto() {
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
			   String path =request.getParameter("path");
				System.out.println(path);
			   java.sql.PreparedStatement pstmt3=con.prepareStatement("DELETE FROM images where path= ?" );
				pstmt3.setString(1,path);
				pstmt3.executeUpdate();

			
		    	response.sendRedirect("uploadImages.jsp"); 
		} catch (ClassNotFoundException | SQLException e) {
			
			
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
