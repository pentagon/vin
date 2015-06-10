package vin

import grails.transaction.Transactional
import org.springframework.security.crypto.password.StandardPasswordEncoder

@Transactional
class UserService {

  private static String getHashForPassword(String password) {
    def checker = new StandardPasswordEncoder()
    checker.encode password
  }

  User createUser(UserCreateCommand cmd) {
    def user = new User()
    user.about = cmd.about
    user.callsign = cmd.callsign
    user.displayEmail = cmd.displayEmail
    user.displayPhone = cmd.displayPhone
    user.email = cmd.email
    user.phone = cmd.phone
    user.username = cmd.username
    user.canEdit = cmd.canEdit
    user.isAdmin = false
    if (cmd.password) {
      user.passwordHash = getHashForPassword(cmd.password)
    }
    user.save flush: true, failOnError: true
  }

  User update(UserUpdateCommand cmd) {
    def user = User.load(cmd.id)
    user.about = cmd.about
    user.callsign = cmd.callsign
    user.displayEmail = cmd.displayEmail
    user.displayPhone = cmd.displayPhone
    user.email = cmd.email
    user.phone = cmd.phone
    user.canEdit = cmd.canEdit
    if (cmd.password) {
      user.passwordHash = getHashForPassword(cmd.password)
    }
    user.save flush: true, failOnError: true
  }

  def createAdminUser(Map params) {
    def user = new User()
    user.username = params.username
    user.callsign = params.callsign
    user.email = params.email
    user.canEdit = true
    user.isAdmin = true
    user.displayEmail = params.displayEmail
    user.displayPhone = params.displayPhone
    user.passwordHash = getHashForPassword(params.password as String)
    if (user.validate()) {
      user.save flush: true
    } else {
      println(user.errors)
    }
  }
}
