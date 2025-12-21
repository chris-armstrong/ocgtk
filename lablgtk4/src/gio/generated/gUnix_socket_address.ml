(* High-level class for UnixSocketAddress *)
class unix_socket_address (obj : Unix_socket_address.t) = object (self)

  method get_address_type : unit -> Gio_enums.unixsocketaddresstype =
    fun () ->
      (Unix_socket_address.get_address_type obj)

  method get_is_abstract : unit -> bool =
    fun () ->
      (Unix_socket_address.get_is_abstract obj)

  method get_path : unit -> string =
    fun () ->
      (Unix_socket_address.get_path obj)

  method abstract = Unix_socket_address.get_abstract obj

    method as_unix_socket_address = obj
end

