
<%@ page import="vin.Asset" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="application">
		<g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-asset" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-asset" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list asset">

				<g:if test="${assetInstance?.bucketKey}">
				<li class="fieldcontain">
					<span id="bucketKey-label" class="property-label"><g:message code="asset.bucketKey.label" default="Bucket Key" /></span>

						<span class="property-value" aria-labelledby="bucketKey-label"><g:fieldValue bean="${assetInstance}" field="bucketKey"/></span>

				</li>
				</g:if>

				<g:if test="${assetInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="asset.comment.label" default="Comment" /></span>

						<span class="property-value" aria-labelledby="comment-label"><g:link controller="comment" action="show" id="${assetInstance?.comment?.id}">${assetInstance?.comment?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${assetInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="asset.event.label" default="Event" /></span>

						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${assetInstance?.event?.id}">${assetInstance?.event?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

				<g:if test="${assetInstance?.type}">
				<li class="fieldcontain">
					<span id="type-label" class="property-label"><g:message code="asset.type.label" default="Type" /></span>

						<span class="property-value" aria-labelledby="type-label"><g:fieldValue bean="${assetInstance}" field="type"/></span>

				</li>
				</g:if>

				<g:if test="${assetInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="asset.user.label" default="User" /></span>

						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${assetInstance?.user?.id}">${assetInstance?.user?.encodeAsHTML()}</g:link></span>

				</li>
				</g:if>

			</ol>
			<g:form url="[resource:assetInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${assetInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
