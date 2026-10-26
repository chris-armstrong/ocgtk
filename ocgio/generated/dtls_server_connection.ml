class type dtls_server_connection_t = object
  method authentication_mode : Gio_enums.tlsauthenticationmode
  method set_authentication_mode : Gio_enums.tlsauthenticationmode -> unit
  method as_dtls_server_connection : Dtls_server_connection.t
end

(* High-level class for DtlsServerConnection *)
class dtls_server_connection (obj : Dtls_server_connection.t) :
  dtls_server_connection_t =
  object (self)
    method authentication_mode =
      Dtls_server_connection.get_authentication_mode obj

    method set_authentication_mode v =
      Dtls_server_connection.set_authentication_mode obj v

    method as_dtls_server_connection = obj
  end
