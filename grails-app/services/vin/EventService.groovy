package vin

import grails.transaction.Transactional
import grails.validation.ValidationException
import grails.web.servlet.mvc.GrailsParameterMap
import org.joda.time.format.DateTimeFormat
import org.springframework.web.multipart.MultipartFile
import java.sql.Timestamp

@Transactional
class EventService {

  private static createAssetsForEvent(List<MultipartFile> files, Event event) {
    files.each { f ->
      if (f.originalFilename) {
        println "processing file: ${f.originalFilename}"
        def a = new Asset(type: f.contentType, bucketKey: f.originalFilename, event: event, user: event.user)
        def path = "${System.properties['user.dir']}/files/${event.id}"
        def folder = new File(path)
        if (!folder.exists()) {
          folder.mkdirs()
        }
        f.transferTo(new File("${path}/${f.originalFilename}"))
        if (!a.validate()) {
          println(a.errors)
        }
        a.save flush: true
      }
    }
  }

  Event create(EventCreateCommand cmd, User user) {
    Event event = new Event()
    event.description = cmd.description
    event.eventType = EventType.findById(cmd.eventTypeId)
    event.user = user
    event.gpsLat = cmd.gpsLat.toDouble()
    event.gpsLng = cmd.gpsLng.toDouble()
    event.ck42Coord = cmd.ck42Coord?.toDouble()
    event.dateRegistered = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm").parseDateTime(cmd.dateRegistered).toDate()
    event.isDeleted = false
    if (!event.validate()) {
      cmd.errors = event.errors
      throw new ValidationException('Event validation fails', cmd.errors)
    }
    event.save flush: true, failOnError: true
    println "command assets files count: ${cmd.assetFiles.size()}"
    if (cmd.assetFiles) {
      createAssetsForEvent(cmd.assetFiles, event)
    }
    event
  }

  Event update(EventUpdateCommand cmd) {
    Event event = Event.load(cmd.id)
    event.description = cmd.description
    event.dateRegistered = DateTimeFormat.forPattern("yyyy-MM-dd HH:mm").parseDateTime(cmd.dateRegistered).toDate()
    event.gpsLat = cmd.gpsLat.toDouble()
    event.gpsLng = cmd.gpsLng.toDouble()
    event.ck42Coord = cmd.ck42Coord?.toDouble()
    if (!event.validate()) {
      cmd.errors = event.errors
      throw new ValidationException('Event validation fails', cmd.errors)
    }
    event.save flush: true, failOnError: true
    if (cmd.assetFiles) {
      createAssetsForEvent(cmd.assetFiles, event)
    }
    event
  }

  List<Event> load(GrailsParameterMap params) {
    if (params['userId'] || params['dateCreated'] || params['eventTypeId']) {
      Event.where {
        isDeleted == false
        if (params['userId']) {
          user == User.findById(params.int('userId'))
        }
        if (params['dateCreated']) {
          def baseTime = params.long('dateCreated')
          def timeGap = 10 * 60 * 1000
          def startTime = new Timestamp(baseTime - timeGap)
          def endTime = new Timestamp(baseTime + timeGap)
          dateCreated in startTime..endTime
        }
        if (params['eventTypeId']) {
          eventType == EventType.findById(params.int('eventTypeId'))
        }
      }.list(params)
    } else {
      Event.where { isDeleted == false }.list(params)
    }
  }

  def delete(Event event, User user) {
    if (user.isAdmin || event.user.id == user.id) {
      event.isDeleted = true
      event.save flush: true
    } else {
      throw new UserNotAllowedException()
    }
  }
}
