class type unix_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address_type : unit -> Enums.unixsocketaddresstype
  (** Gets [address]'s type. *)

  method get_is_abstract : unit -> bool
  (** Tests if [address] is abstract. *)

  method get_path : unit -> string
  [@@ocaml.doc
    "Gets [address]'s path, or for abstract sockets the \"name\".\n\n\
     Guaranteed to be zero-terminated, but an abstract socket\n\
     may contain embedded zeros, and thus you should use\n\
     g_unix_socket_address_get_path_len() to get the true length\n\
     of this string."]

  method get_path_len : unit -> Gsize.t
  (** Gets the length of [address]'s path.

      For details, see g_unix_socket_address_get_path(). *)

  method abstract : bool
  method as_unix_socket_address : Raw.Unix_socket_address.t
end

(* High-level class for UnixSocketAddress *)
class unix_socket_address (obj : Raw.Unix_socket_address.t) :
  unix_socket_address_t =
  object (self)
    inherit
      Socket_address_and__socket_address_enumerator_and__socket_connectable
      .socket_address
        (obj :> Raw.Socket_address.t)

    method get_address_type : unit -> Enums.unixsocketaddresstype =
      fun () -> Raw.Unix_socket_address.get_address_type obj

    method get_is_abstract : unit -> bool =
      fun () -> Raw.Unix_socket_address.get_is_abstract obj

    method get_path : unit -> string =
      fun () -> Raw.Unix_socket_address.get_path obj

    method get_path_len : unit -> Gsize.t =
      fun () -> Raw.Unix_socket_address.get_path_len obj

    method abstract = Raw.Unix_socket_address.get_abstract obj
    method as_unix_socket_address = obj
  end

let new_ (path : string) : unix_socket_address_t =
  let obj_ = Raw.Unix_socket_address.new_ path in
  new unix_socket_address obj_

let new_abstract (path : int array) (path_len : int) : unix_socket_address_t =
  let obj_ = Raw.Unix_socket_address.new_abstract path path_len in
  new unix_socket_address obj_

let new_with_type (path : int array) (path_len : int)
    (type_ : Enums.unixsocketaddresstype) : unix_socket_address_t =
  let obj_ = Raw.Unix_socket_address.new_with_type path path_len type_ in
  new unix_socket_address obj_
