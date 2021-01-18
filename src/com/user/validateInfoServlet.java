package com.user;

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
/**
 * Servlet implementation class validateInfoServlet
 */
@WebServlet("/validateInfoServlet")
public class validateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public validateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("sola");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			Connection con = DBConnection.initializeDB();
			 UserDao userDao = new UserDao();
			   
			
		       String username = request.getParameter("username");
		       String password = request.getParameter("password");
		      // System.out.println("hennnnnaaa");
		       
		       boolean existsInSystem = userDao.validateInfo(username, password,con);
		      // System.out.println("hennnnnaaa");
		       if (existsInSystem == true) {
		    	   HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					 String type = userDao.getType(username, password,con);
					 System.out.println(type);
					 if(type.equalsIgnoreCase("admin")) {
						String hotelName = userDao.getHotelName(username,con);
						session.setAttribute("hotelName", hotelName);
						System.out.println(hotelName);
						RequestDispatcher requestDispatcher;
						requestDispatcher = request.getRequestDispatcher("HomePage.jsp");
						requestDispatcher.forward(request, response);
					 }
					 else if(type.equalsIgnoreCase("client")) {
							RequestDispatcher requestDispatcher;
							requestDispatcher = request.getRequestDispatcher("HomePageClient.jsp");
							requestDispatcher.forward(request, response);
					}

				} else {
					RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
	            	PrintWriter out1 = response.getWriter();
	            	out1.println("<html> <script>  alert(\"Either the username or password is wrong. Please enter data again..\"); </script> </html>");
	            	rd.include(request, response);    		
				}
		       
		       
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		  
	       
	      
	   		
	       
	    		   
	    	 
	}

}
