package vin

import grails.transaction.Transactional
import org.springframework.security.crypto.password.StandardPasswordEncoder

@Transactional
class SessionService {
  def loginUser(String username, String password) {
    def user = User.findByUsernameOrEmail(username, username)
    if (user == null) {
      throw new UserNotFoundException()
    }
    if (!user.passwordHash) {
      throw new UserNotAllowedException()
    }
    def checker = new StandardPasswordEncoder()
    if (!checker.matches(password, user.passwordHash)) {
      throw new WrongPasswordException()
    }
    user.dateLastLoggedIn = new Date()
    user.save flush: true
    user
  }
}
