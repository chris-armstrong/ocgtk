(* Signal class defined in gsocket_client_signals.ml *)

class type socket_client_t = object
    inherit Gsocket_client_signals.socket_client_signals
    method add_application_proxy : string -> unit
    method connect_to_host : string -> int -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result
    method connect_to_service : string -> string -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result
    method connect_to_uri : string -> int -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result
    method get_enable_proxy : unit -> bool
    method get_family : unit -> Gio_enums.socketfamily
    method get_local_address : unit -> GSocket_address.socket_address_t option
    method get_protocol : unit -> Gio_enums.socketprotocol
    method get_proxy_resolver : unit -> GProxy_resolver.proxy_resolver_t
    method get_socket_type : unit -> Gio_enums.sockettype
    method get_timeout : unit -> int
    method get_tls : unit -> bool
    method get_tls_validation_flags : unit -> Gio_enums.tlscertificateflags
    method set_enable_proxy : bool -> unit
    method set_family : Gio_enums.socketfamily -> unit
    method set_local_address : GSocket_address.socket_address_t option -> unit
    method set_protocol : Gio_enums.socketprotocol -> unit
    method set_socket_type : Gio_enums.sockettype -> unit
    method set_timeout : int -> unit
    method set_tls : bool -> unit
    method set_tls_validation_flags : Gio_enums.tlscertificateflags -> unit
    method type_ : Gio_enums.sockettype
    method set_type : Gio_enums.sockettype -> unit
    method as_socket_client : Socket_client.t
end

(* High-level class for SocketClient *)
class socket_client (obj : Socket_client.t) : socket_client_t = object (self)
  inherit Gsocket_client_signals.socket_client_signals obj

  method add_application_proxy : string -> unit =
    fun protocol ->
      (Socket_client.add_application_proxy obj protocol)

  method connect_to_host : string -> int -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result =
    fun host_and_port default_port cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GSocket_and__socket_connection.socket_connection ret)(Socket_client.connect_to_host obj host_and_port default_port cancellable)

  method connect_to_service : string -> string -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result =
    fun domain service cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GSocket_and__socket_connection.socket_connection ret)(Socket_client.connect_to_service obj domain service cancellable)

  method connect_to_uri : string -> int -> GCancellable.cancellable_t option -> (GSocket_and__socket_connection.socket_connection_t, GError.t) result =
    fun uri default_port cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GSocket_and__socket_connection.socket_connection ret)(Socket_client.connect_to_uri obj uri default_port cancellable)

  method get_enable_proxy : unit -> bool =
    fun () ->
      (Socket_client.get_enable_proxy obj)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_client.get_family obj)

  method get_local_address : unit -> GSocket_address.socket_address_t option =
    fun () ->
      Option.map (fun ret -> new GSocket_address.socket_address ret) (Socket_client.get_local_address obj)

  method get_protocol : unit -> Gio_enums.socketprotocol =
    fun () ->
      (Socket_client.get_protocol obj)

  method get_proxy_resolver : unit -> GProxy_resolver.proxy_resolver_t =
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

  method set_local_address : GSocket_address.socket_address_t option -> unit =
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

let new_ () : socket_client_t =
  new socket_client (Socket_client.new_ ())

