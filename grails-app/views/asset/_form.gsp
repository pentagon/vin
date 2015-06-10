<%@ page import="vin.Asset" %>



<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'bucketKey', 'error')} required">
	<label for="bucketKey">
		<g:message code="asset.bucketKey.label" default="Bucket Key" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="bucketKey" required="" value="${assetInstance?.bucketKey}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="asset.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="comment" name="comment.id" from="${vin.Comment.list()}" optionKey="id" required="" value="${assetInstance?.comment?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="asset.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${vin.Event.list()}" optionKey="id" required="" value="${assetInstance?.event?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'type', 'error')} required">
	<label for="type">
		<g:message code="asset.type.label" default="Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="type" required="" value="${assetInstance?.type}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: assetInstance, field: 'user', 'error')} required">
	<label for="user">
		<g:message code="asset.user.label" default="User" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="user" name="user.id" from="${vin.User.list()}" optionKey="id" required="" value="${assetInstance?.user?.id}" class="many-to-one"/>

</div>

