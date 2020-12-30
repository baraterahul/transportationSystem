<%@page import="dbConnect.Dbconnection"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
        <a class="navbar-brand" href="#">Depo-Manager Send Bus Route</a>
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
             <%
		String id = (request.getParameter("id"));
		if (id != null) {
			String str = "select * from busroute where id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport", "root", "root");

			PreparedStatement ps = co.prepareStatement(str);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			
				
	%>
	 <% while (rs.next()) {%>
                <div class="card">
                    <div class="card-header">Send Bus Route</div>
                    <div class="card-body">
                        <form action="SendBusAtRoute" method="post">
                  
                        <div class="form-group row">
                         
                                <label for="email_address" class="col-md-4 col-form-label text-md-right"> RouteId</label>
                                <div class="col-md-6">
                                
                                  <input type="text" name="Rid"  value="<%=rs.getString(1)%>" class="form-control" required>
                                </div>
                            </div>
                        <div class="form-group row">
                         
                                <label for="email_address" class="col-md-4 col-form-label text-md-right"> Starting Point</label>
                                <div class="col-md-6">
                                
                                  <input type="text" name="StartLocation"  value="<%=rs.getString(2)%>" class="form-control" required>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Start Time</label>
                                <div class="col-md-6">
                                  <input type="text" name="StartTime"  value="<%=rs.getString(3)%>" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right"> End Point</label>
                                <div class="col-md-6">
                                  <input type="text" name="EndLocation" value="<%=rs.getString(4)%>" class="form-control" required>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">End Time</label>
                                <div class="col-md-6">
                                  <input type="text" name="EndType" value="<%=rs.getString(5)%>" class="form-control" required>
                                </div>
                            </div>
                       <!--   //   id, Rid, StartLocation, StartTime, EndLocation, EndType, RouteType, BusDetails, Datee -->
                           <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Add Route Type</label>
                                <div class="col-md-6">
                                
                                <input type="text" name="RouteType" value="<%=rs.getString(6)%>" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Distance</label>
                                <div class="col-md-6">
                                
                                <input type="text" name="KM" value="<%=rs.getString(7)%>" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Ticket Price</label>
                                <div class="col-md-6">
                                
                                <input type="text" name="Price" value="<%=rs.getString(8)%>" class="form-control" required>
                                </div>
                            </div>
                            
                            
                           
                            
                            <%
				}
				}

				else {
					System.out.println("sorry");
				}
			%>
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
                            
                            <%
                            
                            String Rid = (request.getParameter("id"));
                            System.out.print(Rid);
                            Connection con=Dbconnection.getConnection();
                			//String query="";
                			
                			 Date date = new Date();  
  SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
  String Dateee = formatter.format(date);  
  System.out.println(Dateee); 

                			System.out.println("");
                			System.out.println("Hello...");
                			Statement smt=con.createStatement();
                			ResultSet rs=smt.executeQuery("select count(sendbusrouterequest.Rid) from sendbusrouterequest where Rid='"+Rid+"' and Datee='"+Dateee+"'  ;");
                			
                			System.out.println("Before loop");	
                			while(rs.next())
                			{
                			
                				
                			String CountRequest1=rs.getString(1);
                			
                			System.out.println("In loop");				
                			System.out.println("Count:"+CountRequest1); %>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">View Request</label>
                                <div class="col-md-6">
                                
                                <input type="text" name="RCount" value="<%=rs.getString(1)%>" class="form-control" required>
                                </div>
                            </div>
                            <% }%>

                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="return Validate()">
                                   Send Bus
                                </button>
                                
                            </div>
                            </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
 
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("cpassword").value;
        if (password != confirmPassword) {
            alert("Passwords do not match.");
            return false;
        }
        return true;
    }
</script>
</main>
</body>
</html>