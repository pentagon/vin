package vin

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserController {

  static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
  UserService userService

  private def requireAdmin = {
    if (!session.user.isAdmin) {
      redirect controller: 'session', action: 'login'
      return false
    }
  }

  private def redirectIfUnallowed = {
    if (params.id && params.int('id') != session.user.id) {
      if (!session.user.isAdmin) {
        redirect action: edit(session.user as User)
      }
    }
  }

  def index(Integer max) {
    requireAdmin()
    params.max = Math.min(max ?: 10, 100)
    [users: User.list(params + [sort: 'id', order: 'asc']), userCount: User.count()]
  }

  def show(User user) {
    authRequest()
    respond user
  }

  def create() {
    requireAdmin()
    [user: new UserCreateCommand()]
  }

  @Transactional
  def save(UserCreateCommand cmd) {
    redirectIfUnallowed()
    if (cmd.hasErrors()) {
      render view: 'create', model: [user: cmd]
      return
    }
    userService.createUser(cmd)
    redirect action: 'index'
  }

  def edit(User user) {
    redirectIfUnallowed()
    [user: user]
  }

  @Transactional
  def update(UserUpdateCommand cmd) {
    redirectIfUnallowed()
    if (cmd.hasErrors()) {
      render view: 'edit', model: [user: cmd]
      return
    }
    userService.update(cmd)
    redirect action: 'index'
  }

  @Transactional
  def delete(User user) {
    redirectIfUnallowed()
    if (user == null) {
      transactionStatus.setRollbackOnly()
      return
    }
    user.delete flush: true
    redirect action: "index", method: "GET"
  }
}
