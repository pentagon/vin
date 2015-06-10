package vin

class AuthInterceptor {
  AuthInterceptor() {
    matchAll().excludes(controller: 'session', action: 'login')
  }

  boolean before() {
    if (!session.user) {
      User.withTransaction {
        redirect controller: 'session', action: 'login'
      }
      return false
    }
    true
  }

  boolean after() { true }

  void afterView() {
    // no-op
  }
}
