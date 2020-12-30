package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import dbConnect.Dbconnection;

/**
 * Servlet implementation class SetPasswordServlet
 */
@WebServlet("/SetPasswordServlet")
public class SetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetPasswordServlet() {
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
		System.out.println("======================== "+email);
		String newpassword=request.getParameter("new");
		String conpassword=request.getParameter("confirm");
		System.out.println(newpassword);
		System.out.println(conpassword);
		Connection con =Dbconnection.getConnection();
		
		if(newpassword.equals(conpassword))
		{
			PreparedStatement ps=con.prepareStatement("update user_register set password='"+newpassword+"', vpassword='"+newpassword+"' where email='"+email+"'");
			ps.executeUpdate();
			

			response.sendRedirect("index.jsp");
		//out.println("Password changed successfully");
		}
		else
		{
			//out.println("Invalid confirm Password");
			response.sendRedirect("setpassword.jsp?err");
		}}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		

		

		
		
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

}
