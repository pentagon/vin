<g:hasErrors bean="${bean}">
  <div class="alert alert-danger alert-dismissible">
    <g:eachError bean="${bean}" var="error">
      <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
      <span class="sr-only">Error:</span>
      <g:message error="${error}"/><br>
    </g:eachError>
  </div>
</g:hasErrors>
