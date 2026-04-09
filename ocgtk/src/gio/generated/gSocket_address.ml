class type socket_address_t = object
    method get_family : unit -> Gio_enums.socketfamily
    method get_native_size : unit -> int
    method as_socket_address : Socket_address.t
end

(* High-level class for SocketAddress *)
class socket_address (obj : Socket_address.t) : socket_address_t = object (self)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_address.get_family obj)

  method get_native_size : unit -> int =
    fun () ->
      (Socket_address.get_native_size obj)

    method as_socket_address = obj
end

