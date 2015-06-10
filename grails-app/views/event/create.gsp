
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
    <g:render template="datepicker_assets"/>
    <style>
      #map-canvas {
        width: 100%;
        height: 30vw;
      }
    </style>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
      var initialLocation;
      var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
      var map;

      function placeMarker(map, lat, lng) {
        var gpsLat = document.getElementById('gpsLat');
        var gpsLng = document.getElementById('gpsLng');
        gpsLat.value = lat;
        gpsLng.value = lng;
        var location = new google.maps.LatLng(lat, lng);
        var marker = new google.maps.Marker({
          position: location,
          map: map,
          draggable:true
        });
        google.maps.event.addListener(marker, 'position_changed', function() {
          gpsLat.value = marker.getPosition().lat();
          gpsLng.value = marker.getPosition().lng();
        });
        map.setCenter(location);
      }

      function initialize() {
        var myOptions = {
          zoom: 16,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
        var gpsLat = document.getElementById('gpsLat');
        var gpsLng = document.getElementById('gpsLng');

        google.maps.event.addListener(map, 'click', function (event) {
          placeMarker(event.latLng);
        });

        // Try W3C Geolocation (Preferred)
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function (position) {
            initialLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
            placeMarker(map, position.coords.latitude, position.coords.longitude);
          }, function () {
            handleNoGeolocation();
          });
        }
        else {
          handleNoGeolocation();
        }

        function handleNoGeolocation() {
          map.setCenter(newyork);
        }
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body>
    <h3><g:message code="default.event.new"/></h3>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="/shared/error_flash" model="['bean': event]"/>

    <div class="well bs-component">
      <g:form action="save" class="form-horizontal" enctype="multipart/form-data">
        <fieldset>
          <g:render template="form"/>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <g:submitButton name="create" class="btn btn-primary" role="button"
                value="${message(code: 'default.button.create.label', default: 'Create')}"/>
            </div>
          </div>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
