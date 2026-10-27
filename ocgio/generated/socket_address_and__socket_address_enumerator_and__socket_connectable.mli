(** The classes of {!Ocgio.Socket_address}, {!Ocgio.Socket_address_enumerator},
    {!Ocgio.Socket_connectable}, defined together because they refer to each
    other. Each has a module of its own that re-exports it; use that module
    rather than this one. *)

(** The methods, signals and properties of a [GSocketAddress]. *)
class type socket_address_t = object
  method get_family : unit -> Enums.socketfamily
  method get_native_size : unit -> int
  method as_socket_address : Raw.Socket_address.t
end

(** The methods, signals and properties of a [GSocketAddressEnumerator]. *)
and socket_address_enumerator_t = object
  method next :
    Cancellable.cancellable_t option ->
    (socket_address_t option, GError.t) result

  method next_finish :
    Async_result.async_result_t -> (socket_address_t option, GError.t) result

  method as_socket_address_enumerator : Raw.Socket_address_enumerator.t
end

(** The methods, signals and properties of a [GSocketConnectable]. *)
and socket_connectable_t = object
  method enumerate : unit -> socket_address_enumerator_t
  method proxy_enumerate : unit -> socket_address_enumerator_t
  method to_string : unit -> string
  method as_socket_connectable : Raw.Socket_connectable.t
end

(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_address.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketAddress], give one already wrapped. *)
class socket_address : Raw.Socket_address.t -> socket_address_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_address_enumerator.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GSocketAddressEnumerator], give one already wrapped.
*)

and socket_address_enumerator :
  Raw.Socket_address_enumerator.t ->
  socket_address_enumerator_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_connectable.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketConnectable], give one already wrapped. *)

and socket_connectable : Raw.Socket_connectable.t -> socket_connectable_t
