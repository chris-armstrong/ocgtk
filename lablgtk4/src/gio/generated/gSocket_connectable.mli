class socket_connectable : Socket_connectable.t ->
  object
    method enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator
    method proxy_enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator
    method to_string : unit -> string
    method as_socket_connectable : Socket_connectable.t
  end

