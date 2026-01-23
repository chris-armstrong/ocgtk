class socket : Socket_and__socket_connection.Socket.t ->
  object
    method accept : #GCancellable.cancellable option -> (socket, GError.t) result
    method bind : #GSocket_address.socket_address -> bool -> (bool, GError.t) result
    method check_connect_result : unit -> (bool, GError.t) result
    method close : unit -> (bool, GError.t) result
    method connect : #GSocket_address.socket_address -> #GCancellable.cancellable option -> (bool, GError.t) result
    method connection_factory_create_connection : unit -> socket_connection
    method get_blocking : unit -> bool
    method get_broadcast : unit -> bool
    method get_credentials : unit -> (GCredentials.credentials, GError.t) result
    method get_family : unit -> Gio_enums.socketfamily
    method get_fd : unit -> int
    method get_keepalive : unit -> bool
    method get_listen_backlog : unit -> int
    method get_local_address : unit -> (GSocket_address.socket_address, GError.t) result
    method get_multicast_loopback : unit -> bool
    method get_multicast_ttl : unit -> int
    method get_protocol : unit -> Gio_enums.socketprotocol
    method get_remote_address : unit -> (GSocket_address.socket_address, GError.t) result
    method get_socket_type : unit -> Gio_enums.sockettype
    method get_timeout : unit -> int
    method get_ttl : unit -> int
    method is_closed : unit -> bool
    method is_connected : unit -> bool
    method join_multicast_group : #GInet_address.inet_address -> bool -> string option -> (bool, GError.t) result
    method join_multicast_group_ssm : #GInet_address.inet_address -> #GInet_address.inet_address option -> string option -> (bool, GError.t) result
    method leave_multicast_group : #GInet_address.inet_address -> bool -> string option -> (bool, GError.t) result
    method leave_multicast_group_ssm : #GInet_address.inet_address -> #GInet_address.inet_address option -> string option -> (bool, GError.t) result
    method listen : unit -> (bool, GError.t) result
    method receive_messages : Input_message.t array -> int -> int -> #GCancellable.cancellable option -> (int, GError.t) result
    method send_messages : Output_message.t array -> int -> int -> #GCancellable.cancellable option -> (int, GError.t) result
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

and socket_connection : Socket_and__socket_connection.Socket_connection.t ->
  object
    method connect : #GSocket_address.socket_address -> #GCancellable.cancellable option -> (bool, GError.t) result
    method get_local_address : unit -> (GSocket_address.socket_address, GError.t) result
    method get_remote_address : unit -> (GSocket_address.socket_address, GError.t) result
    method get_socket : unit -> socket
    method is_connected : unit -> bool
    method as_socket_connection : Socket_and__socket_connection.Socket_connection.t
  end
