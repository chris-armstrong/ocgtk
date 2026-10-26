class type tls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  method as_tls_server_connection : Raw.Tls_server_connection.t
end

class tls_server_connection :
  Raw.Tls_server_connection.t ->
  tls_server_connection_t
