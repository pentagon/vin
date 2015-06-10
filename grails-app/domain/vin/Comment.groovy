package vin

class Comment {
  String body
  Date dateCreated
  Date lastUpdated

  static constraints = {
  }

  static mapping = {
    autoTimestamp true
    table 'comments'
//    body sqlType: 'text'
  }

  static belongsTo = [event: Event, user: User]
}
