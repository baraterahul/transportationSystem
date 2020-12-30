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
        <a class="navbar-brand" href="#">Depo-Manager Add Bus Route</a>
          <a class="navbar-brand" href="DepoManagerHome.jsp">Home</a>
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
                    <div class="card-header">Add Bus Route</div>
                    <div class="card-body">
                        <form action="ManagerAddRoute" method="post">
                        <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Select Starting Point</label>
                                <div class="col-md-6">
                                   <select name="StartLocation" class="form-control"  required>
                                   <option value="Pune">Pune</option>
                                     <option value="Shivajinager">Shivajinager</option>
                                       <option value="Swarget">Swarget</option>
                                         <option value="Katraj">Katraj</option>
                                           <option value="Hadapasr">Hadapasr</option>
                                            
                                   </select>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Start Time</label>
                                <div class="col-md-6">
                                  <input type="time" name="StartTime" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Select End Point</label>
                                <div class="col-md-6">
                                    <select name="EndLocation" class="form-control"  required>
                                   <option value="Akurdi">Akurdi</option>
                                     <option value="Talegaon">Talegaon</option>
                                       <option value="Baramati">Baramati</option>
                                         <option value="Kolhapur">Kolhapur</option>
                                           <option value="Nashik">Nashik</option>
                                             <option value="Pune">Pune</option>
                                               <option value="VimanNagar">VimanNagar</option>
                                                 <option value="Hinjewadi">Hinjewadi</option>
                                   </select>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">End Time</label>
                                <div class="col-md-6">
                                  <input type="time" name="EndTime" class="form-control" required>
                                </div>
                            </div>
                            
                           <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Add Route Type</label>
                                <div class="col-md-6">
                                
                               <select class="form-control" name="RouteType">
                        <option value="Regular">Regular</option>
                        <option value="LongRoute">LongRoute</option>
                        <option value="ShortRoute">ShortRoute</option>
                                </select>
                                </div>
                            </div>
                            
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Root Km</label>
                                <div class="col-md-6">
                                  <input type="text" name="KM" class="form-control" required>
                                </div>
                            </div>
                            
                             <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">Ticket Price</label>
                                <div class="col-md-6">
                                  <input type="text" name="Price" class="form-control" required>
                                </div>
                            </div>
                           
                            

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