package vin

import javax.activation.MimetypesFileTypeMap
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths

class FileController {
  def index(String id, String fname) {
    Path path = Paths.get(System.properties['user.dir'] as String, 'files', id, fname)
    if ( Files.exists(path) ) {
      def mtype = new MimetypesFileTypeMap().getContentType(path.toString())
      render file: path, contentType: mtype
    } else {
      render status: 404
    }
  }
}
