class type tls_file_database_t = object
  method anchors : string
  method set_anchors : string -> unit
  method as_tls_file_database : Raw.Tls_file_database.t
end

(* High-level class for TlsFileDatabase *)
class tls_file_database (obj : Raw.Tls_file_database.t) : tls_file_database_t =
  object (self)
    method anchors = Raw.Tls_file_database.get_anchors obj
    method set_anchors v = Raw.Tls_file_database.set_anchors obj v
    method as_tls_file_database = obj
  end
