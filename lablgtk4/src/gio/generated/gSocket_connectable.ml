(* High-level class for SocketConnectable *)
class socket_connectable (obj : Socket_connectable.t) = object (self)

  method enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator =
    fun () ->
      new  GSocket_address_enumerator.socket_address_enumerator(Socket_connectable.enumerate obj)

  method proxy_enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator =
    fun () ->
      new  GSocket_address_enumerator.socket_address_enumerator(Socket_connectable.proxy_enumerate obj)

  method to_string : unit -> string =
    fun () ->
      (Socket_connectable.to_string obj)

    method as_socket_connectable = obj
end

