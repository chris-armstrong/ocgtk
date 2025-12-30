(* High-level class for SocketAddress *)
class socket_address (obj : Socket_address.t) = object (self)

  method get_family : unit -> Gio_enums.socketfamily =
    fun () ->
      (Socket_address.get_family obj)

    method as_socket_address = obj
end

