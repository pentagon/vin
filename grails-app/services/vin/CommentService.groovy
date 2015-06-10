package vin

import grails.transaction.Transactional
import grails.web.servlet.mvc.GrailsParameterMap

@Transactional
class CommentService {
  private static Map serializeComment(cmt) {
    [
      id: cmt.id,
      user: [
        id: cmt.userId,
        username: cmt.user.username
      ],
      dateCreated: cmt.dateCreated.format('yyyy-MM-dd HH:mm'),
      body: cmt.body
    ]
  }

  Map create(CommentCreateCommand cmd, User user) {
    def comment = new Comment()
    comment.body = cmd.body
    comment.user = user
    comment.event = Event.findById(cmd.eventId.toLong())
    Comment.withNewTransaction {
      comment.save flush: true, failOnError: true
    }
    serializeComment(comment)
  }

  @Transactional(readOnly = true)
  List<Map> load(GrailsParameterMap params) {
    def comments = Comment.where {event == Event.findById(params.long('eventId'))}.list() //params.subMap('offset', 'max'))
    comments.collect { cmt -> serializeComment(cmt) }
  }
}
