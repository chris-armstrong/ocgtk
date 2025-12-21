class socket_address : Socket_address.t ->
  object
    method get_family : unit -> Gio_enums.socketfamily
    method as_socket_address : Socket_address.t
  end

