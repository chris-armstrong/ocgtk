class type socket_connectable_t = object
    method enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t
    method proxy_enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t
    method to_string : unit -> string
    method as_socket_connectable : Socket_connectable.t
end

(* High-level class for SocketConnectable *)
class socket_connectable (obj : Socket_connectable.t) : socket_connectable_t = object (self)

  method enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t =
    fun () ->
      new  GSocket_address_enumerator.socket_address_enumerator(Socket_connectable.enumerate obj)

  method proxy_enumerate : unit -> GSocket_address_enumerator.socket_address_enumerator_t =
    fun () ->
      new  GSocket_address_enumerator.socket_address_enumerator(Socket_connectable.proxy_enumerate obj)

  method to_string : unit -> string =
    fun () ->
      (Socket_connectable.to_string obj)

    method as_socket_connectable = obj
end

