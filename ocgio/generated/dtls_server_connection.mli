(** [GDtlsServerConnection] is the server-side subclass of [Gio.DtlsConnection],
    representing a server-side DTLS connection.

    Its methods, signals and properties are on
    {!class-type-dtls_server_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Dtls_server_connection}. *)

(** The methods, signals and properties of a [DtlsServerConnection]. *)
class type dtls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_dtls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_dtls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  method as_dtls_server_connection : Raw.Dtls_server_connection.t
end

class dtls_server_connection :
  Raw.Dtls_server_connection.t ->
  dtls_server_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Dtls_server_connection.t}. *)
