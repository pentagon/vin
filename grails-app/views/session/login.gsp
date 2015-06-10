<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="auth">
  </head>

  <body>
    <h3>VOLUNTEER INTELLIGENCE NETWORK</h3>
    <g:if test="${flash.message}">
      <div class="alert alert-danger" role="alert">
        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
        <span class="sr-only">Error:</span>
        <g:message error="${flash.message}"/><br>
      </div>
    </g:if>

    <div class="well bs-component">
      <g:form url="[controller: 'session', action: 'login', method: 'POST']" class="form-horizontal">
        <fieldset>
          <div class="form-group">
            <label for="username" class="col-lg-2 control-label"><strong>Username</strong></label>
            <div class="col-lg-10">
              <g:textField name="username" value="${username}"/>
            </div>
          </div>
          <div class="form-group">
            <label for="password" class="col-lg-2 control-label"><strong>Password</strong></label>
            <div class="col-lg-10">
              <g:passwordField name="password"/>
            </div>
          </div>
          <div class="form-group">
            <div class="col-lg-10 col-lg-offset-2">
              <g:submitButton name="login" class="btn btn-primary" role="button"
                value="${message(code: 'default.button.login.label', default: 'Login')}"/>
            </div>
          </div>
        </fieldset>
      </g:form>
    </div>
  </body>
</html>
