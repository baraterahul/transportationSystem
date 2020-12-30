<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RealEstateAgency</title>
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
  <h2>View Propert Details</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="ownerhome.jsp" class="previous">&laquo; Back</a>

  <a href="Logout" class="previous">&laquo; Logout</a>
  
  <%
			
  HttpSession session1=request.getSession(false);
  String mail=(String)session1.getAttribute("sessionmail");
  
						String qry = "select id,First,Last,DOB,Email,Address,MobileNo,Flat,Price from propertydetails where ownermail=?";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/realestate","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
													
													pst.setString(1, mail);
													%>
													
													<%
													ResultSet rset = pst.executeQuery(); 
													%>
													
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
      <th>Id</th>
        <th>Firstname</th>
        <th>Lastname</th>
        <th>DOB</th>
        <th>Email</th>
        <th>Address</th>
        <th>MobileNo</th>
        <th>Flat Type</th>
        <th>Price</th>
        <th>Update</th>
        <th>Delete</th>
      </tr>
    </thead>
   
    <tbody id="myTable">
      <% 
								 
							
								  while(rset.next())
									  
									
								 
								 {%>
								 <tr>
									<th scope="row"><%=rset.getString(1)%></th>
									<th><%=rset.getString(2)%></th>
									<th><%=rset.getString(3)%></th>
									<th><%=rset.getString(4)%></th>
								
									<th><%=rset.getString(5)%></th>
									<th><%=rset.getString(6)%></th>
									<th><%=rset.getString(7)%></th>
									
									<th><%=rset.getString(8)%></th>
								<th><%=rset.getString(9)%></th>
									<td><a href="update.jsp?id=<%=rset.getString(1)%>">Update</a></td>
									<td><a href="delete.jsp?id=<%=rset.getString(1)%>">Delete</a><%%></td>
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