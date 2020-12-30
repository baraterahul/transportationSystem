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
 * Servlet implementation class ManagerAddRouteDetails
 */
@WebServlet("/ManagerAddRouteDetails")
public class ManagerAddRouteDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerAddRouteDetails() {
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
		
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		String Rid=request.getParameter("Rid");
		System.out.println(Rid);
		
		String StartLocation=request.getParameter("StartLocation");
		System.out.println(StartLocation);
		
		String StartTime=request.getParameter("StartTime");
		System.out.println(StartTime);
		
		String EndLocation=request.getParameter("EndLocation");
		System.out.println(EndLocation);
		
		String EndTime=request.getParameter("EndTime");
		System.out.println(EndTime);
		/*id, Rid, StartLocation, StartTime, EndLocation, EndTime, CollegeName, CollegeAddress, Count, OpenTime, CloseTime*/
		String CollegeName=request.getParameter("CollegeName");
		System.out.println(CollegeName);
		
		String CollegeAddress=request.getParameter("CollegeAddress");
		System.out.println(CollegeAddress);
		
		String Count=request.getParameter("Count");
		System.out.println(Count);
		
		String OpenTime=request.getParameter("OpenTime");
		System.out.println(OpenTime);
		
		String CloseTime=request.getParameter("CloseTime");
		System.out.println(CloseTime);
		
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into busroutedetails(Rid, StartLocation, StartTime, EndLocation, EndTime, CollegeName, CollegeAddress, Count, OpenTime, CloseTime) values (?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement pst=con.prepareStatement(query);
			  pst.setString(1,Rid);
			  pst.setString(2,StartLocation);
			  pst.setString(3,StartTime);
			  pst.setString(4,EndLocation);
			  pst.setString(5,EndTime);
			  pst.setString(6,CollegeName);
			  pst.setString(7,CollegeAddress);
			  pst.setString(8,Count);
			  pst.setString(9,OpenTime);
			  pst.setString(10,CloseTime);
			
          

		int i=pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('Bus Details Route Added sucessfully..');");
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
