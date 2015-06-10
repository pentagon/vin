<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>
  </head>

  <body>
    <h3><g:message code="default.create.label" args="[entityName]"/></h3>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>

    <g:render template="/shared/error_flash" model="['bean': user]"/>

    <div class="well bs-component">
      <g:form url="[controller: 'user', action: 'save']" class="form-horizontal">
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
