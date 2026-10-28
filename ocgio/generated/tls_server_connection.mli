(** [GTlsServerConnection] is the server-side subclass of [Gio.TlsConnection],
    representing a server-side TLS connection.

    Its methods, signals and properties are on
    {!class-type-tls_server_connection_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Tls_server_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [TlsServerConnection].}

    Requires:
    - {{!Ocgio.Tls_connection.class-type-tls_connection_t}Ocgio.Tls_connection}

    [GTlsServerConnection] is the server-side subclass of [Gio.TlsConnection],
    representing a server-side TLS connection. *)
class type tls_server_connection_t = object
  (** {2:properties Properties} *)

  method authentication_mode : Enums.tlsauthenticationmode
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_tls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_tls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  (** {2:conversions Conversions} *)

  method as_tls_server_connection : Raw.Tls_server_connection.t
end

class tls_server_connection :
  Raw.Tls_server_connection.t ->
  tls_server_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_server_connection.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
