package vin

class UserUpdateCommand implements grails.validation.Validateable {
  String id
  String about
  String callsign
  Boolean displayEmail
  Boolean displayPhone
  String email
  String phone
  String password
  String passwordConfirmation
  String oldPassword
  Boolean canEdit

  static constraints = {
    password nullable: true, blank: true, validator: { val, cmd, errors ->
      if (val || cmd.passwordConfirmation) {
        if (val != cmd.passwordConfirmation) {
          errors.rejectValue('password', 'user.password.doesnotmatch')
        }
      }
    }
    passwordConfirmation nullable: true, blank: true
    oldPassword nullable: true, blank: true
    about nullable: true
    email email: true
  }
}
