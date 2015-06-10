<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.edit.label" args="[entityName]"/></title>
    <g:render template="datepicker_assets"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/3.3.0/ekko-lightbox.min.js"></script>
    <style>
    #map-canvas {
      width: 100%;
      height: 30vw;
    }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script>
      function placeMarker(lat, lng) {
        var gpsLat = document.getElementById('gpsLat');
        var gpsLng = document.getElementById('gpsLng');
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
        window.map.setCenter(location);
      }

      function initialize() {
        var myOptions = {
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        window.map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
        placeMarker(${event.gpsLat}, ${event.gpsLng});
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="/shared/error_flash" model="['bean': event]"/>
    <div class="well bs-component">
      <g:form url="[action: 'update', id: event.id]" method="POST" class="form-horizontal" enctype="multipart/form-data">
        <fieldset>
          <g:render template="form"/>
          <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
              <g:actionSubmit action="update" class="btn btn-primary" role="button"
                value="${message(code: 'default.button.update.label', default: 'Update')}"/>
            </div>
          </div>
        </fieldset>
      </g:form>
    </div>
    <script>
      $(document).delegate('*[data-toggle="lightbox"]', 'click', function (event) {
        event.preventDefault();
        $(this).ekkoLightbox();
      });
    </script>
  </body>
</html>
