<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="google.aspx.cs" Inherits="googleMaps.google" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Closest Agents Map</title>
    <meta name="viewport" content="initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta charset="utf-8"/>
    <style>
        /* Always set the map height explicitly to define the size of the div
        * element that contains the map. */
        #map {
            height: 100%;
        }
        /* Optional: Makes the page fill the window. */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
    </style>

</head>
<body>
      <div id="map"></div>
    <script>
        var map;

        function initMap() {
            //
            // source location
            // HaNapah Street, Karmiel
            // Latitude = 32.92146 Longitude = 35.31982
            var source = { lat: 32.92146, lng: 35.31982 };
            var sourceCallerIcon = "http://maps.google.com/mapfiles/ms/micons/flag.png";
            var mechanicIcon = "http://maps.google.com/mapfiles/ms/micons/mechanic.png";

            //
            // init the map
            map = new google.maps.Map(document.getElementById('map'), {
                center: source, // Karmiel
                zoom: 10
            });

            //
            // the source location that issued the request.
            var from = new google.maps.Marker({
                position: source,
                map: map,
                icon: sourceCallerIcon,
                title: "Source Caller"
            });    

            //map.data.loadGeoJson('https://api.myjson.com/bins/y78nu'); 
            //map.data.loadGeoJson('https://api.myjson.com/bins/tz9ze'); 

            // Date.now() for opening a fresh copy each time.
            // loading a json is not the ideal solution - for multiple projects (from diffrenet users) changing the json ..
            // this is soultion for one instance that user open.
            // the best solution is to load the JSON coordinate from service
            map.data.loadGeoJson('http://localhost/googlemap/coordinates.json?' +  Date.now()); 

            map.data.setStyle(function (feature) {
                return {
                    icon: feature.getProperty("icon"),
                    title: feature.getProperty("name")
                }
            });
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAUXnAM6fkLHNQl6cfWP8r0zZzkAG_vr5E&callback=initMap" async="async" defer="defer"></script>
</body>
</html>
