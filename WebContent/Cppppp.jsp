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
<%
			
  
  String Rid=request.getParameter("id");
 System.out.print(Rid);
  
						String qry = "select * from sendbusroute where Rid='"+Rid+"'";
									
												Class.forName("com.mysql.jdbc.Driver");
													Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport","root","root");
													PreparedStatement pst=c.prepareStatement(qry);
												
													%>
													
													<%
													ResultSet rset = pst.executeQuery(); 
													
													%>
													<% 
								 
							
								  while(rset.next())
									  
									
								 
								 {%>
    <div class="cotainer">
    
        <div class="row justify-content-center">
            <div class="col-md-9">
            
                <div class="card">
                
                    <div class="card-header">Calculate Bus Profit</div>
                    
                    <div class="card-body">
                    
                        <form action="DailyProfitBus" method="post">
                        				
                        <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Bus Route ID</label>
                                <div class="col-md-6">
                                   <input type="text"  value="<%=rset.getString(2)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                       
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Start Point</label>
                                <div class="col-md-6">
                                  <input type="text" value="<%=rset.getString(3)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">End Point</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(4)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Route Type</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(5)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Date</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(6)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Route Distance</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(7)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Ticket Price</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(8)%>"  name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Request Count</label>
                                <div class="col-md-6">
                                   <input type="text" value="<%=rset.getString(9)%>" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Petrol/Disel Price 1 Litre</label>
                                <div class="col-md-6">
                                   <input type="text"  name="StartTime" class="form-control" required>
                                </div>
                            </div>
                             
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Bus Avarage</label>
                                <div class="col-md-6">
                                   <input type="text"  name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            <%} %>

                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="return Validate()">
                                    Calculate Profit
                                </button>
                                
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