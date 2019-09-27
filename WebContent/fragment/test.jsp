<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
    </style>
  </head>
  <body>
    <div id="map" style="width: 400px; height: 300px;"></div>
    <script>
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 13,
          center: {lat: 1.272163, lng: 103.831572}
        });

        setMarkers(map);
      }
      var beaches = [
        ['가든스 바이 더 베이', 1.281665, 103.863871, 4],
        ['유니버셜 스튜디오', 1.254145, 103.823802, 5],
        ['루지엔 스카이', 1.251926, 103.816949, 3]
      ];

      function setMarkers(map) {
        var shape = {
          coords: [1, 1, 1, 20, 18, 20, 18, 1],
          type: 'poly'
        };
        for (var i = 0; i < beaches.length; i++) {
          var beach = beaches[i];
          var marker = new google.maps.Marker({
            position: {lat: beach[1], lng: beach[2]},
            map: map,
            shape: shape,
            title: beach[0],
          });
        }
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDnxAZu6B_5ZaIOMtbE9EzAWmgdddJp0lk&callback=initMap">
    </script>
</body>
</html>