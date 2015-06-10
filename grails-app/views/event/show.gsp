<%@ page import="vin.Event" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'event.label', default: 'Event')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/3.3.0/ekko-lightbox.min.css" rel="stylesheet">
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/3.3.0/ekko-lightbox.min.js"></script>
    <style>
    #map-canvas {
      width: 100%;
      height: 30vw;
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
        var contentString = "<strong>" + type + "</strong><br />" + desc
        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });
        google.maps.event.addListener(marker, 'click', function () {
          infowindow.open(window.map, marker);
        });
        window.map.setCenter(location);
      }

      function centerOnLocation(lat, lng) {
        var location = new google.maps.LatLng(lat, lng);
        window.map.setCenter(location);
      }

      function placeMarkers() {
        $('button[data-show-event]').each(function (i, e) {
          var lat = $(e).data('lat');
          var lng = $(e).data('lng');
          var type = $(e).data('event-type')
          var desc = $(e).data('event-desc')
          placeMarker(parseFloat(lat), parseFloat(lng), type, desc);
        });
      }

      function initialize() {
        var myOptions = {
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        window.map = new google.maps.Map(document.getElementById("map-canvas"), myOptions);
        placeMarker(${event.gpsLat}, ${event.gpsLng}, '${event.eventType.title}', '${event.description}');
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>

  <body>
    <div class="row">
      <div class="col-lg-12">
        <a href="#" onclick="history.back();
        return false;" class="btn btn-default">
          <span class="glyphicon glyphicon-step-backward"></span>
          <g:message message="default.button.back"/>
        </a>
        <vin:canEdit user="${session.user}" entity="${event}">
          <g:link controller="event" action="edit" id="${event.id}" class="btn btn-warning">
            <span class="glyphicon glyphicon-edit"></span>
            <g:message message="default.button.edit.label"/>
          </g:link>
        </vin:canEdit>
        <vin:canDelete user="${session.user}" entity="${event}">
          <button type="button" class="btn btn-danger">
            <span class="glyphicon glyphicon-trash"></span>
            <g:message message="default.button.delete.label"/>
          </button>
        </vin:canDelete>
      </div>
    </div>
    <br/>

    <div class="row">
      <div class="col-lg-6">

        <div class="row">
          <div class="col-lg-4">
            <strong><g:message message="default.event.author"/></strong>
          </div>

          <div class="col-lg-8">
            <g:link controller="event" action="index" params="[userId: event.userId]">
              ${event.user.username}
            </g:link>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-4">
            <g:message message="default.event.date_created"/>
          </div>

          <div class="col-lg-8">
            ${event.dateCreated.format('yyyy-MM-dd HH:mm')}
          </div>
        </div>

        <div class="row">
          <div class="col-lg-4">
            <strong><g:message message="default.events.date"/></strong>
          </div>

          <div class="col-lg-8">
            <g:link controller="event" action="index" params="[dateCreated: event.dateRegistered.getTime()]">
              ${event.dateRegistered.format('yyyy-MM-dd HH:mm')}
            </g:link>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-4">
            <strong><g:message message="default.event_type"/></strong>
          </div>

          <div class="col-lg-8">
            <g:link controller="event" action="index" params="[eventTypeId: event.eventTypeId]">
              ${event.eventType.title}
            </g:link>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <strong><g:message message="default.events.description"/></strong>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            ${event.description}
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <strong><g:message message="default.events.images"/></strong>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <g:each in="${event.assets}">
              <a data-toggle="lightbox" data-gallery="multiimages" href="/files/${event.id}/${it.bucketKey}"
                class="thumbnail pull-left">
                <img src="/files/${event.id}/${it.bucketKey}" width="180">
              </a>
            </g:each>
          </div>
        </div>
      </div>

      <div class="col-lg-6">
        <div class="row">
          <div class="col-lg-12">
            <strong><g:message message="default.event.location"/></strong>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div class="pull-right">
              <strong>GPS</strong>
              ${event.gpsLat}
              ${event.gpsLng}
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-12">
            <div id="map-canvas"></div>
          </div>
        </div>
      </div>
    </div>
    <br/>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/mustache.js/0.8.1/mustache.min.js"></script>

    <a name="comments"></a>
    <g:render template="/comment/comment"/>

    <div class="row">
      <div class="col-lg-12">
        <div id="comments_placeholder"></div>
      </div>
    </div>

    <vin:canComment user="${session.user}">
      <div class="row">
        <div class="col-lg-12">
          <div id="comments_errors_placeholder"></div>
        </div>
      </div>

      <div class="row">
        <div class="col-lg-12">
          <g:render template="/comment/form" model="[bean: event]"/>
        </div>
      </div>
    </vin:canComment>

    <script>
      function saveComment(form) {
        $('#comments_errors_placeholder').html('');
        $.post(form.action, $(form).serialize(), function (data) {
          renderComment(data.comment, '#comments_placeholder');
        }).fail(function (data) {
          data.responseJSON.errors.forEach(function (error) {
            renderError(error, '#comments_errors_placeholder');
          });
        });
        form.reset();
      }

      $(function () {
        $.get('/comment/index?eventId=' + ${event.id}, function (data) {
          data.comments.forEach(function (comment) {
            renderComment(comment, '#comments_placeholder');
          });
        });
      });

      $(document).delegate('*[data-toggle="lightbox"]', 'click', function (event) {
        event.preventDefault();
        $(this).ekkoLightbox();
      });
    </script>
  </body>
</html>
