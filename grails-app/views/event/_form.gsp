<%@ page import="vin.EventType; vin.Event" %>

<div class="row">
  <div class="col-md-6 col-md-push-6">
    <legend><g:message code="default.event.location"/></legend>

    <div class="form-group">
      <label for="gpsLat" class="col-lg-3 control-label"><strong>GPS Latitude</strong></label>

      <div class="col-lg-9">
        <g:textField name="gpsLat" value="${event?.gpsLat}"/>
      </div>
    </div>

    <div class="form-group">
      <label for="gpsLng" class="col-lg-3 control-label"><strong>GPS Longitude</strong></label>

      <div class="col-lg-9">
        <g:textField name="gpsLng" value="${event?.gpsLng}"/>
      </div>
    </div>

    <div id="map-canvas"></div>
  </div>

  <div class=" col-md-6 col-md-pull-6">

    <legend><g:message code="default.event.common"/></legend>

    <div class="form-group">
      <label for="dateRegistered" class="col-lg-3 control-label"><strong><g:message
        code="default.events.date"/></strong></label>

      <div class="col-lg-9">
        <div class="form-group">
          <div class='input-group date' id='datetimepicker1'>
            <g:textField name="dateRegistered" class="form-control"/>
            <span class="input-group-addon">
              <span class="glyphicon glyphicon-calendar"></span>
            </span>
          </div>
        </div>
      </div>
    </div>

    <div class="form-group">
      <label for="eventTypeId" class="col-lg-3 control-label"><strong><g:message code="default.event_types"/></strong>
      </label>

      <div class="col-lg-9">
        <g:select name="eventTypeId" from="${EventType.list()}" value="${eventType?.id}" optionKey="id"
          optionValue="title"/>
      </div>
    </div>

    <div class="form-group">
      <label for="description" class="col-lg-3 control-label"><strong><g:message
        code="default.events.description"/></strong></label>

      <div class="col-lg-9">
        <g:textArea name="description" value="${event?.description}" cols="40" rows="5"/>
      </div>
    </div>

    <legend><g:message code="default.event.images"/></legend>

    <div class="form-group">
      <label for="assetFiles" class="col-lg-3 control-label"><strong><g:message code="default.image"/></strong></label>

      <div class="col-lg-9">
        <input type="file" name="assetFiles" id="assetFiles" multiple="multiple"/>
      </div>
    </div>

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

<script type="text/javascript">
  $(function () {
    $('#dateRegistered').datetimepicker({
      defaultDate: "${(event?.dateRegistered ?: new Date()).format('yyyy-MM-dd HH:mm')}",
      format: 'YYYY-MM-DD HH:mm',
      locale: 'uk'
    });
  });
</script>
