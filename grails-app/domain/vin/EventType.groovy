package vin

class EventType {
  String title

  static constraints = {
  }

  static mapping = {
    autoTimestamp true
    table 'event_types'
  }

  static hasMany = [events: Event]
}
