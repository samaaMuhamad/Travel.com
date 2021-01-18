package com.hotel;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DBConnection;




/**
 * Servlet implementation class updateHotel
 */
@WebServlet("/updateHotel")
public class updateHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateHotel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Connection conn;
		try {
			conn = DBConnection.initializeDB();
			HotelDao hotelDao = new HotelDao();
			HttpSession session = request.getSession();
			String name =(String)session.getAttribute("hotelName");
		 
	String location = request.getParameter("location");
	String contactInformation = request.getParameter("contactInformation");
	String hotelFacilities = request.getParameter("hotelFacilities");
	String otherBranches = request.getParameter("otherBranches");
	String meals = request.getParameter("meals");
	float rating= Float.parseFloat(request.getParameter("rating"));
	int stars = Integer.parseInt(request.getParameter("stars"));

	Hotel hotel = new Hotel(name, location, contactInformation, hotelFacilities,otherBranches, meals, rating, stars);
	if(location != null && contactInformation != null && hotelFacilities != null && otherBranches != null && meals != null ){
		try {
			hotelDao.updateHotelInfo(hotel, conn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 RequestDispatcher rd = getServletContext().getRequestDispatcher("/updateHotel.jsp");
	    	PrintWriter out1 = response.getWriter();
	    	out1.println("<html> <script>  alert(\"Hotel is Updated SUCCESSFULLY \"); </script> </html>");
	    	rd.include(request, response);
	}
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
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
