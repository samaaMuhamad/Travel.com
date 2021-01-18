package com.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
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
import com.others.EmailSender;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			response.setContentType("text/html;charset=UTF-8");
			try {
				   Connection con = DBConnection.initializeDB();
				   UserDao userDao = new UserDao();
				   
				   String name = request.getParameter("name");
			       String username = request.getParameter("username");
			       String email = request.getParameter("email");
			       String mobile = request.getParameter("mobile");
			       String hotelName = request.getParameter("hotel");
			       String password = userDao.generatePasswordint(8);
			       
		       String confirmationMessage = "Dear " +name+",\n Your Password : "+password;
			       
			       EmailSender.SendPasswordMail(email, confirmationMessage);
			       
			       System.out.println(confirmationMessage);
			       String type = request.getParameter("type");
			     
			       User user = new User( name,username, mobile, password, email, type,hotelName) ;

			   		
			       userDao.registerUser(user, con);
			    		   
			       RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
			    	PrintWriter out1 = response.getWriter();
			    	out1.println("<html> <script>  alert(\"A temporary password is sent to your email.Use it to login.\"); </script> </html>");
			    	rd.include(request, response);
			    	 
			} catch (ClassNotFoundException | SQLException e) {
				
				e.printStackTrace();
			}
			//    	
//		try {
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection Con = null;
//	    Statement Stmt = null;
//	    //java.sql.PreparedStatement ps = null ;
//	    ResultSet rs = null;
//	    
//			try {
//				Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "Nada-2000");
//			
//	       
//       String name = request.getParameter("name");
//       String username = request.getParameter("username");
//       String email = request.getParameter("email");
//       String mobile = request.getParameter("mobile");
//       String password = "nada2000";
//       String type = "client";
//       
//       String query3 = " insert into user (username, name, password, email, mobile, type)"
//		        + " values (?, ?, ?, ?, ?, ?)";
//
//		      
//		      PreparedStatement preparedStmt = (PreparedStatement) Con.prepareStatement(query3);
//		      preparedStmt.setString (1, username);
//		      preparedStmt.setString (2, name);
//		      preparedStmt.setString  (3, password);
//		      preparedStmt.setString(4, email);
//		      preparedStmt.setString(5, mobile);
//		      preparedStmt.setString(6, type);
//
//		      
//
//		      // execute 
//		      preparedStmt.execute();
//		      response.sendRedirect("EXISTS.html");
//			} catch (SQLException e) {
//				
//				e.printStackTrace();
//			}
//		
//			} catch (ClassNotFoundException e) {
//				
//				e.printStackTrace();
//			}
		     // response.sendRedirect("EXISTS.html");
    	
       
       //Con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hotel", "root", "Nada-2000");
      // Stmt= Con.createStatement();
      // rs = Stmt.executeQuery(query);
       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
