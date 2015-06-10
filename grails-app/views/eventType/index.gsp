<%@ page import="vin.EventType" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'eventType.label', default: 'EventType')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
  </head>

  <body>
    <g:if test="${flash.message}">
      <div class="alert alert-success" role="status">${flash.message}</div>
    </g:if>

    <table class="table table-striped">
      <thead>
        <tr>
          <td width="10%"><strong>ID</strong></td>
          <td><strong>Title</strong></td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <g:each in="${events}" status="i" var="event">
          <tr>
            <td><%= event.id %></td>
            <td><%= event.title %></td>
            <td width="20%" align="right">
              <div>
                <g:link action="edit" id="$event.id" class="btn btn-info" role="button">
                  <span class="glyphicon glyphicon-pencil">Edit</span>
                </g:link>
                <g:link action="delete" id="$event.id" class="btn btn-danger" role="button">
                  <span class="glyphicon glyphicon-trash">Delete</span>
                </g:link>
              </div>
            </td>
          </tr>
        </g:each>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="3">
            <g:link class="create" action="create" class="btn btn-success" role="button">
              <span class="glyphicon glyphicon-plus"><g:message code="default.new.label" args="[entityName]"/></span>
            </g:link>
          </td>
        </tr>
      </tfoot>
    </table>

    <div class="pagination">
      <g:paginate total="${eventsCount ?: 0}"/>
    </div>
  </body>
</html>
