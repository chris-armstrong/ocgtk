class type dtls_server_connection_t = object
  (** {2:properties Properties} *)

  method authentication_mode : Enums.tlsauthenticationmode
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling [g_dtls_connection_handshake ()] if you want to rehandshake with a
      different mode from the initial handshake. *)

  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling [g_dtls_connection_handshake ()] if you want to rehandshake with a
      different mode from the initial handshake. *)

  (** {2:conversions Conversions} *)

  method as_dtls_server_connection : Raw.Dtls_server_connection.t
end

(* High-level class for DtlsServerConnection *)
class dtls_server_connection (obj : Raw.Dtls_server_connection.t) :
  dtls_server_connection_t =
  object (self)
    method authentication_mode =
      Raw.Dtls_server_connection.get_authentication_mode obj

    method set_authentication_mode v =
      Raw.Dtls_server_connection.set_authentication_mode obj v

    method as_dtls_server_connection = obj
  end
