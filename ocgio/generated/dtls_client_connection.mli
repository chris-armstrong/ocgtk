(** [GDtlsClientConnection] is the client-side subclass of [Gio.DtlsConnection],
    representing a client-side DTLS connection.

    Its methods, signals and properties are on
    {!class-type-dtls_client_connection_t}. The functions it is built on are in
    {!Ocgio.Raw.Dtls_client_connection}. *)

(** The methods, signals and properties of a [GDtlsClientConnection]. *)
class type dtls_client_connection_t = object
  method get_server_identity :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t

  method get_validation_flags : unit -> Enums.tlscertificateflags

  method set_server_identity :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    unit

  method set_validation_flags : Enums.tlscertificateflags -> unit
  method as_dtls_client_connection : Raw.Dtls_client_connection.t
end

class dtls_client_connection :
  Raw.Dtls_client_connection.t ->
  dtls_client_connection_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Dtls_client_connection.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GDtlsClientConnection], give one already wrapped. *)
