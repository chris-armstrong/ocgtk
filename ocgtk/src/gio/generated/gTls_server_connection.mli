class tls_server_connection : Tls_server_connection.t ->
  object
    method authentication_mode : Gio_enums.tlsauthenticationmode
    method set_authentication_mode : Gio_enums.tlsauthenticationmode -> unit
    method as_tls_server_connection : Tls_server_connection.t
  end

