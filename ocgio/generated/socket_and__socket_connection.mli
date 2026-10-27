(** The classes of {!Ocgio.Socket}, {!Ocgio.Socket_connection}, defined together
    because they refer to each other. Each has a module of its own that
    re-exports it; use that module rather than this one. *)

(** The methods, signals and properties of a [GSocket]. *)
class type socket_t = object
  inherit Datagram_based.datagram_based_t
  inherit Initable.initable_t

  method accept :
    Cancellable.cancellable_t option -> (socket_t, GError.t) result

  method bind :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    bool ->
    (bool, GError.t) result

  method check_connect_result : unit -> (bool, GError.t) result
  method close : unit -> (bool, GError.t) result

  method connect :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method connection_factory_create_connection : unit -> socket_connection_t
  method get_available_bytes : unit -> int
  method get_blocking : unit -> bool
  method get_broadcast : unit -> bool
  method get_credentials : unit -> (Credentials.credentials_t, GError.t) result
  method get_family : unit -> Enums.socketfamily
  method get_fd : unit -> int
  method get_keepalive : unit -> bool
  method get_listen_backlog : unit -> int

  method get_local_address :
    unit ->
    ( Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_multicast_loopback : unit -> bool
  method get_multicast_ttl : unit -> int
  method get_protocol : unit -> Enums.socketprotocol

  method get_remote_address :
    unit ->
    ( Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_socket_type : unit -> Enums.sockettype
  method get_timeout : unit -> int
  method get_ttl : unit -> int
  method is_closed : unit -> bool
  method is_connected : unit -> bool

  method join_multicast_group :
    Inet_address.inet_address_t ->
    bool ->
    string option ->
    (bool, GError.t) result

  method join_multicast_group_ssm :
    Inet_address.inet_address_t ->
    Inet_address.inet_address_t option ->
    string option ->
    (bool, GError.t) result

  method leave_multicast_group :
    Inet_address.inet_address_t ->
    bool ->
    string option ->
    (bool, GError.t) result

  method leave_multicast_group_ssm :
    Inet_address.inet_address_t ->
    Inet_address.inet_address_t option ->
    string option ->
    (bool, GError.t) result

  method listen : unit -> (bool, GError.t) result

  method receive_bytes :
    Gsize.t ->
    int64 ->
    Cancellable.cancellable_t option ->
    (Glib_bytes.t, GError.t) result

  method send_message :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option ->
    Raw.Output_vector.t array ->
    int ->
    Raw.Socket_control_message.t array option ->
    int ->
    int ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result

  method set_blocking : bool -> unit
  method set_broadcast : bool -> unit
  method set_keepalive : bool -> unit
  method set_listen_backlog : int -> unit
  method set_multicast_loopback : bool -> unit
  method set_multicast_ttl : int -> unit
  method set_option : int -> int -> int -> (bool, GError.t) result
  method set_timeout : int -> unit
  method set_ttl : int -> unit
  method shutdown : bool -> bool -> (bool, GError.t) result
  method speaks_ipv4 : unit -> bool
  method type_ : Enums.sockettype
  method as_socket : Raw.Socket.t
end

(** The methods, signals and properties of a [GSocketConnection]. *)
and socket_connection_t = object
  inherit Io_stream.io_stream_t

  method connect :
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    Cancellable.cancellable_t option ->
    (bool, GError.t) result

  method connect_finish : Async_result.async_result_t -> (bool, GError.t) result

  method get_local_address :
    unit ->
    ( Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_remote_address :
    unit ->
    ( Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_socket : unit -> socket_t
  method is_connected : unit -> bool
  method as_socket_connection : Raw.Socket_connection.t
end

(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GSocket], give one already wrapped. *)
class socket : Raw.Socket.t -> socket_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketConnection], give one already wrapped. *)

and socket_connection : Raw.Socket_connection.t -> socket_connection_t

val new_ :
  Enums.socketfamily ->
  Enums.sockettype ->
  Enums.socketprotocol ->
  (socket_t, GError.t) result

val new_from_fd : int -> (socket_t, GError.t) result
