<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'eventType.label', default: 'EventType')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
  </head>

  <body>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="/shared/error_flash" model="['bean': eventTypeInstance]"/>

    <div class="well bs-component">
      <g:form url="[resource: eventTypeInstance, action: 'save']" class="form-horizontal">
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
