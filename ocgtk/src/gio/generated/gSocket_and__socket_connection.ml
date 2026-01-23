(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class socket (obj : Socket_and__socket_connection.Socket.t) = object (self)

  method accept : 'p1. (#GCancellable.cancellable as 'p1) option -> (socket, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new socket ret)(Socket_and__socket_connection.Socket.accept obj cancellable)

  method bind : 'p1. (#GSocket_address.socket_address as 'p1) -> bool -> (bool, GError.t) result =
    fun address allow_reuse ->
      let address = address#as_socket_address in
      (Socket_and__socket_connection.Socket.bind obj address allow_reuse)

  method check_connect_result : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.check_connect_result obj)

  method close : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.close obj)

  method connect : 'p1 'p2. (#GSocket_address.socket_address as 'p1) -> (#GCancellable.cancellable as 'p2) option -> (bool, GError.t) result =
    fun address cancellable ->
      let address = address#as_socket_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket.connect obj address cancellable)

  method connection_factory_create_connection : unit -> socket_connection =
    fun () ->
      new  socket_connection(Socket_and__socket_connection.Socket.connection_factory_create_connection obj)

  method get_blocking : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_blocking obj)

  method get_broadcast : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_broadcast obj)

  method get_credentials : unit -> (GCredentials.credentials, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GCredentials.credentials ret)(Socket_and__socket_connection.Socket.get_credentials obj)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_and__socket_connection.Socket.get_family obj)

  method get_fd : unit -> int =
    fun () ->
      (Socket_and__socket_connection.Socket.get_fd obj)

  method get_keepalive : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_keepalive obj)

  method get_listen_backlog : unit -> int =
    fun () ->
      (Socket_and__socket_connection.Socket.get_listen_backlog obj)

  method get_local_address : unit -> (GSocket_address.socket_address, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket.get_local_address obj)

  method get_multicast_loopback : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_multicast_loopback obj)

  method get_multicast_ttl : unit -> int =
    fun () ->
      (Socket_and__socket_connection.Socket.get_multicast_ttl obj)

  method get_protocol : unit -> Gio_enums.socketprotocol =
    fun () ->
      (Socket_and__socket_connection.Socket.get_protocol obj)

  method get_remote_address : unit -> (GSocket_address.socket_address, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket.get_remote_address obj)

  method get_socket_type : unit -> Gio_enums.sockettype =
    fun () ->
      (Socket_and__socket_connection.Socket.get_socket_type obj)

  method get_timeout : unit -> int =
    fun () ->
      (Socket_and__socket_connection.Socket.get_timeout obj)

  method get_ttl : unit -> int =
    fun () ->
      (Socket_and__socket_connection.Socket.get_ttl obj)

  method is_closed : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.is_closed obj)

  method is_connected : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.is_connected obj)

  method join_multicast_group : 'p1. (#GInet_address.inet_address as 'p1) -> bool -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      (Socket_and__socket_connection.Socket.join_multicast_group obj group source_specific iface)

  method join_multicast_group_ssm : 'p1 'p2. (#GInet_address.inet_address as 'p1) -> (#GInet_address.inet_address as 'p2) option -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      let source_specific = Option.map (fun (c) -> c#as_inet_address) source_specific in
      (Socket_and__socket_connection.Socket.join_multicast_group_ssm obj group source_specific iface)

  method leave_multicast_group : 'p1. (#GInet_address.inet_address as 'p1) -> bool -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      (Socket_and__socket_connection.Socket.leave_multicast_group obj group source_specific iface)

  method leave_multicast_group_ssm : 'p1 'p2. (#GInet_address.inet_address as 'p1) -> (#GInet_address.inet_address as 'p2) option -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      let source_specific = Option.map (fun (c) -> c#as_inet_address) source_specific in
      (Socket_and__socket_connection.Socket.leave_multicast_group_ssm obj group source_specific iface)

  method listen : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.listen obj)

  method receive_messages : 'p1. Input_message.t array -> int -> int -> (#GCancellable.cancellable as 'p1) option -> (int, GError.t) result =
    fun messages num_messages flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket.receive_messages obj messages num_messages flags cancellable)

  method send_messages : 'p1. Output_message.t array -> int -> int -> (#GCancellable.cancellable as 'p1) option -> (int, GError.t) result =
    fun messages num_messages flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket.send_messages obj messages num_messages flags cancellable)

  method set_blocking : bool -> unit =
    fun blocking ->
      (Socket_and__socket_connection.Socket.set_blocking obj blocking)

  method set_broadcast : bool -> unit =
    fun broadcast ->
      (Socket_and__socket_connection.Socket.set_broadcast obj broadcast)

  method set_keepalive : bool -> unit =
    fun keepalive ->
      (Socket_and__socket_connection.Socket.set_keepalive obj keepalive)

  method set_listen_backlog : int -> unit =
    fun backlog ->
      (Socket_and__socket_connection.Socket.set_listen_backlog obj backlog)

  method set_multicast_loopback : bool -> unit =
    fun loopback ->
      (Socket_and__socket_connection.Socket.set_multicast_loopback obj loopback)

  method set_multicast_ttl : int -> unit =
    fun ttl ->
      (Socket_and__socket_connection.Socket.set_multicast_ttl obj ttl)

  method set_option : int -> int -> int -> (bool, GError.t) result =
    fun level optname value ->
      (Socket_and__socket_connection.Socket.set_option obj level optname value)

  method set_timeout : int -> unit =
    fun timeout ->
      (Socket_and__socket_connection.Socket.set_timeout obj timeout)

  method set_ttl : int -> unit =
    fun ttl ->
      (Socket_and__socket_connection.Socket.set_ttl obj ttl)

  method shutdown : bool -> bool -> (bool, GError.t) result =
    fun shutdown_read shutdown_write ->
      (Socket_and__socket_connection.Socket.shutdown obj shutdown_read shutdown_write)

  method speaks_ipv4 : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.speaks_ipv4 obj)

  method type_ = Socket_and__socket_connection.Socket.get_type obj

    method as_socket = obj
end

and socket_connection (obj : Socket_and__socket_connection.Socket_connection.t) = object (self)

  method connect : 'p1 'p2. (#GSocket_address.socket_address as 'p1) -> (#GCancellable.cancellable as 'p2) option -> (bool, GError.t) result =
    fun address cancellable ->
      let address = address#as_socket_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket_connection.connect obj address cancellable)

  method get_local_address : unit -> (GSocket_address.socket_address, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket_connection.get_local_address obj)

  method get_remote_address : unit -> (GSocket_address.socket_address, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket_connection.get_remote_address obj)

  method get_socket : unit -> socket =
    fun () ->
      new  socket(Socket_and__socket_connection.Socket_connection.get_socket obj)

  method is_connected : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket_connection.is_connected obj)

    method as_socket_connection = obj
end
