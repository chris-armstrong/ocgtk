(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

module rec Socket_address : sig
  type t = [ `socket_address | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_address_get_type"

  (* Methods *)

  external get_native_size : t -> int = "ml_g_socket_address_get_native_size"
  (** Gets the size of [address]'s native struct sockaddr. You can use this to
      allocate memory to pass to [g_socket_address_to_native ()]. *)

  external get_family : t -> Ocgio_enums.socketfamily
    = "ml_g_socket_address_get_family"
  (** Gets the socket family type of [address]. *)

  (* Properties *)
end = struct
  type t = [ `socket_address | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_address_get_type"

  (* Methods *)

  external get_native_size : t -> int = "ml_g_socket_address_get_native_size"
  (** Gets the size of [address]'s native struct sockaddr. You can use this to
      allocate memory to pass to [g_socket_address_to_native ()]. *)

  external get_family : t -> Ocgio_enums.socketfamily
    = "ml_g_socket_address_get_family"
  (** Gets the socket family type of [address]. *)

  (* Properties *)
end

and Socket_address_enumerator : sig
  type t = [ `socket_address_enumerator | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t
    = "ml_gio_socket_address_enumerator_get_type"

  (* Methods *)

  external next_finish :
    t -> Async_result.t -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next_finish"
  (** Retrieves the result of a completed call to
      [g_socket_address_enumerator_next_async ()]. See
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} for more information
      about error handling. *)

  external next :
    t -> Cancellable.t option -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next"
  (** Retrieves the next {{!Ocgio.Raw.Socket_address}[GSocketAddress]} from
      [enumerator]. Note that this may block for some amount of time. (Eg, a
      {{!Ocgio.Raw.Network_address}[GNetworkAddress]} may need to do a DNS
      lookup before it can return an address.) Use
      [g_socket_address_enumerator_next_async ()] if you need to avoid blocking.

      If [enumerator] is expected to yield addresses, but for some reason is
      unable to (eg, because of a DNS error), then the first call to
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} will return an
      appropriate error in [*error]. However, if the first call to
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} succeeds, then any
      further internal errors (other than [cancellable] being triggered) will be
      ignored. *)
end = struct
  type t = [ `socket_address_enumerator | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t
    = "ml_gio_socket_address_enumerator_get_type"

  (* Methods *)

  external next_finish :
    t -> Async_result.t -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next_finish"
  (** Retrieves the result of a completed call to
      [g_socket_address_enumerator_next_async ()]. See
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} for more information
      about error handling. *)

  external next :
    t -> Cancellable.t option -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next"
  (** Retrieves the next {{!Ocgio.Raw.Socket_address}[GSocketAddress]} from
      [enumerator]. Note that this may block for some amount of time. (Eg, a
      {{!Ocgio.Raw.Network_address}[GNetworkAddress]} may need to do a DNS
      lookup before it can return an address.) Use
      [g_socket_address_enumerator_next_async ()] if you need to avoid blocking.

      If [enumerator] is expected to yield addresses, but for some reason is
      unable to (eg, because of a DNS error), then the first call to
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} will return an
      appropriate error in [*error]. However, if the first call to
      {{!Ocgio.Raw.Socket_address_enumerator.val-next}[g_socket_address_enumerator_next
                                                       ()]} succeeds, then any
      further internal errors (other than [cancellable] being triggered) will be
      ignored. *)
end

and Socket_connectable : sig
  type t = [ `socket_connectable ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_connectable_get_type"

  external from_gobject : 'a Gobject.obj -> t
    = "ml_gio_socket_connectable_from_gobject"

  (* Methods *)

  external to_string : t -> string = "ml_g_socket_connectable_to_string"
  (** Format a {{!Ocgio.Raw.Socket_connectable}[GSocketConnectable]} as a
      string. This is a human-readable format for use in debugging output, and
      is not a stable serialization format. It is not suitable for use in user
      interfaces as it exposes too much information for a user.

      If the {{!Ocgio.Raw.Socket_connectable}[GSocketConnectable]}
      implementation does not support string formatting, the implementation’s
      type name will be returned as a fallback. *)

  external proxy_enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_proxy_enumerate"
  (** Creates a
      {{!Ocgio.Raw.Socket_address_enumerator}[GSocketAddressEnumerator]} for
      [connectable] that will return a
      {{!Ocgio.Raw.Proxy_address}[GProxyAddress]} for each of its addresses that
      you must connect to via a proxy.

      If [connectable] does not implement
      {{!Ocgio.Raw.Socket_connectable.val-proxy_enumerate}[g_socket_connectable_proxy_enumerate
                                                           ()]}, this will fall
      back to calling
      {{!Ocgio.Raw.Socket_connectable.val-enumerate}[g_socket_connectable_enumerate
                                                     ()]}. *)

  external enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_enumerate"
  (** Creates a
      {{!Ocgio.Raw.Socket_address_enumerator}[GSocketAddressEnumerator]} for
      [connectable]. *)
end = struct
  type t = [ `socket_connectable ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_connectable_get_type"

  external from_gobject : 'a Gobject.obj -> t
    = "ml_gio_socket_connectable_from_gobject"

  (* Methods *)

  external to_string : t -> string = "ml_g_socket_connectable_to_string"
  (** Format a {{!Ocgio.Raw.Socket_connectable}[GSocketConnectable]} as a
      string. This is a human-readable format for use in debugging output, and
      is not a stable serialization format. It is not suitable for use in user
      interfaces as it exposes too much information for a user.

      If the {{!Ocgio.Raw.Socket_connectable}[GSocketConnectable]}
      implementation does not support string formatting, the implementation’s
      type name will be returned as a fallback. *)

  external proxy_enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_proxy_enumerate"
  (** Creates a
      {{!Ocgio.Raw.Socket_address_enumerator}[GSocketAddressEnumerator]} for
      [connectable] that will return a
      {{!Ocgio.Raw.Proxy_address}[GProxyAddress]} for each of its addresses that
      you must connect to via a proxy.

      If [connectable] does not implement
      {{!Ocgio.Raw.Socket_connectable.val-proxy_enumerate}[g_socket_connectable_proxy_enumerate
                                                           ()]}, this will fall
      back to calling
      {{!Ocgio.Raw.Socket_connectable.val-enumerate}[g_socket_connectable_enumerate
                                                     ()]}. *)

  external enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_enumerate"
  (** Creates a
      {{!Ocgio.Raw.Socket_address_enumerator}[GSocketAddressEnumerator]} for
      [connectable]. *)
end
