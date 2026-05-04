class type socket_client_t = object
  method add_application_proxy : string -> unit

  method connect :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_connectable_t ->
    GCancellable.cancellable_t option ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_finish :
    GAsync_result.async_result_t ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_host :
    string ->
    UInt16.t ->
    GCancellable.cancellable_t option ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_host_finish :
    GAsync_result.async_result_t ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_service :
    string ->
    string ->
    GCancellable.cancellable_t option ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_service_finish :
    GAsync_result.async_result_t ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_uri :
    string ->
    UInt16.t ->
    GCancellable.cancellable_t option ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method connect_to_uri_finish :
    GAsync_result.async_result_t ->
    (GSocket_and__socket_connection.socket_connection_t, GError.t) result

  method get_enable_proxy : unit -> bool
  method get_family : unit -> Gio_enums.socketfamily

  method get_local_address :
    unit ->
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option

  method get_protocol : unit -> Gio_enums.socketprotocol
  method get_proxy_resolver : unit -> GProxy_resolver.proxy_resolver_t
  method get_socket_type : unit -> Gio_enums.sockettype
  method get_timeout : unit -> int
  method get_tls : unit -> bool
  method get_tls_validation_flags : unit -> Gio_enums.tlscertificateflags
  method set_enable_proxy : bool -> unit
  method set_family : Gio_enums.socketfamily -> unit

  method set_local_address :
    GSocket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t
    option ->
    unit

  method set_protocol : Gio_enums.socketprotocol -> unit
  method set_proxy_resolver : GProxy_resolver.proxy_resolver_t option -> unit
  method set_socket_type : Gio_enums.sockettype -> unit
  method set_timeout : int -> unit
  method set_tls : bool -> unit
  method set_tls_validation_flags : Gio_enums.tlscertificateflags -> unit
  method type_ : Gio_enums.sockettype
  method set_type : Gio_enums.sockettype -> unit
  method as_socket_client : Socket_client.t
end

class socket_client : Socket_client.t -> socket_client_t

val new_ : unit -> socket_client_t
