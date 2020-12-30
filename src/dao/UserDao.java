package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;



public class UserDao {
	public static boolean validate(String email,String password)
	{
		boolean status=false;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Registered....");
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport","root","root");
			System.out.println("Connection established....");
			PreparedStatement pst=conn.prepareStatement("select email,password from user_register where email=? and password=?");
			pst.setString(1, email);
			pst.setString(2, password);
			java.sql.ResultSet rs=pst.executeQuery();
			status=rs.next();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		
		return status;
	}



}


