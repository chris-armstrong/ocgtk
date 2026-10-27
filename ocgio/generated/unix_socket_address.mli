class type unix_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address_type : unit -> Enums.unixsocketaddresstype
  method get_is_abstract : unit -> bool
  method get_path : unit -> string
  method get_path_len : unit -> Gsize.t
  method abstract : bool
  method as_unix_socket_address : Raw.Unix_socket_address.t
end

class unix_socket_address : Raw.Unix_socket_address.t -> unix_socket_address_t

val new_ : string -> unix_socket_address_t
val new_abstract : int array -> int -> unix_socket_address_t

val new_with_type :
  int array -> int -> Enums.unixsocketaddresstype -> unix_socket_address_t
