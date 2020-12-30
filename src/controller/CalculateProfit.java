package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dbConnect.Dbconnection;

/**
 * Servlet implementation class CalculateProfit
 */
@WebServlet("/CalculateProfit")
public class CalculateProfit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		System.out.println("Hello...");
		String Datee=request.getParameter("date");
		String BusDetails1=request.getParameter("BusDetails");
		System.out.println(Datee);
		System.out.println(BusDetails1);
		
		try {
			
			Connection con=Dbconnection.getConnection();
			//String query="";

			System.out.println("");
			System.out.println("Hello...");
			Statement smt=con.createStatement();
			ResultSet rs=smt.executeQuery("select count(sendbusrouterequest.Rid) from sendbusrouterequest inner join sendbusroute ON sendbusrouterequest.Rid=sendbusroute.Rid where sendbusrouterequest.Datee='"+Datee+"' and sendbusroute.BusDetails='"+BusDetails1+"';");
			//PreparedStatement pst=con.prepareStatement();
					
			//ResultSet rs=pst.getGeneratedKeys()
			//System.out.println(rs.next());
			System.out.println("Before loop");	
			while(rs.next())
			{
			
				
			String CountRequest1=rs.getString(1);
			
			System.out.println("In loop");				
			System.out.println("Count:"+CountRequest1);
			
			HttpSession s=request.getSession();
			s.setAttribute("CountRequest1", CountRequest1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
			String Date=request.getParameter("date");
			String BusDetails=request.getParameter("BusDetails");
			HttpSession ss=request.getSession(false);
			String CountRequest=(String)ss.getAttribute("CountRequest1");
			System.out.println(Date);
			System.out.println(BusDetails);
			
			
			Connection con1=Dbconnection.getConnection();
			String qry="insert into busrequestcount(BusDetails,Date,CountRequest) values(?,?,?)";
			PreparedStatement ps=con1.prepareStatement(qry);
			ps.setString(1, BusDetails);
			ps.setString(2, Date);
			ps.setString(3, CountRequest);
			int i=ps.executeUpdate();
			if(i>0)
			{
				out.println("<script type=\"text/javascript\">");
				   out.println("alert('request Calculate sucessfully..');");
				   out.println("location='calcuateProfit1.jsp';");
				   out.println("</script>");
			}
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		
	}

}
