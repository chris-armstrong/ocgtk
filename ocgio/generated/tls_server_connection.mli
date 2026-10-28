(** [GTlsServerConnection] is the server-side subclass of [Gio.TlsConnection],
    representing a server-side TLS connection.

    Its methods, signals and properties are on
    {!class-type-tls_server_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Tls_server_connection}. *)

(** The methods, signals and properties of a [TlsServerConnection]. *)
class type tls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  method as_tls_server_connection : Raw.Tls_server_connection.t
end

class tls_server_connection :
  Raw.Tls_server_connection.t ->
  tls_server_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Tls_server_connection.t}. *)
