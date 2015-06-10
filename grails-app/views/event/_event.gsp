<div class="panel panel-default" id="event_${event.id}">
  <div class="panel-heading">
    <div class="row panel-title">
      <div class="col-lg-12">
        <div class="pull-left">
          <span class="glyphicon glyphicon-user"></span>
          <g:link params="[userId: event.user.id]">
            ${event.user.username}
          </g:link>
        </div>

        <div class="pull-right">
          <span class="glyphicon glyphicon-calendar"></span>
          <g:link params="[dateCreated: event.dateRegistered.getTime()]">
            ${event.dateRegistered.format('yyyy-MM-dd HH:mm')}
          </g:link>
        </div>
      </div>
    </div>
  </div>

  <div class="panel-body">
    <div class="row">
      <div class="col-lg-12">${event.description}</div>
    </div>

    <div class="row">
      <div class="col-lg-12 col-md-3">
        <g:each in="${event.assets}">
          <a data-toggle="lightbox" data-gallery="multiimages" href="/files/${event.id}/${it.bucketKey}"
            class="thumbnail pull-left">
            <img src="/files/${event.id}/${it.bucketKey}" width="60">
          </a>
        </g:each>
      </div>
    </div>
  </div>

  <div class="panel-footer">
    <div class="row">
      <div class="col-lg-12">
        <div class="pull-left">
          <button type="button" class="btn btn-info" data-show-event="${event.id}" data-lat="${event.gpsLat}"
            data-lng="${event.gpsLng}" data-event-type="${event.eventType.title}"
            data-event-desc="${event.description}">
            <span class="glyphicon glyphicon-map-marker"></span>
          </button>
          <a href="/event/show/${event.id}#comments" class="btn btn-default">
            <span class="glyphicon glyphicon-comment"></span>
            <span class="badge">${event.comments.size() ?: 0}</span>
          </a>
        </div>

        <div class="pull-right">
          <vin:canEdit user="${session.user}" entity="${event}">
            <g:link controller="event" action="edit" id="${event.id}" class="btn btn-warning">
              <span class="glyphicon glyphicon-edit"></span>
            </g:link>
          </vin:canEdit>
          <vin:canDelete user="${session.user}" entity="${event}">
            <a href="#" class="btn btn-danger" data-action="delete-event" data-event-id="${event.id}">
              <span class="glyphicon glyphicon-trash"></span>
            </a>
          </vin:canDelete>
          <g:link controller="event" action="show" id="${event.id}" class="btn btn-default">
            <span class="glyphicon glyphicon-triangle-right"></span>
          </g:link>
        </div>
      </div>
    </div>
  </div>
</div>
