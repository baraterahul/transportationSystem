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


@WebServlet("/ManagerAddRoute")
public class ManagerAddRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		String StartLocation=request.getParameter("StartLocation");
		System.out.println(StartLocation);
		
		String StartTime=request.getParameter("StartTime");
		System.out.println(StartTime);
		
		String EndLocation=request.getParameter("EndLocation");
		System.out.println(EndLocation);
		
		String EndTime=request.getParameter("EndTime");
		System.out.println(EndTime);
		
		String RouteType=request.getParameter("RouteType");
		System.out.println(RouteType);
		
		String KM=request.getParameter("KM");
		System.out.println(KM);
		
		String Price=request.getParameter("Price");
		System.out.println(Price);
	
		
		
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into busroute(StartLocation, StartTime, EndLocation, EndTime, RouteType, KM, Price) values (?,?,?,?,?,?,?)";

		PreparedStatement pst=con.prepareStatement(query);
			  pst.setString(1,StartLocation);
			  pst.setString(2,StartTime);
			  pst.setString(3,EndLocation);
			  pst.setString(4,EndTime);
			  pst.setString(5,RouteType);
			  pst.setString(6,KM);
			  pst.setString(7,Price);
          

		int i=pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Bus Route Added sucessfully..');");
			   out.println("location='AddBusRoute.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Incorrect details..Please Insert accurate information');");
				   out.println("location='AddBusRoute.jsp';");
				   out.println("</script>");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	}
	}


