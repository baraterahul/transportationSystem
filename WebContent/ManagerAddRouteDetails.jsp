<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
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
        <a class="navbar-brand" href="#">Depo-Manager Add Bus Route Details</a>
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


	<%
		String id = (request.getParameter("id"));
		if (id != null) {
			String str = "select * from busroute where id=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection co = DriverManager.getConnection("jdbc:mysql://localhost:3306/bustransport", "root", "root");

			PreparedStatement ps = co.prepareStatement(str);
			ps.setString(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
	%>
id, StartLocation, StartTime, EndLocation, EndTime -->
<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Add Bus Route Details</div>
                    <div class="card-body">
                    
                    
                   
                    
                 <!-- //   id, Rid, StartLocation, StartTime, EndLocation, EndTime, CollegeName, CollegeAddress, Count, OpenTime, CloseTime -->
                        <form action="ManagerAddRouteDetails" method="post">
                         <input type="hidden" name="Rid" value="<%=rs.getString(1)%>">
                    <input type="hidden" name="StartLocation" value="<%=rs.getString(2)%>">
                    <input type="hidden" name="StartTime" value="<%=rs.getString(3)%>">
                    <input type="hidden" name="EndLocation" value="<%=rs.getString(4)%>">
                    <input type="hidden" name="EndTime" value="<%=rs.getString(5)%>">
                        <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Enter College/Company Name</label>
                                <div class="col-md-6">
                                    <input type="text" name="CollegeName" class="form-control" required>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">College Address</label>
                                <div class="col-md-6">
                                  <input type="text" name="CollegeAddress" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Student/Employee Count</label>
                                <div class="col-md-6">
                                     <input type="text" name="Count" class="form-control" required>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">School/College Opening Time</label>
                                <div class="col-md-6">
                                  <input type="time" name="OpenTime" class="form-control" required>
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">School/College Closing Time</label>
                                <div class="col-md-6">
                                  <input type="time" name="CloseTime" class="form-control" required>
                                </div>
                            </div>
                            
                           	<%
				}
				}

				else {
					System.out.println("sorry");
				}
			%>
                            

                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary" onclick="return Validate()">
                                    Add Route
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