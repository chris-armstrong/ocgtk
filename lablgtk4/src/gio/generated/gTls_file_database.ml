(* High-level class for TlsFileDatabase *)
class tls_file_database (obj : Tls_file_database.t) = object (self)

  method anchors = Tls_file_database.get_anchors obj
  method set_anchors v =  Tls_file_database.set_anchors obj v

    method as_tls_file_database = obj
end

