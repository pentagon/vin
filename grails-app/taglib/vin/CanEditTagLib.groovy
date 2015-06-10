package vin

class CanEditTagLib {
//  static defaultEncodeAs = [taglib: 'html']
  static namespace = 'vin'
//  static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

  def isAdmin = { attrs, body ->
    if (attrs.user && attrs.user.isAdmin) {
      out << body()
    }
  }

  def canCreate = { attrs, body ->
    def user = attrs.user
    if (user && (user.isAdmin || user.canEdit)) {
      out << body()
    }
  }

  def canEdit = { attrs, body ->
    def user = attrs.user
    def entity = attrs.entity
    if (user && (user.isAdmin || (user.canEdit && entity?.user?.id == user.id))) {
      out << body()
    }
  }

  def canDelete = { attrs, body ->
    def user = attrs.user
    def entity = attrs.entity
    if (user && (user.isAdmin || (user.canEdit && entity?.user?.id == user.id))) {
      out << body()
    }
  }

  def canComment = { attrs, body ->
    def user = attrs.user
    if (user && (user.isAdmin || user.canEdit)) {
      out << body()
    }
  }
}
