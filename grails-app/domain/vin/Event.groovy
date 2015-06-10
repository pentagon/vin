package vin

class Event {
  Double gpsLat
  Double gpsLng
  String description
  Date dateRegistered
  Date dateCreated
  Date lastUpdated
  Boolean isDeleted

  static constraints = {
    description nullable: true, blank: true
  }

  static mapping = {
    autoTimestamp true
    table 'events'
    description sqlType: 'text'
    gpsLat sqlType: 'double precision'
    gpsLng sqlType: 'double precision'
    isDeleted defaultValue: false
    sort lastUpdated: "desc"
  }

  static hasMany = [comments: Comment, assets: Asset]
  static belongsTo = [eventType: EventType, user: User]
}
