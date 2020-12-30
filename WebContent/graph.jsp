<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>
<html>
<head>
<style>
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
}

li {
  float: left;
}

li a {
  display: block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover {
  background-color: #111;
}
</style>
<ul>
  <li><a class="active" href="ViewBusProfit.jsp">Back</a></li>
   <li><a class="active" href="DepoManagerLogout">Logout</a></li>
  
</ul>
<%
	
	  
		String id = (request.getParameter("id"));
		if (id != null) {
			String str = "select * from calculateprice where id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport", "root", "root");

			PreparedStatement ps = co.prepareStatement(str);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String expenditure=rs.getString(12);
				System.out.println(expenditure);
				
				String TotalIncome=rs.getString(13);
				System.out.println(TotalIncome);
				String TotalProfit=rs.getString(14);
				System.out.println(TotalProfit);
	%>
	<script type="text/javascript">
	
	var expenditure=[<%=rs.getString(12)%>];
	var TotalIncome=[<%=rs.getString(13)%>];
	var TotalProfit=[<%=rs.getString(14)%>];
	
	</script>
	
	


<script>
window.onload = function () {

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	theme: "light2", // "light1", "light2", "dark1", "dark2"
	title: {
		text: "Calculate Bus Profit Representation"
	},
	axisY: {
		title: "Profit in (in Rs)",
		suffix: "Rs",
		includeZero: false
	},
	axisX: {
		title: "Calculate Bus Profit Representation"
	},
	data: [{
		type: "column",
		yValueFormatString: "#,##0.0#\"%\"",
		dataPoints: [
			{ label: "expenditure", y: <%=rs.getString(12)%> },	
			{ label: "TotalIncome", y: <%=rs.getString(13)%> },	
			{ label: "TotalProfit", y: <%=rs.getString(14)%>},
				
			
			
		]
	}]
});
chart.render();

}
</script>
<%
				}
				}

				else {
					System.out.println("sorry");
				}
			%>
</head>
<body>
<div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</body>
</html>