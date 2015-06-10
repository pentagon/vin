<%@ page import="vin.Comment" %>

<div class="well bs-component">
  <g:form url="[controller: 'comment', action: 'save']" enctype="multipart/form-data" onsubmit="saveComment(this); return false;">
    <g:hiddenField name="eventId" value="${bean.id}"/>
    <div class="form-group">
      <label for="body" class="control-label">
        <strong><g:message code="default.comment"/></strong>
      </label>
      <g:textArea name="body" value="${comment?.body}" rows="2" class="form-control"/>
    </div>

    <g:submitButton name="create" class="btn btn-primary" role="button"
      value="${message(code: 'default.comments.add', default: 'Add Comment')}"/>
  </g:form>
</div>
