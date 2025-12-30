class tls_file_database : Tls_file_database.t ->
  object
    method anchors : string
    method set_anchors : string -> unit
    method as_tls_file_database : Tls_file_database.t
  end

