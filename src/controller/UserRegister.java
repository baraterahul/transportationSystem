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


@WebServlet("/UserRegister")
public class UserRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		
		String fname=request.getParameter("fname");
		System.out.println(fname);
		
		String lname=request.getParameter("lname");
		System.out.println(lname);
		
		String dob=request.getParameter("dob");
		System.out.println(dob);
		
		String email=request.getParameter("email");
		System.out.println(email);
		
		String address=request.getParameter("address");
		System.out.println(address);
		
		String password=request.getParameter("password");
		System.out.println(password);
		
		String vpassword=request.getParameter("vpassword");
		System.out.println(vpassword);
		try {
			Connection con=Dbconnection.getConnection();

		String query = "insert into user_register(fname,lname,dob,email,address,password,vpassword) values (?,?,?,?,?,?,?)";

		PreparedStatement pst;

		pst = (PreparedStatement) con.prepareStatement(query);
			  pst.setString(1,fname);
			  pst.setString(2,lname);
			  pst.setString(3,dob);
			  pst.setString(4,email);
			  pst.setString(5,address);
			  pst.setString(6,password);
			  pst.setString(7,vpassword);
			  
			  
			 int i= pst.executeUpdate();
			 
			 if(i>0)
			 {
			  out.println("<script type=\"text/javascript\">");
			   out.println("alert('register sucessfully..');");
			   out.println("location='UserLogin.jsp';");
			   out.println("</script>");
			 }
			 else
			 {
				 out.println("<script type=\"text/javascript\">");
				   out.println("alert('Not register..');");
				   out.println("location='UserRegister.jsp';");
				   out.println("</script>");
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
	     
	}

}
