package vin

import org.springframework.web.multipart.MultipartFile

class EventUpdateCommand implements grails.validation.Validateable {
  String id
  String gpsLat
  String gpsLng
  String ck42Coord
  String description
  String eventTypeId
  String dateRegistered
  List<MultipartFile> assetFiles

  static constraints = {
    description nullable: true, blank: true
    assetFiles nullable: true
    ck42Coord nullable: true
  }
}
