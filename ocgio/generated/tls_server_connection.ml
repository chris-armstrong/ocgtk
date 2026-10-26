class type tls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  method as_tls_server_connection : Raw.Tls_server_connection.t
end

(* High-level class for TlsServerConnection *)
class tls_server_connection (obj : Raw.Tls_server_connection.t) :
  tls_server_connection_t =
  object (self)
    method authentication_mode =
      Raw.Tls_server_connection.get_authentication_mode obj

    method set_authentication_mode v =
      Raw.Tls_server_connection.set_authentication_mode obj v

    method as_tls_server_connection = obj
  end
