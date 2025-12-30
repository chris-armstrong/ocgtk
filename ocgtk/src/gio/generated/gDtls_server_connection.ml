(* High-level class for DtlsServerConnection *)
class dtls_server_connection (obj : Dtls_server_connection.t) = object (self)

  method authentication_mode = Dtls_server_connection.get_authentication_mode obj
  method set_authentication_mode v =  Dtls_server_connection.set_authentication_mode obj v

    method as_dtls_server_connection = obj
end

