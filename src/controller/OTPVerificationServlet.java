package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dbConnect.Dbconnection;

/**
 * Servlet implementation class OTPVerificationServlet
 */
@WebServlet("/OTPVerificationServlet")
public class OTPVerificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OTPVerificationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		try{
		
		String email=(String)session.getAttribute("email");
		
		String password=request.getParameter("password");
		System.out.println(email);
		System.out.println(password);
		
		Connection con = Dbconnection.getConnection();
		PreparedStatement ps=con.prepareStatement("select * from user_register where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		if(rs.next())
		{
			
			
				response.sendRedirect("SetPassword.jsp");
				
			}
			else{
				response.sendRedirect("OTP.jsp?err");
			    }
		 
		
		
	}	 catch (Exception e) 
	{
		e.printStackTrace();
	} 

	

	}

	

}
