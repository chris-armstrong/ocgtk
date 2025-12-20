(* High-level class for TlsClientConnection *)
class tls_client_connection (obj : Tls_client_connection.t) = object (self)

  method get_use_ssl3 : unit -> bool =
    fun () ->
      (Tls_client_connection.get_use_ssl3 obj)

  method set_use_ssl3 : bool -> unit =
    fun use_ssl3 ->
      (Tls_client_connection.set_use_ssl3 obj use_ssl3)

    method as_tls_client_connection = obj
end

