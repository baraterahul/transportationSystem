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

import dbConnect.Dbconnection;

/**
 * Servlet implementation class AddBusInformation
 */
@WebServlet("/AddBusInformation")
public class AddBusInformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		String BusNo=request.getParameter("BusNo");
		System.out.println(BusNo);
		
		String DriverName=request.getParameter("DriverName");
		System.out.println(DriverName);
		
		String Conductor=request.getParameter("Conductor");
		System.out.println(Conductor);
		
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into busdataset(BusNo, DriverName, Conductor) values (?,?,?)";

		PreparedStatement pst;

		pst =con.prepareStatement(query);
			  pst.setString(1,BusNo);
			  pst.setString(2,DriverName);
			  pst.setString(3,Conductor);
			 
			
			  
			 // id, BusNo, DriverName, Conductor
			 int i= pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Bus Details add sucessfully..');");
			   out.println("location='DepoManagerHome.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('incorrect details..');");
				   out.println("location='AddBusDtails.jsp';");
				   out.println("</script>");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	}

}
