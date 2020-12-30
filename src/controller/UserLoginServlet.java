package controller;

import java.io.IOException;

import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.UserDao;

/**
 * Servlet implementation class UserLoginServlet
 */
@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
			String email=request.getParameter("email");
			System.out.println(email);
		
			
		
			String password=request.getParameter("password");
			System.out.println(password);
			
	

			if(UserDao.validate(email, password))
			{
				
				HttpSession session=request.getSession();
				
				session.setAttribute("email",email);
				
				
				
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Login  sucessfully..');");
				   out.println("location='UserHome.jsp';");
				   out.println("</script>");
			}
			else {
				
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Incorrect Details..');");
				   out.println("location='UserLogin.jsp';");
				   out.println("</script>");
			}
		
		}
}
