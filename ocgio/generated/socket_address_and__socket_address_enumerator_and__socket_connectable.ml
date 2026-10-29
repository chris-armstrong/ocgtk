(* GENERATED CODE - DO NOT EDIT *)
(* Combined classes for cyclic dependencies *)

class type socket_address_t = object
  (** {2:methods Methods} *)

  method get_family : unit -> Enums.socketfamily
  (** Gets the socket family type of [address]. *)

  method get_native_size : unit -> int
  (** Gets the size of [address]'s native struct sockaddr. You can use this to
      allocate memory to pass to [g_socket_address_to_native ()]. *)

  (** {2:conversions Conversions} *)

  method as_socket_address : Raw.Socket_address.t
end

and socket_address_enumerator_t = object
  (** {2:methods Methods} *)

  method next :
    Cancellable.cancellable_t option ->
    (socket_address_t option, GError.t) result
  (** Retrieves the next [GSocketAddress] from [enumerator]. Note that this may
      block for some amount of time. (Eg, a [GNetworkAddress] may need to do a
      DNS lookup before it can return an address.) Use
      [g_socket_address_enumerator_next_async ()] if you need to avoid blocking.

      If [enumerator] is expected to yield addresses, but for some reason is
      unable to (eg, because of a DNS error), then the first call to
      [g_socket_address_enumerator_next ()] will return an appropriate error in
      [*error]. However, if the first call to
      [g_socket_address_enumerator_next ()] succeeds, then any further internal
      errors (other than [cancellable] being triggered) will be ignored. *)

  method next_finish :
    Async_result.async_result_t -> (socket_address_t option, GError.t) result
  (** Retrieves the result of a completed call to
      [g_socket_address_enumerator_next_async ()]. See
      [g_socket_address_enumerator_next ()] for more information about error
      handling. *)

  (** {2:conversions Conversions} *)

  method as_socket_address_enumerator : Raw.Socket_address_enumerator.t
end

and socket_connectable_t = object
  (** {2:methods Methods} *)

  method enumerate : unit -> socket_address_enumerator_t
  (** Creates a [GSocketAddressEnumerator] for [connectable]. *)

  method proxy_enumerate : unit -> socket_address_enumerator_t
  (** Creates a [GSocketAddressEnumerator] for [connectable] that will return a
      [GProxyAddress] for each of its addresses that you must connect to via a
      proxy.

      If [connectable] does not implement
      [g_socket_connectable_proxy_enumerate ()], this will fall back to calling
      [g_socket_connectable_enumerate ()]. *)

  method to_string : unit -> string
  (** Format a [GSocketConnectable] as a string. This is a human-readable format
      for use in debugging output, and is not a stable serialization format. It
      is not suitable for use in user interfaces as it exposes too much
      information for a user.

      If the [GSocketConnectable] implementation does not support string
      formatting, the implementation’s type name will be returned as a fallback.
  *)

  (** {2:conversions Conversions} *)

  method as_socket_connectable : Raw.Socket_connectable.t
end

class socket_address (obj : Raw.Socket_address.t) : socket_address_t =
  object (self)
    method get_family : unit -> Enums.socketfamily =
      fun () -> Raw.Socket_address.get_family obj

    method get_native_size : unit -> int =
      fun () -> Raw.Socket_address.get_native_size obj

    method as_socket_address = obj
  end

and socket_address_enumerator (obj : Raw.Socket_address_enumerator.t) :
  socket_address_enumerator_t =
  object (self)
    method next :
        Cancellable.cancellable_t option ->
        (socket_address_t option, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> Option.map (fun ret -> new socket_address ret) ret)
          (Raw.Socket_address_enumerator.next obj cancellable)

    method next_finish :
        Async_result.async_result_t ->
        (socket_address_t option, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> Option.map (fun ret -> new socket_address ret) ret)
          (Raw.Socket_address_enumerator.next_finish obj result)

    method as_socket_address_enumerator = obj
  end

and socket_connectable (obj : Raw.Socket_connectable.t) : socket_connectable_t =
  object (self)
    method enumerate : unit -> socket_address_enumerator_t =
      fun () ->
        new socket_address_enumerator (Raw.Socket_connectable.enumerate obj)

    method proxy_enumerate : unit -> socket_address_enumerator_t =
      fun () ->
        new socket_address_enumerator
          (Raw.Socket_connectable.proxy_enumerate obj)

    method to_string : unit -> string =
      fun () -> Raw.Socket_connectable.to_string obj

    method as_socket_connectable = obj
  end
