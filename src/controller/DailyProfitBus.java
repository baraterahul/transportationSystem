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
 * Servlet implementation class DailyProfitBus
 */
@WebServlet("/DailyProfitBus")
public class DailyProfitBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		/*id, RID, StartPoint, EndPoint, RTypee, Datee, KMM, TicketPrice, RCountt, DiselPricee, BusAvaragee, TotalProfitt*/
		String RID=request.getParameter("RID");
		String StartPoint=request.getParameter("StartPoint");
		String EndPoint=request.getParameter("EndPoint");
		String RTypee=request.getParameter("RTypee");
		String Datee=request.getParameter("Datee");
		String KMM=request.getParameter("KMM");
		String TicketPrice=request.getParameter("TicketPrice");
		String RCountt=request.getParameter("RCountt");
		String DiselPricee=request.getParameter("DiselPricee");
		String BusAvaragee=request.getParameter("BusAvaragee");
		String BusDetails=request.getParameter("BusDetails");
		String toll=request.getParameter("toll");
		String expenditure=request.getParameter("expenditure");
		
		System.out.println(RID);
		System.out.println(StartPoint);
		System.out.println(EndPoint);
		System.out.println(RTypee);
		System.out.println(Datee);
		System.out.println(KMM);
		System.out.println(TicketPrice);
		System.out.println(RCountt);
		System.out.println(DiselPricee);
		System.out.println(BusAvaragee);
		System.out.println(BusDetails);
		System.out.println(toll);
		System.out.println(expenditure);
		
		int Dprice=Integer.parseInt(DiselPricee);
		int TicketPrice1=Integer.parseInt(TicketPrice);
		int Rc=Integer.parseInt(RCountt);
		int kmm=Integer.parseInt(KMM);
		int BusAvg=Integer.parseInt(BusAvaragee);
		int Exp=(kmm/BusAvg);
		System.out.println(Exp);
		
		int Expenditure=Exp * Dprice;
		System.out.println(Expenditure);
		
		int TotalIncome=Rc * TicketPrice1;
		System.out.println(TotalIncome);
		
		int toll1=Integer.parseInt(toll);
		System.out.println(toll1);
		
		int expp1=Integer.parseInt(expenditure);
		System.out.println(expp1);
		
		int totalex=toll1 + expp1;
		System.out.println(totalex);
		
		int TotalProfite=TotalIncome -Expenditure;
		System.out.println(TotalProfite);
		
		int TotalProfitee=TotalProfite-totalex;
		System.out.println(TotalProfitee);
		
		
		
		
		
		try {
			
			Connection con=Dbconnection.getConnection();
			String query="insert into calculateprice (RID,StartPoint,EndPoint,RTypee,Datee,KMM,TicketPrice,RCountt,DiselPricee,BusAvaragee,Expenditure,TotalIncome,TotalProfitee,BusDetails) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, RID);
			ps.setString(2, StartPoint);
			ps.setString(3, EndPoint);
			ps.setString(4, RTypee);
			ps.setString(5, Datee);
			ps.setString(6, KMM);
			ps.setString(7, TicketPrice);
			ps.setString(8, RCountt);
			ps.setString(9, DiselPricee);
			ps.setString(10, BusAvaragee);
			ps.setInt(11, Expenditure);
			ps.setInt(12, TotalIncome);
			ps.setDouble(13, TotalProfitee);
			ps.setString(14, BusDetails);
			int i=ps.executeUpdate();
			if(i>0)
			 {
				  out.println("<script type=\"text/javascript\">");
				   out.println("alert('Profit Calculate sucessfully..');");
				   out.println("location='DepoManagerHome.jsp';");
				   out.println("</script>");
				 }
				 else
				 {
					 out.println("<script type=\"text/javascript\">");
					   out.println("alert('Incorrect details..');");
					   out.println("location='CalculateBusProfit.jsp';");
					   out.println("</script>");
				 }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
