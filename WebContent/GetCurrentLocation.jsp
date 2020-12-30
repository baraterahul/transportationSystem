<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.3.js"></script>
</head>
<body>

    <p>Country: <span id="country"></span></p>
    <p>State: <span id="state"></span></p>
    <p>City: <span id="city"></span></p>
    <p>Address: <span id="address"></span></p>

    <p>Latitude: <span id="latitude"></span></p>
    <p>Longitude: <span id="longitude"></span></p>

    <script type="text/javascript">
        navigator.geolocation.getCurrentPosition(success, error);

        function success(position) {

            var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=' + position.coords.latitude + '%2C' + position.coords.longitude + '&language=en';

            $.getJSON(GEOCODING).done(function(location) {
                $('#country').html(location.results[0].address_components[5].long_name);
                $('#state').html(location.results[0].address_components[4].long_name);
                $('#city').html(location.results[0].address_components[2].long_name);
                $('#address').html(location.results[0].formatted_address);
                $('#latitude').html(position.coords.latitude);
                $('#longitude').html(position.coords.longitude);
            })

        }

        function error(err) {
            console.log(err)
        }
    </script>
</body>
</html>