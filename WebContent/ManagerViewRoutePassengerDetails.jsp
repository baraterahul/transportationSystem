<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BusTransportationSystem</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
a {
  text-decoration: none;
  display: inline-block;
  padding: 8px 16px;
}

a:hover {

  background-color: #ddd;
  color: black;
}

.previous {
  background-color: #f1f1f1;
  color: black;
}

.next {
  background-color: #4CAF50;
  color: white;
}

.round {
  border-radius: 50%;
}
</style>
</head>
<body>
<div class="container">
  <h2>View Bus Route Details</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="ownerhome.jsp" class="previous">&laquo; Back</a>

  <a href="DepoManagerLogout" class="previous">&laquo; Logout</a>
  
  <%
	String id=(request.getParameter("id"));
  System.out.print(id);
  Date date = new Date();  
  SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
  String Dateee = formatter.format(date);  
  System.out.println("Date Format with MM/dd/yyyy : "+Dateee); 
  
						String qry = "select * from busroutedetails where Rid='"+id+"'";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
													
													%>
													
													<%
													ResultSet rset = pst.executeQuery(); 
													%>
													
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      <th>Request Id</th>
        <th>Start Point</th>
        <th>Starting Time</th>
        <th>End Route Of Bus</th>
        <th>End Time</th>
        <th>College/Office</th>
         <th>Address</th>
          <th>Student/Employee Count</th>
          <th>Opening Time</th>
          <th>Closing Time</th>
      </tr>
    </thead>
   
    <tbody id="myTable">
      <% 
								 
							
								  while(rset.next())
									  
									
								 
								 {%>
								 <tr>
									<th scope="row"><%=rset.getString(2)%></th>
									<th><%=rset.getString(3)%></th>
									<th><%=rset.getString(4)%></th>
									<th><%=rset.getString(5)%></th>
								
									<th><%=rset.getString(6)%></th>
								<th><%=rset.getString(7)%></th>
								<th><%=rset.getString(8)%></th>
									
									<th><%=rset.getString(9)%></th>
									<th><%=rset.getString(10)%></th>
									<th><%=rset.getString(11)%></th>
									<%}%>
								  </tr>
    </tbody>
  </table>
  
  
</div>

<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
</body>
</html>