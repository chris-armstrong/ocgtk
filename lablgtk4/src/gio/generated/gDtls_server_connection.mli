class dtls_server_connection : Dtls_server_connection.t ->
  object
    method authentication_mode : Gio_enums.tlsauthenticationmode
    method set_authentication_mode : Gio_enums.tlsauthenticationmode -> unit
    method as_dtls_server_connection : Dtls_server_connection.t
  end

