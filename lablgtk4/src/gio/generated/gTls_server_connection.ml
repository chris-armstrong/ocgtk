(* High-level class for TlsServerConnection *)
class tls_server_connection (obj : Tls_server_connection.t) = object (self)

  method authentication_mode = Tls_server_connection.get_authentication_mode obj
  method set_authentication_mode v =  Tls_server_connection.set_authentication_mode obj v

    method as_tls_server_connection = obj
end

