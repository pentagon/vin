<%@ page import="vin.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="application">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
  </head>

  <body>

    <div id="list-user" class="content scaffold-list" role="main">
      <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
      </g:if>
      <table class="table table-striped">
        <thead>
          <tr>
            <td width="10%"><strong>ID</strong></td>
            <td><strong>Username</strong></td>
            <td><strong>Callsign</strong></td>
            <td><strong>Email</strong></td>
            <td><strong>Admin?</strong></td>
            <td><strong>Can add events?</strong></td>
            <td><strong>Join Date</strong></td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          <g:each in="${users}" status="i" var="user">
            <tr>
              <td><%= user.id %></td>
              <td><%= user.username %></td>
              <td><%= user.callsign %></td>
              <td><%= user.email %></td>
              <td><%= user.isAdmin %></td>
              <td><%= user.canEdit %></td>
              <td><%= user.dateCreated %></td>
              <td width="20%" align="right">
                <div>
                  <g:link action="edit" id="$user.id" class="btn btn-info" role="button">
                    <span class="glyphicon glyphicon-pencil">Edit</span>
                  </g:link>
                  <g:link action="delete" id="$user.id" class="btn btn-danger" role="button">
                    <span class="glyphicon glyphicon-trash">Delete</span>
                  </g:link>
                </div>
              </td>
            </tr>
          </g:each>
        </tbody>
        <tfoot>
          <tr>
            <td colspan="8">
              <g:link class="create" action="create" class="btn btn-success" role="button">
                <span class="glyphicon glyphicon-plus"><g:message code="default.new.label" args="[entityName]"/></span>
              </g:link>
            </td>
          </tr>
        </tfoot>
      </table>

      <div class="pagination">
        <g:paginate total="${userInstanceCount ?: 0}"/>
      </div>
    </div>
  </body>
</html>
