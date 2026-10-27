(** The classes of {!Ocgio.Socket_address}, {!Ocgio.Socket_address_enumerator},
    {!Ocgio.Socket_connectable}, defined together because they refer to each
    other. Each has a module of its own that re-exports it; use that module
    rather than this one. *)

(** The methods, signals and properties of a [GSocketAddress]. *)
class type socket_address_t = object
  method get_family : unit -> Enums.socketfamily
  (** Gets the socket family type of [address]. *)

  method get_native_size : unit -> int
  (** Gets the size of [address]'s native struct sockaddr. You can use this to
      allocate memory to pass to g_socket_address_to_native(). *)

  method as_socket_address : Raw.Socket_address.t
end

(** The methods, signals and properties of a [GSocketAddressEnumerator]. *)
and socket_address_enumerator_t = object
  method next :
    Cancellable.cancellable_t option ->
    (socket_address_t option, GError.t) result
  (** Retrieves the next [GSocketAddress] from [enumerator]. Note that this may
      block for some amount of time. (Eg, a [GNetworkAddress] may need to do a
      DNS lookup before it can return an address.) Use
      g_socket_address_enumerator_next_async() if you need to avoid blocking.

      If [enumerator] is expected to yield addresses, but for some reason is
      unable to (eg, because of a DNS error), then the first call to
      g_socket_address_enumerator_next() will return an appropriate error in
      [*error]. However, if the first call to g_socket_address_enumerator_next()
      succeeds, then any further internal errors (other than [cancellable] being
      triggered) will be ignored. *)

  method next_finish :
    Async_result.async_result_t -> (socket_address_t option, GError.t) result
  (** Retrieves the result of a completed call to
      g_socket_address_enumerator_next_async(). See
      g_socket_address_enumerator_next() for more information about error
      handling. *)

  method as_socket_address_enumerator : Raw.Socket_address_enumerator.t
end

(** The methods, signals and properties of a [GSocketConnectable]. *)
and socket_connectable_t = object
  method enumerate : unit -> socket_address_enumerator_t
  (** Creates a [GSocketAddressEnumerator] for [connectable]. *)

  method proxy_enumerate : unit -> socket_address_enumerator_t
  (** Creates a [GSocketAddressEnumerator] for [connectable] that will return a
      [GProxyAddress] for each of its addresses that you must connect to via a
      proxy.

      If [connectable] does not implement
      g_socket_connectable_proxy_enumerate(), this will fall back to calling
      g_socket_connectable_enumerate(). *)

  method to_string : unit -> string
  (** Format a [GSocketConnectable] as a string. This is a human-readable format
      for use in debugging output, and is not a stable serialization format. It
      is not suitable for use in user interfaces as it exposes too much
      information for a user.

      If the [GSocketConnectable] implementation does not support string
      formatting, the implementation’s type name will be returned as a fallback.
  *)

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
