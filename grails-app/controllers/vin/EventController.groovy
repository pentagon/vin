package vin

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventController {

  static allowedMethods = [save: "POST", update: "POST", delete: "DELETE"]
  EventService eventService

  private def checkCanEdit = {
    if (!session.user.canEdit) {
      redirect action: 'index'
      return false
    }
  }

  def index(Integer max) {
    params.max = Math.min(max ?: 4, 100)
    def c = Event.findAllByIsDeleted(false).size()
    [events: eventService.load(params), eventCount: c]
  }

  def show(Event event) {
    respond event
  }

  def create() {
    checkCanEdit()
    respond new Event(params)
  }

  @Transactional
  def save(EventCreateCommand cmd) {
    checkCanEdit()
    cmd.assetFiles = request.getFiles('assetFiles')
    if (cmd.hasErrors()) {
      render view: 'create', model: [event: cmd]
      return
    }
    try {
      eventService.create(cmd, session.user as User)
    } catch (ValidationException e) {
      render view: 'create', model: [event: cmd]
      return
    }
    redirect action: 'index'
  }

  def edit(Event event) {
    checkCanEdit()
    [event: event]
  }

  @Transactional
  def update(EventUpdateCommand cmd) {
    checkCanEdit()
    cmd.assetFiles = request.getFiles('assetFiles')
    if (cmd.hasErrors()) {
      render view: 'edit', model: [event: cmd]
      return
    }
    try {
      eventService.update(cmd)
    } catch (ValidationException e) {
      render view: 'edit', model: [event: cmd]
      return
    }
    redirect action: 'index'
  }

  @Transactional
  def delete(Event event) {
    checkCanEdit()
    if (event == null) {
      transactionStatus.setRollbackOnly()
      notFound()
      return
    }
    try {
      eventService.delete(event, session.user as User)
      render status: 200
    } catch (UserNotAllowedException e) {
      render status: 403
    }
  }
}
