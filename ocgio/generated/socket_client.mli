(** [GSocketClient] is a lightweight high-level utility class for connecting to
    a network host using a connection oriented socket type.

    You create a [GSocketClient] object, set any options you want, and then call
    a sync or async connect operation, which returns a [Gio.SocketConnection]
    subclass on success.

    The type of the [Gio.SocketConnection] object returned depends on the type
    of the underlying socket that is in use. For instance, for a TCP/IP
    connection it will be a [Gio.TcpConnection].

    As [GSocketClient] is a lightweight object, you don't need to cache it. You
    can just create a new one any time you need one.

    Its methods, signals and properties are on {!class-type-socket_client_t}.
    The functions it is built on are in {!Ocgio.Raw.Socket_client}. *)

(** The methods, signals and properties of a [GSocketClient]. *)
class type socket_client_t = object
  method on_event :
    ?after:bool ->
    callback:
      (event:Enums.socketclientevent ->
      connectable:
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
      connection:Io_stream.io_stream_t option ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_application_proxy : string -> unit

  method connect :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_host :
    string ->
    UInt16.t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_host_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_service :
    string ->
    string ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_service_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_uri :
    string ->
    UInt16.t ->
    Cancellable.cancellable_t option ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_uri_finish :
    Async_result.async_result_t ->
    (Socket_and__socket_connection.socket_connection_t, GError.t) result

  method get_enable_proxy : unit -> bool
  method get_family : unit -> Enums.socketfamily

  method get_local_address :
    unit ->
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option

  method get_protocol : unit -> Enums.socketprotocol
  method get_proxy_resolver : unit -> Proxy_resolver.proxy_resolver_t
  method get_socket_type : unit -> Enums.sockettype
  method get_timeout : unit -> int
  method get_tls : unit -> bool
  method get_tls_validation_flags : unit -> Enums.tlscertificateflags
  method set_enable_proxy : bool -> unit
  method set_family : Enums.socketfamily -> unit

  method set_local_address :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option ->
    unit

  method set_protocol : Enums.socketprotocol -> unit
  method set_proxy_resolver : Proxy_resolver.proxy_resolver_t option -> unit
  method set_socket_type : Enums.sockettype -> unit
  method set_timeout : int -> unit
  method set_tls : bool -> unit
  method set_tls_validation_flags : Enums.tlscertificateflags -> unit
  method type_ : Enums.sockettype
  method set_type : Enums.sockettype -> unit
  method as_socket_client : Raw.Socket_client.t
end

class socket_client : Raw.Socket_client.t -> socket_client_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_client.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GSocketClient], give one already wrapped. *)

val new_ : unit -> socket_client_t
