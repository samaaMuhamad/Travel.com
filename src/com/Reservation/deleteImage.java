package com.Reservation;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.DBConnection;

/**
 * Servlet implementation class deleteImage
 */
@WebServlet("/deleteImage")
public class deleteImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteImage() {
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
