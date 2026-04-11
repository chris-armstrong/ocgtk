class type socket_t = object
  inherit GDatagram_based.datagram_based_t
  inherit GInitable.initable_t

  method accept :
    GCancellable.cancellable_t option -> (socket_t, GError.t) result

  method bind :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    bool ->
    (bool, GError.t) result

  method check_connect_result : unit -> (bool, GError.t) result
  method close : unit -> (bool, GError.t) result

  method connect :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    GCancellable.cancellable_t option ->
    (bool, GError.t) result

  method connection_factory_create_connection : unit -> socket_connection_t
  method get_available_bytes : unit -> int
  method get_blocking : unit -> bool
  method get_broadcast : unit -> bool
  method get_credentials : unit -> (GCredentials.credentials_t, GError.t) result
  method get_family : unit -> Gio_enums.socketfamily
  method get_fd : unit -> int
  method get_keepalive : unit -> bool
  method get_listen_backlog : unit -> int

  method get_local_address :
    unit ->
    ( GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_multicast_loopback : unit -> bool
  method get_multicast_ttl : unit -> int
  method get_protocol : unit -> Gio_enums.socketprotocol

  method get_remote_address :
    unit ->
    ( GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_socket_type : unit -> Gio_enums.sockettype
  method get_timeout : unit -> int
  method get_ttl : unit -> int
  method is_closed : unit -> bool
  method is_connected : unit -> bool

  method join_multicast_group :
    GInet_address.inet_address_t ->
    bool ->
    string option ->
    (bool, GError.t) result

  method join_multicast_group_ssm :
    GInet_address.inet_address_t ->
    GInet_address.inet_address_t option ->
    string option ->
    (bool, GError.t) result

  method leave_multicast_group :
    GInet_address.inet_address_t ->
    bool ->
    string option ->
    (bool, GError.t) result

  method leave_multicast_group_ssm :
    GInet_address.inet_address_t ->
    GInet_address.inet_address_t option ->
    string option ->
    (bool, GError.t) result

  method listen : unit -> (bool, GError.t) result

  method receive_bytes :
    Gsize.t ->
    int64 ->
    GCancellable.cancellable_t option ->
    (Glib_bytes.t, GError.t) result

  method send_message :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option ->
    Output_vector.t array ->
    int ->
    Socket_control_message.t array option ->
    int ->
    int ->
    GCancellable.cancellable_t option ->
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
  method type_ : Gio_enums.sockettype
  method as_socket : Socket_and__socket_connection.Socket.t
end

and socket_connection_t = object
  inherit GIo_stream.io_stream_t

  method connect :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t ->
    GCancellable.cancellable_t option ->
    (bool, GError.t) result

  method connect_finish :
    GAsync_result.async_result_t -> (bool, GError.t) result

  method get_local_address :
    unit ->
    ( GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_remote_address :
    unit ->
    ( GSocket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address_t,
      GError.t )
    result

  method get_socket : unit -> socket_t
  method is_connected : unit -> bool

  method as_socket_connection :
    Socket_and__socket_connection.Socket_connection.t
end

class socket : Socket_and__socket_connection.Socket.t -> socket_t

and socket_connection :
  Socket_and__socket_connection.Socket_connection.t ->
  socket_connection_t

val new_ :
  Gio_enums.socketfamily ->
  Gio_enums.sockettype ->
  Gio_enums.socketprotocol ->
  (socket_t, GError.t) result

val new_from_fd : int -> (socket_t, GError.t) result
