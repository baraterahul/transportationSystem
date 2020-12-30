package controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbConnect.Dbconnection;


@WebServlet("/SendBusAtRoute")
public class SendBusAtRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		/*id, StartLocation, StartTime, EndLocation, EndTime, PassengerName, PassengerEmail, Datee*/
		PrintWriter out = response.getWriter();
	//	id, Rid, StartLocation, StartTime, EndLocation, EndType, RouteType, BusDetails
		String Rid=request.getParameter("Rid");
		System.out.println(Rid);
		
		String StartLocation=request.getParameter("StartLocation");
		System.out.println(StartLocation);
		
		String StartTime=request.getParameter("StartTime");
		System.out.println(StartTime);
		
		String EndLocation=request.getParameter("EndLocation");
		System.out.println(EndLocation);
		
		String EndType=request.getParameter("EndType");
		System.out.println(EndType);
		
		String RouteType=request.getParameter("RouteType");
		System.out.println(RouteType);
		
		String BusDetails=request.getParameter("BusDetails");
		System.out.println(BusDetails);
		
		 Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    String Datee = formatter.format(date);  
		    System.out.println("Date Format with MM/dd/yyyy : "+Datee);
		    
		    String KM=request.getParameter("KM");
			System.out.println(KM);
			
			String Price=request.getParameter("Price");
			System.out.println(Price);
			
			String RCount=request.getParameter("RCount");
			System.out.println(RCount);
		
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into sendbusroute(Rid, StartLocation, StartTime, EndLocation, EndType, RouteType, BusDetails, Datee, KM, Price,RCount) values (?,?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement pst;
		//id, Rid, StartLocation, StartTime, EndLocation, EndType, RouteType, BusDetails, Datee
		pst = (PreparedStatement) con.prepareStatement(query);
			  pst.setString(1,Rid);
			  pst.setString(2,StartLocation);
			  pst.setString(3,StartTime);
			  pst.setString(4,EndLocation);
			  pst.setString(5,EndType);
			  pst.setString(6,RouteType);
			  pst.setString(7,BusDetails);
			  pst.setString(8,Datee);
			  pst.setString(9,KM);
			  pst.setString(10,Price);
			  pst.setString(11,RCount);
			  
			 int i= pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Bus  Send  sucessfully..');");
			   out.println("location='DepoManagerHome.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert(' Incorrect details..');");
				   out.println("location='SendRequiredBusAtRoute.jsp';");
				   out.println("</script>");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
