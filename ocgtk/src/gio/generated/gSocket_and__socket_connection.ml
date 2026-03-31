(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type socket_t = object
    method accept : GCancellable.cancellable_t option -> (socket_t, GError.t) result
    method bind : GSocket_address.socket_address_t -> bool -> (bool, GError.t) result
    method check_connect_result : unit -> (bool, GError.t) result
    method close : unit -> (bool, GError.t) result
    method connect : GSocket_address.socket_address_t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method connection_factory_create_connection : unit -> socket_connection_t
    method get_blocking : unit -> bool
    method get_broadcast : unit -> bool
    method get_credentials : unit -> (GCredentials.credentials_t, GError.t) result
    method get_family : unit -> Gio_enums.socketfamily
    method get_fd : unit -> int
    method get_keepalive : unit -> bool
    method get_listen_backlog : unit -> int
    method get_local_address : unit -> (GSocket_address.socket_address_t, GError.t) result
    method get_multicast_loopback : unit -> bool
    method get_multicast_ttl : unit -> int
    method get_protocol : unit -> Gio_enums.socketprotocol
    method get_remote_address : unit -> (GSocket_address.socket_address_t, GError.t) result
    method get_socket_type : unit -> Gio_enums.sockettype
    method get_timeout : unit -> int
    method get_ttl : unit -> int
    method is_closed : unit -> bool
    method is_connected : unit -> bool
    method join_multicast_group : GInet_address.inet_address_t -> bool -> string option -> (bool, GError.t) result
    method join_multicast_group_ssm : GInet_address.inet_address_t -> GInet_address.inet_address_t option -> string option -> (bool, GError.t) result
    method leave_multicast_group : GInet_address.inet_address_t -> bool -> string option -> (bool, GError.t) result
    method leave_multicast_group_ssm : GInet_address.inet_address_t -> GInet_address.inet_address_t option -> string option -> (bool, GError.t) result
    method listen : unit -> (bool, GError.t) result
    method receive_messages : Input_message.t array -> int -> int -> GCancellable.cancellable_t option -> (int, GError.t) result
    method send_messages : Output_message.t array -> int -> int -> GCancellable.cancellable_t option -> (int, GError.t) result
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
    method connect : GSocket_address.socket_address_t -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method get_local_address : unit -> (GSocket_address.socket_address_t, GError.t) result
    method get_remote_address : unit -> (GSocket_address.socket_address_t, GError.t) result
    method get_socket : unit -> socket_t
    method is_connected : unit -> bool
    method as_socket_connection : Socket_and__socket_connection.Socket_connection.t
end


class socket (obj : Socket_and__socket_connection.Socket.t) : socket_t = object (self)

  method accept : GCancellable.cancellable_t option -> (socket_t, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new socket ret)(Socket_and__socket_connection.Socket.accept obj cancellable)

  method bind : GSocket_address.socket_address_t -> bool -> (bool, GError.t) result =
    fun address allow_reuse ->
      let address = address#as_socket_address in
      (Socket_and__socket_connection.Socket.bind obj address allow_reuse)

  method check_connect_result : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.check_connect_result obj)

  method close : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.close obj)

  method connect : GSocket_address.socket_address_t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun address cancellable ->
      let address = address#as_socket_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket.connect obj address cancellable)

  method connection_factory_create_connection : unit -> socket_connection_t =
    fun () ->
      new  socket_connection(Socket_and__socket_connection.Socket.connection_factory_create_connection obj)

  method get_blocking : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_blocking obj)

  method get_broadcast : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket.get_broadcast obj)

  method get_credentials : unit -> (GCredentials.credentials_t, GError.t) result =
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

  method get_local_address : unit -> (GSocket_address.socket_address_t, GError.t) result =
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

  method get_remote_address : unit -> (GSocket_address.socket_address_t, GError.t) result =
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

  method join_multicast_group : GInet_address.inet_address_t -> bool -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      (Socket_and__socket_connection.Socket.join_multicast_group obj group source_specific iface)

  method join_multicast_group_ssm : GInet_address.inet_address_t -> GInet_address.inet_address_t option -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      let source_specific = Option.map (fun (c) -> c#as_inet_address) source_specific in
      (Socket_and__socket_connection.Socket.join_multicast_group_ssm obj group source_specific iface)

  method leave_multicast_group : GInet_address.inet_address_t -> bool -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      (Socket_and__socket_connection.Socket.leave_multicast_group obj group source_specific iface)

  method leave_multicast_group_ssm : GInet_address.inet_address_t -> GInet_address.inet_address_t option -> string option -> (bool, GError.t) result =
    fun group source_specific iface ->
      let group = group#as_inet_address in
      let source_specific = Option.map (fun (c) -> c#as_inet_address) source_specific in
      (Socket_and__socket_connection.Socket.leave_multicast_group_ssm obj group source_specific iface)

  method listen : unit -> (bool, GError.t) result =
    fun () ->
      (Socket_and__socket_connection.Socket.listen obj)

  method receive_messages : Input_message.t array -> int -> int -> GCancellable.cancellable_t option -> (int, GError.t) result =
    fun messages num_messages flags cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket.receive_messages obj messages num_messages flags cancellable)

  method send_messages : Output_message.t array -> int -> int -> GCancellable.cancellable_t option -> (int, GError.t) result =
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

and socket_connection (obj : Socket_and__socket_connection.Socket_connection.t) : socket_connection_t = object (self)
  inherit GIo_stream.io_stream (obj :> Io_stream.t)

  method connect : GSocket_address.socket_address_t -> GCancellable.cancellable_t option -> (bool, GError.t) result =
    fun address cancellable ->
      let address = address#as_socket_address in
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Socket_and__socket_connection.Socket_connection.connect obj address cancellable)

  method get_local_address : unit -> (GSocket_address.socket_address_t, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket_connection.get_local_address obj)

  method get_remote_address : unit -> (GSocket_address.socket_address_t, GError.t) result =
    fun () ->
      Result.map (fun ret -> new GSocket_address.socket_address ret)(Socket_and__socket_connection.Socket_connection.get_remote_address obj)

  method get_socket : unit -> socket_t =
    fun () ->
      new  socket(Socket_and__socket_connection.Socket_connection.get_socket obj)

  method is_connected : unit -> bool =
    fun () ->
      (Socket_and__socket_connection.Socket_connection.is_connected obj)

    method as_socket_connection = obj
end
let new_ (family : Gio_enums.socketfamily) (type_ : Gio_enums.sockettype) (protocol : Gio_enums.socketprotocol) : (socket_t, GError.t) result =
  let obj_ = Socket_and__socket_connection.Socket.new_ family type_ protocol in
Result.map (fun obj_ ->  new socket obj_) obj_

let new_from_fd (fd : int) : (socket_t, GError.t) result =
  let obj_ = Socket_and__socket_connection.Socket.new_from_fd fd in
Result.map (fun obj_ ->  new socket obj_) obj_

