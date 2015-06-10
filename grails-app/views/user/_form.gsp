<%@ page import="vin.UserCreateCommand" %>
<legend>Personal Info</legend>

<g:if test="${!user?.metaClass.getMetaProperty('id')}">
  <div class="form-group">
    <label for="username" class="col-lg-2 control-label"><strong>Username</strong></label>

    <div class="col-lg-10">
      <g:textField name="username" value="${user.username}"/>
    </div>
  </div>
</g:if>

<div class="form-group">
  <label for="callsign" class="col-lg-2 control-label"><strong>Callsign</strong></label>

  <div class="col-lg-10">
    <g:textField name="callsign" value="${user.callsign}"/>
  </div>
</div>

<div class="form-group">
  <label for="about" class="col-lg-2 control-label"><strong>About</strong></label>

  <div class="col-lg-10">
    <g:textArea name="about" value="${user.about}" cols="50" rows="5"/>
  </div>
</div>

<div class="form-group">
  <label for="phone" class="col-lg-2 control-label"><strong>Pnone</strong></label>

  <div class="col-lg-10">
    <g:textField name="phone" value="${user.phone}"/>
    <div class="checkbox">
      <label>
        <g:checkBox name="displayPhone" checked="${user.displayPhone}"/>
        Display Phone
      </label>
    </div>
  </div>
</div>

<div class="form-group">
  <label for="email" class="col-lg-2 control-label"><strong>Email</strong></label>

  <div class="col-lg-10">
    <g:textField name="email" value="${user.email}"/>
    <div class="checkbox">
      <label>
        <g:checkBox name="displayEmail" checked="${user.displayEmail}"/>
        Display Email
      </label>
    </div>
  </div>
</div>

<div class="form-group">
  <label for="canEdit" class="col-lg-2 control-label"><strong>Can add events</strong></label>

  <div class="col-lg-10">
    <g:checkBox name="canEdit" checked="${user.canEdit}"/>
  </div>
</div>
<g:render template="${user.class == UserCreateCommand ? 'set_password' : 'change_password'}"/>
