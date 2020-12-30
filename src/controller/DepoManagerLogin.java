package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DepoManagerLogin
 */
@WebServlet("/DepoManagerLogin")
public class DepoManagerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String Username=request.getParameter("email");
		System.out.println(Username);
		String Password=request.getParameter("password");
		System.out.println(Password);
	
			
			if(Username.equals("admin@gmail.com") && Password.equals("12345"))
			{
				
				
				
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Login sucessfully..');");
				   out.println("location='DepoManagerHome.jsp';");
				   out.println("</script>");
			}
			else
			{
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('Incorrect details..');");
				   out.println("location='BusDepoManagerLogin.jsp';");
				   out.println("</script>");	
			}
		
	}
	}
