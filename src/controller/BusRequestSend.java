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

/**
 * Servlet implementation class BusRequestSend
 */
@WebServlet("/BusRequestSend")
public class BusRequestSend extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		/*id, StartLocation, StartTime, EndLocation, EndTime, PassengerName, PassengerEmail, Datee*/
		PrintWriter out = response.getWriter();
		
		
		
		String StartLocation=request.getParameter("StartLocation");
		System.out.println(StartLocation);
		
		String StartTime=request.getParameter("StartTime");
		System.out.println(StartTime);
		
		String EndLocation=request.getParameter("EndLocation");
		System.out.println(EndLocation);
		
		String EndTime=request.getParameter("EndTime");
		System.out.println(EndTime);
		
		String PassengerName=request.getParameter("PassengerName");
		System.out.println(PassengerName);
		
		String PassengerEmail=request.getParameter("PassengerEmail");
		System.out.println(PassengerEmail);
		
		String ptype=request.getParameter("ptype");
		System.out.println(ptype);
		
		 Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    String Datee = formatter.format(date);  
		    System.out.println("Date Format with MM/dd/yyyy : "+Datee);
		    
		    String Rid=request.getParameter("Rid");
			System.out.println(Rid);
		
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into sendbusrouterequest(StartLocation,StartTime,EndLocation,EndTime,PassengerName,PassengerEmail,Datee,ptype,Rid) values (?,?,?,?,?,?,?,?,?)";

		PreparedStatement pst;

		pst = (PreparedStatement) con.prepareStatement(query);
			  pst.setString(1,StartLocation);
			  pst.setString(2,StartTime);
			  pst.setString(3,EndLocation);
			  pst.setString(4,EndTime);
			  pst.setString(5,PassengerName);
			  pst.setString(6,PassengerEmail);
			  pst.setString(7,Datee);
			  pst.setString(8,ptype);
			  pst.setString(9,Rid);
			 int i= pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Request Send  sucessfully..');");
			   out.println("location='UserHome.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert(' Request Not Send..');");
				   out.println("location='SendRequest.jsp';");
				   out.println("</script>");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	}
		
		
	}


