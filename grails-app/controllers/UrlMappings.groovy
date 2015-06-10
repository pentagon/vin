class UrlMappings {

  static mappings = {
    "/$controller/$action?/$id?(.$format)?" {
      constraints {
        // apply constraints here
      }
    }

    "/files/$id/$fname" {
      controller = 'file'
      action = 'index'
    }

    "/session" controller: 'session', action: 'login'
    "/" controller: 'event', action: 'index'
    "500"(view: '/error')
    "404"(view: '/notFound')
  }
}
