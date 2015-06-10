<nav class="navbar navbar-inverse" role="navigation">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
        data-target="#bs-example-navbar-collapse-2">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/?lang=uk">VIN</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
      <ul class="nav navbar-nav">
        <li ${controllerName.equals('event') ? 'class=active' : ''}>
          <g:link controller="event" action="index"><g:message code="default.events"/></g:link>
        </li>
        <vin:isAdmin user="${session.user}">
          <li ${controllerName.equals('eventType') ? 'class=active' : ''}>
            <g:link controller="eventType" action="index"><g:message code="default.event_types"/></g:link>
          </li>
          <li ${controllerName.equals('user') ? 'class=active' : ''}>
            <g:link controller="user" action="index"><g:message code="default.users"/></g:link>
          </li>
        </vin:isAdmin>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li>
          <g:link controller="user" action="edit" id="${session.user.id}">
            <span class="glyphicon glyphicon-user"></span>
            <g:message code="default.my_profile"/>
          </g:link>
        </li>
        <li>
          <g:link controller="session" action="logout">
            <span class="glyphicon glyphicon-log-out"></span>
            <g:message code="default.logout"/>
          </g:link>
        </li>
      </ul>
    </div>
  </div>
</nav>
