(** [GDtlsServerConnection] is the server-side subclass of [Gio.DtlsConnection],
    representing a server-side DTLS connection.

    Its methods, signals and properties are on
    {!class-type-dtls_server_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Dtls_server_connection}. *)

(** The methods, signals and properties of a [GDtlsServerConnection]. *)
class type dtls_server_connection_t = object
  method authentication_mode : Enums.tlsauthenticationmode
  method set_authentication_mode : Enums.tlsauthenticationmode -> unit
  method as_dtls_server_connection : Raw.Dtls_server_connection.t
end

class dtls_server_connection :
  Raw.Dtls_server_connection.t ->
  dtls_server_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Dtls_server_connection.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDtlsServerConnection], give one already wrapped. *)
