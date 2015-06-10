<%@ page import="vin.Event" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/3.3.0/ekko-lightbox.min.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/3.3.0/ekko-lightbox.min.js"></script>
    <style>
    #map-canvas {
      width: 100%;
      height: 50vw;
    }
    </style>
    <script>
      function placeMarker(lat, lng, type, desc) {
        var location = new google.maps.LatLng(lat, lng);
        var marker = new google.maps.Marker({
          position: location,
          map: window.map,
          title: type
        });
        var contentString = "<strong>" + type + "</strong><br />" + desc;
        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
        google.maps.event.addListener(marker, 'click', function () {
          infowindow.open(window.map, marker);
        });
        return location;
      }

      function centerOnLocation(lat, lng) {
        var location = new google.maps.LatLng(lat, lng);
        console.log('Changin center to: ' + lat + ' ' + lng);
        window.map.panTo(location);
      }

      function placeMarkers() {
        var locations = [];
        var bounds = new google.maps.LatLngBounds();
        $('button[data-show-event]').each(function (i, e) {
          var lat = $(e).data('lat');
          var lng = $(e).data('lng');
          var type = $(e).data('event-type');
          var desc = $(e).data('event-desc');
          locations.push(placeMarker(parseFloat(lat), parseFloat(lng), type, desc));
        });
        for (var i = 0, len = locations.length; i < len; i++) {
          bounds.extend(locations[i]);
        }
        window.map.fitBounds(bounds);
      }

      function hightlightEvent(elem) {
        if (elem && elem.id) {
          $('div.panel').each(function (i, e) {
            if (e.id == elem.id) {
              $(e).removeClass('panel-default').addClass('panel-info');
            } else {
              $(e).removeClass('panel-info').addClass('panel-default');
            }
          });
        }
      }

      function selectEventFromElement(elem) {
        var lat = $(elem).data('lat');
        var lng = $(elem).data('lng');
        if (lat !== undefined && lng !== undefined) {
          centerOnLocation(parseFloat(lat), parseFloat(lng));
        }
        hightlightEvent($(elem).closest('.panel-default')[0]);
      }

      function initialize() {
        var myOptions = {
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        window.map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
        placeMarkers();
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body>
    <div class="row">
      <div class="col-lg-12">
        <div class="pull-left">
          <vin:canCreate user="${session.user}">
            <g:link action="create" class="btn btn-success">
              <span class="glyphicon glyphicon-plus"></span>
              <g:message code="default.event.new"/>
            </g:link>
          </vin:canCreate>
        </div>

        <div class="pull-right">
          <div class="btn-group">
            <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
              <span class="glyphicon glyphicon-filter"></span>
              <g:message code="default.filters"/>
              <span class="caret"></span>
            </button>
            <ul class="dropdown-menu" role="menu">
              <li><a href="#">Filter 1</a></li>
              <li><a href="#">Filter 2</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <br/>

    <div class="row">
      <div class="col-lg-4">
        <g:render template="event" collection="${events}"/>
      </div>

      <div class="col-lg-8">
        <div id="map-canvas"></div>
      </div>
    </div>

    <div class="row">
      <div class="col-lg-12">
        <g:render template="/shared/paginate" model="[offset: (params.int('offset') ?: 0), max: params.int('max'),
          count : eventCount]"/>
      </div>
    </div>
    <script>
      $(document).ready(function () {
        $('button[data-show-event]').on('click', function() {
          selectEventFromElement(this);
        });
      });
      $(document).delegate('a[data-action="delete-event"]', 'click', function(event) {
        event.preventDefault();
        var id = $(this).data('event-id');
        if (id) {
          if (confirm('<g:message code="default.event.delete.confirmation"/>')) {
            $.ajax({url: '/event/delete/' + id, type: "DELETE"}).success(function() {
              $('#event_' + id).remove();
            });
          }
        }
      });
      $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
        event.preventDefault();
        $(this).ekkoLightbox();
      });
    </script>
  </body>
</html>
