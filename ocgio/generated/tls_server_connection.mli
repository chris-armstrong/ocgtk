(** [GTlsServerConnection] is the server-side subclass of [Gio.TlsConnection],
    representing a server-side TLS connection.

    Its methods, signals and properties are on
    {!class-type-tls_server_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Tls_server_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TlsServerConnection].}

    [GTlsServerConnection] is the server-side subclass of [Gio.TlsConnection],
    representing a server-side TLS connection. *)
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

class tls_server_connection :
  Raw.Tls_server_connection.t ->
  tls_server_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_server_connection.t}. *)
