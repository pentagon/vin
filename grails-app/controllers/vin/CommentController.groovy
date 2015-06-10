package vin

import grails.converters.JSON
import grails.transaction.Transactional
import javax.xml.bind.ValidationException

@Transactional(readOnly = true)
class CommentController {
  CommentService commentService

  private def checkCanEdit = {
    session.user.canEdit || session.user.isAdmin
  }

  def index(Integer max) {
    params.max = Math.min(max ?: 10, 100)
    def comments = commentService.load(params)
    render(contentType: "application/json") {
      [comments: comments]
    }
  }

  @Transactional
  def save(CommentCreateCommand cmd) {
    if (!checkCanEdit()) {
      render(status: 403, text: 'Unauthorized')
      return
    }
    if (cmd.hasErrors()) {
      response.status = 422
      render (cmd.errors as JSON)
      return
    }
    Map cmt
    try {
      cmt = commentService.create(cmd, session.user as User)
    } catch (ValidationException e) {
      response.status = 422
      render (cmd.errors as JSON)
      return
    }
    render(contentType: "application/json") {
      [comment: cmt]
    }
  }
}
