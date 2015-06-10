import grails.util.Environment
import vin.*

class BootStrap {
  def userService
  def init = { servletContext ->
    if (Environment.current == Environment.DEVELOPMENT) {
      if (User.findByUsername('admin') == null) {
        println('Creating admin user ...')
        userService.createAdminUser([username: 'admin', email: 'admin@nowhere.com', callsign: 'admin',
          displayEmail: false, displayPhone: false, password: '1111'])
        println('...done')
      }
    }
  }

  def destroy = {
  }
}
