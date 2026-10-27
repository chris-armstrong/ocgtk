(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

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

class socket (obj : Raw.Socket.t) : socket_t =
  object (self)
    inherit Datagram_based.datagram_based (Raw.Datagram_based.from_gobject obj)
    inherit Initable.initable (Raw.Initable.from_gobject obj)

    method accept :
        Cancellable.cancellable_t option -> (socket_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new socket ret)
          (Raw.Socket.accept obj cancellable)

    method bind :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t ->
        bool ->
        (bool, GError.t) result =
      fun address allow_reuse ->
        let address = address#as_socket_address in
        Raw.Socket.bind obj address allow_reuse

    method check_connect_result : unit -> (bool, GError.t) result =
      fun () -> Raw.Socket.check_connect_result obj

    method close : unit -> (bool, GError.t) result =
      fun () -> Raw.Socket.close obj

    method connect :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun address cancellable ->
        let address = address#as_socket_address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Socket.connect obj address cancellable

    method connection_factory_create_connection : unit -> socket_connection_t =
      fun () ->
        new socket_connection
          (Raw.Socket.connection_factory_create_connection obj)

    method get_available_bytes : unit -> int =
      fun () -> Raw.Socket.get_available_bytes obj

    method get_blocking : unit -> bool = fun () -> Raw.Socket.get_blocking obj
    method get_broadcast : unit -> bool = fun () -> Raw.Socket.get_broadcast obj

    method get_credentials :
        unit -> (Credentials.credentials_t, GError.t) result =
      fun () ->
        Result.map
          (fun ret -> new Credentials.credentials ret)
          (Raw.Socket.get_credentials obj)

    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Socket.get_family obj

    method get_fd : unit -> int = fun () -> Raw.Socket.get_fd obj
    method get_keepalive : unit -> bool = fun () -> Raw.Socket.get_keepalive obj

    method get_listen_backlog : unit -> int =
      fun () -> Raw.Socket.get_listen_backlog obj

    method get_local_address :
        unit ->
        ( Socket_address_and__socket_address_enumerator_and__socket_connectable
          .socket_address_t,
          GError.t )
        result =
      fun () ->
        Result.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket.get_local_address obj)

    method get_multicast_loopback : unit -> bool =
      fun () -> Raw.Socket.get_multicast_loopback obj

    method get_multicast_ttl : unit -> int =
      fun () -> Raw.Socket.get_multicast_ttl obj

    method get_protocol : unit -> Enums.socketprotocol =
      fun () -> Raw.Socket.get_protocol obj

    method get_remote_address :
        unit ->
        ( Socket_address_and__socket_address_enumerator_and__socket_connectable
          .socket_address_t,
          GError.t )
        result =
      fun () ->
        Result.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket.get_remote_address obj)

    method get_socket_type : unit -> Enums.sockettype =
      fun () -> Raw.Socket.get_socket_type obj

    method get_timeout : unit -> int = fun () -> Raw.Socket.get_timeout obj
    method get_ttl : unit -> int = fun () -> Raw.Socket.get_ttl obj
    method is_closed : unit -> bool = fun () -> Raw.Socket.is_closed obj
    method is_connected : unit -> bool = fun () -> Raw.Socket.is_connected obj

    method join_multicast_group :
        Inet_address.inet_address_t ->
        bool ->
        string option ->
        (bool, GError.t) result =
      fun group source_specific iface ->
        let group = group#as_inet_address in
        Raw.Socket.join_multicast_group obj group source_specific iface

    method join_multicast_group_ssm :
        Inet_address.inet_address_t ->
        Inet_address.inet_address_t option ->
        string option ->
        (bool, GError.t) result =
      fun group source_specific iface ->
        let group = group#as_inet_address in
        let source_specific =
          Option.map (fun c -> c#as_inet_address) source_specific
        in
        Raw.Socket.join_multicast_group_ssm obj group source_specific iface

    method leave_multicast_group :
        Inet_address.inet_address_t ->
        bool ->
        string option ->
        (bool, GError.t) result =
      fun group source_specific iface ->
        let group = group#as_inet_address in
        Raw.Socket.leave_multicast_group obj group source_specific iface

    method leave_multicast_group_ssm :
        Inet_address.inet_address_t ->
        Inet_address.inet_address_t option ->
        string option ->
        (bool, GError.t) result =
      fun group source_specific iface ->
        let group = group#as_inet_address in
        let source_specific =
          Option.map (fun c -> c#as_inet_address) source_specific
        in
        Raw.Socket.leave_multicast_group_ssm obj group source_specific iface

    method listen : unit -> (bool, GError.t) result =
      fun () -> Raw.Socket.listen obj

    method receive_bytes :
        Gsize.t ->
        int64 ->
        Cancellable.cancellable_t option ->
        (Glib_bytes.t, GError.t) result =
      fun size timeout_us cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Socket.receive_bytes obj size timeout_us cancellable

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
        (int, GError.t) result =
      fun address vectors num_vectors messages num_messages flags cancellable ->
        let address = Option.map (fun c -> c#as_socket_address) address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Socket.send_message obj address vectors num_vectors messages
          num_messages flags cancellable

    method set_blocking : bool -> unit =
      fun blocking -> Raw.Socket.set_blocking obj blocking

    method set_broadcast : bool -> unit =
      fun broadcast -> Raw.Socket.set_broadcast obj broadcast

    method set_keepalive : bool -> unit =
      fun keepalive -> Raw.Socket.set_keepalive obj keepalive

    method set_listen_backlog : int -> unit =
      fun backlog -> Raw.Socket.set_listen_backlog obj backlog

    method set_multicast_loopback : bool -> unit =
      fun loopback -> Raw.Socket.set_multicast_loopback obj loopback

    method set_multicast_ttl : int -> unit =
      fun ttl -> Raw.Socket.set_multicast_ttl obj ttl

    method set_option : int -> int -> int -> (bool, GError.t) result =
      fun level optname value -> Raw.Socket.set_option obj level optname value

    method set_timeout : int -> unit =
      fun timeout -> Raw.Socket.set_timeout obj timeout

    method set_ttl : int -> unit = fun ttl -> Raw.Socket.set_ttl obj ttl

    method shutdown : bool -> bool -> (bool, GError.t) result =
      fun shutdown_read shutdown_write ->
        Raw.Socket.shutdown obj shutdown_read shutdown_write

    method speaks_ipv4 : unit -> bool = fun () -> Raw.Socket.speaks_ipv4 obj
    method type_ = Raw.Socket.get_type obj
    method as_socket = obj
  end

and socket_connection (obj : Raw.Socket_connection.t) : socket_connection_t =
  object (self)
    inherit Io_stream.io_stream (obj :> Raw.Io_stream.t)

    method connect :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t ->
        Cancellable.cancellable_t option ->
        (bool, GError.t) result =
      fun address cancellable ->
        let address = address#as_socket_address in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Socket_connection.connect obj address cancellable

    method connect_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Socket_connection.connect_finish obj result

    method get_local_address :
        unit ->
        ( Socket_address_and__socket_address_enumerator_and__socket_connectable
          .socket_address_t,
          GError.t )
        result =
      fun () ->
        Result.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket_connection.get_local_address obj)

    method get_remote_address :
        unit ->
        ( Socket_address_and__socket_address_enumerator_and__socket_connectable
          .socket_address_t,
          GError.t )
        result =
      fun () ->
        Result.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket_connection.get_remote_address obj)

    method get_socket : unit -> socket_t =
      fun () -> new socket (Raw.Socket_connection.get_socket obj)

    method is_connected : unit -> bool =
      fun () -> Raw.Socket_connection.is_connected obj

    method as_socket_connection = obj
  end

let new_ (family : Enums.socketfamily) (type_ : Enums.sockettype)
    (protocol : Enums.socketprotocol) : (socket_t, GError.t) result =
  let obj_ = Raw.Socket.new_ family type_ protocol in
  Result.map (fun obj_ -> new socket obj_) obj_

let new_from_fd (fd : int) : (socket_t, GError.t) result =
  let obj_ = Raw.Socket.new_from_fd fd in
  Result.map (fun obj_ -> new socket obj_) obj_
