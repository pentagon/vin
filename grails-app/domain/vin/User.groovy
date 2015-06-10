package vin

class User {
  String username
  String email
  String about
  String callsign
  String phone
  Date dateCreated
  Date lastUpdated
  Date dateLastLoggedIn
  Boolean displayEmail
  Boolean displayPhone
  String passwordHash
  Boolean isAdmin
  Boolean canEdit

  static constraints = {
    dateLastLoggedIn nullable: true
    phone nullable: true
    about nullable: true
    passwordHash nullable: true
  }

  static mapping = {
    autoTimestamp true
    table 'users'
    isAdmin defaultValue: false
    canEdit defaultValue: true
  }

  static hasMany = [events: Event, comments: Comment, assets: Asset]
}
