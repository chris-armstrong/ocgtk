(** [GTlsClientConnection] is the client-side subclass of [Gio.TlsConnection],
    representing a client-side TLS connection.

    Its methods, signals and properties are on
    {!class-type-tls_client_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Tls_client_connection}. *)

(** The methods, signals and properties of a [GTlsClientConnection]. *)
class type tls_client_connection_t = object
  method copy_session_state : tls_client_connection_t -> unit

  method get_server_identity :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t
    option

  method get_use_ssl3 : unit -> bool
  method get_validation_flags : unit -> Enums.tlscertificateflags

  method set_server_identity :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit

  method set_use_ssl3 : bool -> unit
  method set_validation_flags : Enums.tlscertificateflags -> unit
  method as_tls_client_connection : Raw.Tls_client_connection.t
end

class tls_client_connection :
  Raw.Tls_client_connection.t ->
  tls_client_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Tls_client_connection.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GTlsClientConnection], give one already wrapped. *)
