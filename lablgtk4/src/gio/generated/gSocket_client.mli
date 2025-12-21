class socket_client : Socket_client.t ->
  object
    inherit Gsocket_client_signals.socket_client_signals
    method add_application_proxy : string -> unit
    method connect_to_service : string -> string -> #GCancellable.cancellable option -> (GSocket_and__socket_connection.socket_connection, GError.t) result
    method get_enable_proxy : unit -> bool
    method get_family : unit -> Gio_enums.socketfamily
    method get_local_address : unit -> GSocket_address.socket_address option
    method get_protocol : unit -> Gio_enums.socketprotocol
    method get_socket_type : unit -> Gio_enums.sockettype
    method get_timeout : unit -> int
    method get_tls : unit -> bool
    method set_enable_proxy : bool -> unit
    method set_family : Gio_enums.socketfamily -> unit
    method set_local_address : #GSocket_address.socket_address option -> unit
    method set_protocol : Gio_enums.socketprotocol -> unit
    method set_socket_type : Gio_enums.sockettype -> unit
    method set_timeout : int -> unit
    method set_tls : bool -> unit
    method type_ : Gio_enums.sockettype
    method set_type : Gio_enums.sockettype -> unit
    method as_socket_client : Socket_client.t
  end

