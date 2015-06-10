// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require_tree .
//= require_self

function renderComment(comment, selector) {
  console.log(comment);
  var template = $('#comment_template').html();
  Mustache.parse(template);
  var rendered = Mustache.render(template, comment);
  $(selector).append(rendered);
}

function renderError(error, selector) {
  var template = $('#error_message').html();
  Mustache.parse(template);
  var rendered = Mustache.render(template, error);
  $(selector).append(rendered);
}
