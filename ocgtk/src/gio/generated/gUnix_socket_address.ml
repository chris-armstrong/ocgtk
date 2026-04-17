class type unix_socket_address_t = object
    inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_address_t
    method get_address_type : unit -> Gio_enums.unixsocketaddresstype
    method get_is_abstract : unit -> bool
    method get_path : unit -> string
    method get_path_len : unit -> Gsize.t
    method abstract : bool
    method as_unix_socket_address : Unix_socket_address.t
end

(* High-level class for UnixSocketAddress *)
class unix_socket_address (obj : Unix_socket_address.t) : unix_socket_address_t = object (self)
  inherit GSocket_address_and__socket_address_enumerator_and__socket_connectable.socket_address (obj :> Socket_address_and__socket_address_enumerator_and__socket_connectable.Socket_address.t)

  method get_address_type : unit -> Gio_enums.unixsocketaddresstype =
    fun () ->
      (Unix_socket_address.get_address_type obj)

  method get_is_abstract : unit -> bool =
    fun () ->
      (Unix_socket_address.get_is_abstract obj)

  method get_path : unit -> string =
    fun () ->
      (Unix_socket_address.get_path obj)

  method get_path_len : unit -> Gsize.t =
    fun () ->
      (Unix_socket_address.get_path_len obj)

  method abstract = Unix_socket_address.get_abstract obj

    method as_unix_socket_address = obj
end

let new_ (path : string) : unix_socket_address_t =
  let obj_ = Unix_socket_address.new_ path in
  new unix_socket_address obj_

let new_abstract (path : int array) (path_len : int) : unix_socket_address_t =
  let obj_ = Unix_socket_address.new_abstract path path_len in
  new unix_socket_address obj_

let new_with_type (path : int array) (path_len : int) (type_ : Gio_enums.unixsocketaddresstype) : unix_socket_address_t =
  let obj_ = Unix_socket_address.new_with_type path path_len type_ in
  new unix_socket_address obj_

