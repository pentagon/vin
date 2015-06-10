<!doctype html>
<html lang="en" class="no-js">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title><g:layoutTitle default="VIN"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="//maxcdn.bootstrapcdn.com/bootswatch/3.3.4/paper/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script type="text/javascript" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
    <g:render template="/shared/js_templates"/>
  </head>

  <body>
    <div class="container">
      <g:if test="${session.user}">
        <g:render template="/shared/top_menu" />
      </g:if>

      <g:layoutBody/>
    </div>
  </body>
</html>
