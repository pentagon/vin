package vin

import grails.transaction.Transactional

@Transactional
class SessionController {

  static allowedMethods = [login: ["GET","POST"], logout: ["DELETE", "GET"]]
  SessionService sessionService

  def login() {
    if (request.method == "POST") {
      try {
        def user = sessionService.loginUser(params.username as String, params.password as String)
        session['user'] = user
        redirect controller: 'event', action: 'index'
      }
      catch (UserNotFoundException e) {
        flash.message = 'Wrong username or email'
        render view: 'login', model: [username: params.username]
      }
      catch (WrongPasswordException e) {
        flash.message = 'Wrong password'
        render view: 'login', model: [username: params.username]
      }
      catch (UserNotAllowedException e) {
        flash.message = 'User is blocked or nor allowed'
        render view: 'login', model: [username: params.username]
      }
    }
  }

  def logout() {
    session.invalidate()
    redirect action: 'login'
  }
}
