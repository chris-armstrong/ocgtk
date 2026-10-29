(** [GDtlsServerConnection] is the server-side subclass of
    {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}[Gio.DtlsConnection]},
    representing a server-side DTLS connection.

    Its methods, signals and properties are on
    {!class-type-dtls_server_connection_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Dtls_server_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [DtlsServerConnection].}

    Requires:
    - {{!Ocgio.Datagram_based.class-type-datagram_based_t}Ocgio.Datagram_based}
    - {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}Ocgio.Dtls_connection}

    [GDtlsServerConnection] is the server-side subclass of
    {{!Ocgio.Dtls_connection.class-type-dtls_connection_t}[Gio.DtlsConnection]},
    representing a server-side DTLS connection. *)
class type dtls_server_connection_t = object
  (** {2:properties Properties} *)

  method authentication_mode : Enums.tlsauthenticationmode
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_dtls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  (** The [GTlsAuthenticationMode] for the server. This can be changed before
      calling g_dtls_connection_handshake() if you want to rehandshake with a
      different mode from the initial handshake. *)

  (** {2:conversions Conversions} *)

  method as_dtls_server_connection : Raw.Dtls_server_connection.t
end

class dtls_server_connection :
  Raw.Dtls_server_connection.t ->
  dtls_server_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Dtls_server_connection.t}. *)

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
