class tls_client_connection : Tls_client_connection.t ->
  object
    method get_use_ssl3 : unit -> bool
    method set_use_ssl3 : bool -> unit
    method as_tls_client_connection : Tls_client_connection.t
  end

