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

(* High-level class for SocketClient *)
class socket_client (obj : Raw.Socket_client.t) : socket_client_t =
  object (self)
    method on_event ?(after = false) ~callback () =
      Raw.Socket_client.on_event ~after self#as_socket_client
        ~callback:(fun ~event ~connectable ~connection ->
          callback ~event
            ~connectable:
              (new
                 Socket_address_and__socket_address_enumerator_and__socket_connectable
                 .socket_connectable
                 connectable)
            ~connection:
              (Option.map (fun w -> new Io_stream.io_stream w) connection))

    method add_application_proxy : string -> unit =
      fun protocol -> Raw.Socket_client.add_application_proxy obj protocol

    method connect :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_connectable_t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun connectable cancellable ->
        let connectable = connectable#as_socket_connectable in
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect obj connectable cancellable)

    method connect_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_finish obj result)

    method connect_to_host :
        string ->
        UInt16.t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun host_and_port default_port cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_host obj host_and_port default_port
             cancellable)

    method connect_to_host_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_host_finish obj result)

    method connect_to_service :
        string ->
        string ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun domain service cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_service obj domain service cancellable)

    method connect_to_service_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_service_finish obj result)

    method connect_to_uri :
        string ->
        UInt16.t ->
        Cancellable.cancellable_t option ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun uri default_port cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_uri obj uri default_port cancellable)

    method connect_to_uri_finish :
        Async_result.async_result_t ->
        (Socket_and__socket_connection.socket_connection_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Socket_and__socket_connection.socket_connection ret)
          (Raw.Socket_client.connect_to_uri_finish obj result)

    method get_enable_proxy : unit -> bool =
      fun () -> Raw.Socket_client.get_enable_proxy obj

    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Socket_client.get_family obj

    method get_local_address :
        unit ->
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t
        option =
      fun () ->
        Option.map
          (fun ret ->
            new
              Socket_address_and__socket_address_enumerator_and__socket_connectable
              .socket_address
              ret)
          (Raw.Socket_client.get_local_address obj)

    method get_protocol : unit -> Enums.socketprotocol =
      fun () -> Raw.Socket_client.get_protocol obj

    method get_proxy_resolver : unit -> Proxy_resolver.proxy_resolver_t =
      fun () ->
        new Proxy_resolver.proxy_resolver
          (Raw.Socket_client.get_proxy_resolver obj)

    method get_socket_type : unit -> Enums.sockettype =
      fun () -> Raw.Socket_client.get_socket_type obj

    method get_timeout : unit -> int =
      fun () -> Raw.Socket_client.get_timeout obj

    method get_tls : unit -> bool = fun () -> Raw.Socket_client.get_tls obj

    method get_tls_validation_flags : unit -> Enums.tlscertificateflags =
      fun () -> Raw.Socket_client.get_tls_validation_flags obj

    method set_enable_proxy : bool -> unit =
      fun enable -> Raw.Socket_client.set_enable_proxy obj enable

    method set_family : Enums.socketfamily -> unit =
      fun family -> Raw.Socket_client.set_family obj family

    method set_local_address :
        Socket_address_and__socket_address_enumerator_and__socket_connectable
        .socket_address_t
        option ->
        unit =
      fun address ->
        let address = Option.map (fun c -> c#as_socket_address) address in
        Raw.Socket_client.set_local_address obj address

    method set_protocol : Enums.socketprotocol -> unit =
      fun protocol -> Raw.Socket_client.set_protocol obj protocol

    method set_proxy_resolver : Proxy_resolver.proxy_resolver_t option -> unit =
      fun proxy_resolver ->
        let proxy_resolver =
          Option.map (fun c -> c#as_proxy_resolver) proxy_resolver
        in
        Raw.Socket_client.set_proxy_resolver obj proxy_resolver

    method set_socket_type : Enums.sockettype -> unit =
      fun type_ -> Raw.Socket_client.set_socket_type obj type_

    method set_timeout : int -> unit =
      fun timeout -> Raw.Socket_client.set_timeout obj timeout

    method set_tls : bool -> unit = fun tls -> Raw.Socket_client.set_tls obj tls

    method set_tls_validation_flags : Enums.tlscertificateflags -> unit =
      fun flags -> Raw.Socket_client.set_tls_validation_flags obj flags

    method type_ = Raw.Socket_client.get_type obj
    method set_type v = Raw.Socket_client.set_type obj v
    method as_socket_client = obj
  end

let new_ () : socket_client_t = new socket_client (Raw.Socket_client.new_ ())
