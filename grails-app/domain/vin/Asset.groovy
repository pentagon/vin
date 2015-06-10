package vin

class Asset {
  String type
  String bucketKey
  Date dateCreated
  Date lastUpdated

  static constraints = {
    event nullable: true
    comment nullable: true
  }

  static mapping = {
    autoTimestamp true
    table 'assets'
  }

  static belongsTo = [event: Event, comment: Comment, user: User]
}
