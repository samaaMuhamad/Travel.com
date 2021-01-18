package com.others;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.PreparedStatement;
import com.user.DBConnection;

/**
 * Servlet implementation class Uploadphoto
 */
@WebServlet("/Uploadphoto")
public class Uploadphoto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uploadphoto() {
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
			   
			   String hotelname = request.getParameter("hotelName");
			   System.out.println(hotelname);
			   String path = request.getParameter("getFile");
			  
			   String sql = " insert into images (path, hotel) values (?, ?)";
		         PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(sql);
		         preparedStmt.setString (1,path);
		         preparedStmt.setString (2, hotelname);
		         preparedStmt.execute();
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
