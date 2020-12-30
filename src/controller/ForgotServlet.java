package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dbConnect.Dbconnection;
import controller.Mailer;
import controller.MyStringRandomGen;

/**
 * Servlet implementation class ForgotServlet
 */
@WebServlet("/ForgotServlet")
public class ForgotServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgotServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		PrintWriter out=response.getWriter();
		try
		{
		String email=request.getParameter("email");
		Connection con=Dbconnection.getConnection();
		System.out.println(email);
		 MyStringRandomGen mm = new MyStringRandomGen();
		   String res = mm.generateRandomString();
		   session.setAttribute("email", email);
		   PreparedStatement ps=con.prepareStatement("update user_register set password ='"+res+"' where email='"+email+"'");
			ps.executeUpdate();
			Mailer m=new Mailer();
			m.EmailSending(email, "Otp", "OTP : "+res);
			response.sendRedirect("OTP.jsp?success");
		}
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally
		{
			out.close();
		}
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
