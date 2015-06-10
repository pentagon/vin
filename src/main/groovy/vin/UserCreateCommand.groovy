package vin

class UserCreateCommand implements grails.validation.Validateable {
  String username
  String email
  String about
  String callsign
  String phone
  Boolean displayEmail
  Boolean displayPhone
  String password
  String passwordConfirmation
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
    about nullable: true
    email email: true
  }
}
