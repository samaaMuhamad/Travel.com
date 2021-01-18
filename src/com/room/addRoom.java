package com.room;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.DBConnection;



/**
 * Servlet implementation class addRoom
 */
@WebServlet("/addRoom")
public class addRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addRoom() {
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
			   
			   RoomDao roomDao = new RoomDao();
			   HttpSession session = request.getSession();
				
			   String type = request.getParameter("type");
		       String number = request.getParameter("roomNumber");
		       String facilities = request.getParameter("roomFacilities");
		       String start = request.getParameter("startAvDate");
		       String end = request.getParameter("endAvDate");
		       String hotel =(String)session.getAttribute("hotelName");
		       System.out.println(hotel);
		       String reserved = "false";
		       
		       Room room = new Room(type, number, facilities, start, end, hotel, reserved);
		   		
		       roomDao.addRoom(room, con);
		       
		       RequestDispatcher rd = getServletContext().getRequestDispatcher("/addRoom.jsp");
           	PrintWriter out1 = response.getWriter();
           	out1.println("<html> <script>  alert(\"Room is Added SUCCESSFULLY \"); </script> </html>");
           	rd.include(request, response);
		    		   
		    	//response.sendRedirect("signIn.html"); 
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
