<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bus-Transportation-System</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">

    <link rel="stylesheet" href="css/style.css">

    <link rel="icon" href="Favicon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light navbar-laravel">
    <div class="container">
        <a class="navbar-brand" href="#">Calculate Bus Profit</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="DepoManagerLogout">Logout</a>
                </li>
              
            </ul>

        </div>
    </div>
</nav>
<!-- 
id, StartLocation, StartTime, EndLocation, EndTime -->
<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Calculate Bus Requests</div>
                    <div class="card-body">
                        <form action="CalculateProfit" method="post">
                        <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Select Date</label>
                                <div class="col-md-6">
                                   <input type="text" name="date" class="form-control" placeholder="day/month/year.format" required>
                                </div>
                            </div>
                         <%

  
				String qry = "select * from busdataset";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
												
													%>
													
													<%
													ResultSet rset = pst.executeQuery(); 
													%>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Enter Bus Details</label>
                                <div class="col-md-6">
                                 <select class="form-control" name="BusDetails">
                                  <% 
								
								  while(rset.next())
							
								 {%>
                        <option value="BusId-<%=rset.getString(1)%>,BusNo-<%=rset.getString(2)%>,DriverName-<%=rset.getString(3)%>,ConductorName-<%=rset.getString(4)%>">BusId-<%=rset.getString(1)%>,BusNo-<%=rset.getString(2)%>,DriverName-<%=rset.getString(3)%>,ConductorName-<%=rset.getString(4)%></option>
                       <%}%>
                                </select>
                                </div>
                            </div>
                            
                            
                            
                             
                            

                            <div class="col-md-6 offset-md-4">
                              
                                  <input type="submit" value="Calculate request" class="btn btn-primary" onclick="return Validate()">
                                       
                                
                            </div>
                            
                            </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
 

</main>
</body>
</html>