(* Signal class defined in gsocket_client_signals.ml *)

(* High-level class for SocketClient *)
class socket_client (obj : Socket_client.t) = object (self)
  inherit Gsocket_client_signals.socket_client_signals obj

  method add_application_proxy : string -> unit =
    fun protocol ->
      (Socket_client.add_application_proxy obj protocol)

  method connect_to_service : 'p1. string -> string -> (#GCancellable.cancellable as 'p1) option -> (GSocket_and__socket_connection.socket_connection, GError.t) result =
    fun domain service cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GSocket_and__socket_connection.socket_connection ret)(Socket_client.connect_to_service obj domain service cancellable)

  method get_enable_proxy : unit -> bool =
    fun () ->
      (Socket_client.get_enable_proxy obj)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_client.get_family obj)

  method get_local_address : unit -> GSocket_address.socket_address option =
    fun () ->
      Option.map (fun ret -> new GSocket_address.socket_address ret) (Socket_client.get_local_address obj)

  method get_protocol : unit -> Gio_enums.socketprotocol =
    fun () ->
      (Socket_client.get_protocol obj)

  method get_proxy_resolver : unit -> GProxy_resolver.proxy_resolver =
    fun () ->
      new  GProxy_resolver.proxy_resolver(Socket_client.get_proxy_resolver obj)

  method get_socket_type : unit -> Gio_enums.sockettype =
    fun () ->
      (Socket_client.get_socket_type obj)

  method get_timeout : unit -> int =
    fun () ->
      (Socket_client.get_timeout obj)

  method get_tls : unit -> bool =
    fun () ->
      (Socket_client.get_tls obj)

  method get_tls_validation_flags : unit -> Gio_enums.tlscertificateflags =
    fun () ->
      (Socket_client.get_tls_validation_flags obj)

  method set_enable_proxy : bool -> unit =
    fun enable ->
      (Socket_client.set_enable_proxy obj enable)

  method set_family : Gio_enums.socketfamily -> unit =
    fun family ->
      (Socket_client.set_family obj family)

  method set_local_address : 'p1. (#GSocket_address.socket_address as 'p1) option -> unit =
    fun address ->
      let address = Option.map (fun (c) -> c#as_socket_address) address in
      (Socket_client.set_local_address obj address)

  method set_protocol : Gio_enums.socketprotocol -> unit =
    fun protocol ->
      (Socket_client.set_protocol obj protocol)

  method set_socket_type : Gio_enums.sockettype -> unit =
    fun type_ ->
      (Socket_client.set_socket_type obj type_)

  method set_timeout : int -> unit =
    fun timeout ->
      (Socket_client.set_timeout obj timeout)

  method set_tls : bool -> unit =
    fun tls ->
      (Socket_client.set_tls obj tls)

  method set_tls_validation_flags : Gio_enums.tlscertificateflags -> unit =
    fun flags ->
      (Socket_client.set_tls_validation_flags obj flags)

  method type_ = Socket_client.get_type obj
  method set_type v =  Socket_client.set_type obj v

    method as_socket_client = obj
end

