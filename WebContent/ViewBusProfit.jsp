<%@page import="java.sql.*" %>
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
  <h2>Depo_Manager View Bus Profit</h2>
  <p></p>  
 
   
  <input class="form-control" id="myInput" type="text" placeholder="Search..">
  <br>
  
 <a href="DepoManagerHome.jsp" class="previous">&laquo; Back</a>

  <a href="DepoManagerLogout" class="previous">&laquo; Logout</a>
  
  <%
			
  
  
						String qry = "select * from calculateprice";
									
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
      <th>Id</th>
        <th>Rid</th>
        <th>Starting Point</th>
       
        <th>EndLocation</th>

         <th>Datee</th>
          <th>KMM</th>
           <th>TicketPrice</th>
            <th>RCountt</th>
            <!--  <th>DiselPricee</th>
              <th>BusAvaragee</th> -->
               <th>Expenditure</th>
                <th>TotalIncome</th>
                 <th>TotalProfitee</th>
                  <th>BusDetails</th>
                    <th>Graph Result</th>
         
   <!--  id, RID, StartPoint, EndPoint, RTypee, Datee, KMM, TicketPrice, RCountt, 
   DiselPricee, BusAvaragee, Expenditure, TotalIncome, TotalProfitee, BusDetails -->
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
								
									
								<th><%=rset.getString(6)%></th>
								<th><%=rset.getString(7)%></th>
								<th><%=rset.getString(8)%></th>
								<%-- <th><%=rset.getString(9)%></th>
								<th><%=rset.getString(10)%></th> --%>
								<th><%=rset.getString(11)%></th>
								<th><%=rset.getString(12)%></th>
								<th><%=rset.getString(13)%></th>
								<th><%=rset.getString(14)%></th>
								<th><%=rset.getString(15)%></th>
									<td><a href="graph.jsp?id=<%=rset.getString(1)%>">Graph</a></td>
									
									
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