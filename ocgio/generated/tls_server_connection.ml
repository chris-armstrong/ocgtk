class type tls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_tls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_tls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

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
