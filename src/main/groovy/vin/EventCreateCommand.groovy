package vin

import org.springframework.web.multipart.MultipartFile

class EventCreateCommand implements grails.validation.Validateable {
  String gpsLat
  String gpsLng
  String description
  String eventTypeId
  String dateRegistered
  List<MultipartFile> assetFiles

  static constraints = {
    description nullable: true, blank: true
    assetFiles nullable: true
  }
}
