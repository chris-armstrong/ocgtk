(* GENERATED CODE - DO NOT EDIT *)
(* Combined modules for cyclic dependencies *)

(** The layer 1 modules of {!Ocgio.Raw.Socket_address},
    {!Ocgio.Raw.Socket_address_enumerator}, {!Ocgio.Raw.Socket_connectable},
    defined together because they refer to each other. Each has a module of its
    own that re-exports it; use that module rather than this one. *)

(** [GSocketAddress] is the equivalent of [struct sockaddr]) and its subtypes in
    the BSD sockets API. This is an abstract class; use
    {{!Ocgio.Raw.Inet_socket_address}[Gio.InetSocketAddress]} for internet
    sockets, or {{!Ocgio.Raw.Unix_socket_address}[Gio.UnixSocketAddress]} for
    UNIX domain sockets.

    The class built on this module is in {!Ocgio.Socket_address}. *)
module rec Socket_address : sig
  type t = [ `socket_address | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_address_get_type"

  (* Methods *)

  external get_native_size : t -> int = "ml_g_socket_address_get_native_size"
  (** Gets the size of [address]'s native struct sockaddr. You can use this to
      allocate memory to pass to g_socket_address_to_native(). *)

  external get_family : t -> Ocgio_enums.socketfamily
    = "ml_g_socket_address_get_family"
  (** Gets the socket family type of [address]. *)

  (* Properties *)
end

(** [GSocketAddressEnumerator] is an enumerator type for
    {{!Ocgio.Raw.Socket_address}[Gio.SocketAddress]} instances. It is returned
    by enumeration functions such as
    {{!Ocgio.Raw.Socket_connectable.val-enumerate}[Gio.SocketConnectable.enumerate]},
    which returns a [GSocketAddressEnumerator] to list each
    {{!Ocgio.Raw.Socket_address}[Gio.SocketAddress]} which could be used to
    connect to that {{!Ocgio.Raw.Socket_connectable}[Gio.SocketConnectable]}.

    Enumeration is typically a blocking operation, so the asynchronous methods
    [Gio.SocketAddressEnumerator.next_async] and
    {{!Ocgio.Raw.Socket_address_enumerator.val-next_finish}[Gio.SocketAddressEnumerator.next_finish]}
    should be used where possible.

    Each [GSocketAddressEnumerator] can only be enumerated once. Once
    {{!Ocgio.Raw.Socket_address_enumerator.val-next}[Gio.SocketAddressEnumerator.next]}
    has returned [None], further enumeration with that
    [GSocketAddressEnumerator] is not possible, and it can be unreffed.

    The class built on this module is in {!Ocgio.Socket_address_enumerator}. *)
and Socket_address_enumerator : sig
  type t = [ `socket_address_enumerator | `object_ ] Gobject.obj

  external gtype : unit -> Gobject.Type.t
    = "ml_gio_socket_address_enumerator_get_type"

  (* Methods *)

  external next_finish :
    t -> Async_result.t -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next_finish"
  (** Retrieves the result of a completed call to
      g_socket_address_enumerator_next_async(). See
      g_socket_address_enumerator_next() for more information about error
      handling. *)

  external next :
    t -> Cancellable.t option -> (Socket_address.t option, GError.t) result
    = "ml_g_socket_address_enumerator_next"
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
end

(** Objects that describe one or more potential socket endpoints implement
    [GSocketConnectable]. Callers can then use
    {{!Ocgio.Raw.Socket_connectable.val-enumerate}[Gio.SocketConnectable.enumerate]}
    to get a
    {{!Ocgio.Raw.Socket_address_enumerator}[Gio.SocketAddressEnumerator]} to try
    out each socket address in turn until one succeeds, as shown in the sample
    code below.

    {[
    MyConnectionType *
    connect_to_host (const char    *hostname,
                     guint16        port,
                     GCancellable  *cancellable,
                     GError       **error)
    {
      MyConnection *conn = NULL;
      GSocketConnectable *addr;
      GSocketAddressEnumerator *enumerator;
      GSocketAddress *sockaddr;
      GError *conn_error = NULL;

      addr = g_network_address_new (hostname, port);
      enumerator = g_socket_connectable_enumerate (addr);
      g_object_unref (addr);

      // Try each sockaddr until we succeed. Record the first connection error,
      // but not any further ones (since they'll probably be basically the same
      // as the first).
      while (!conn && (sockaddr = g_socket_address_enumerator_next (enumerator, cancellable, error))
        {
          conn = connect_to_sockaddr (sockaddr, conn_error ? NULL : &conn_error);
          g_object_unref (sockaddr);
        }
      g_object_unref (enumerator);

      if (conn)
        {
          if (conn_error)
            {
              // We couldn't connect to the first address, but we succeeded
              // in connecting to a later address.
              g_error_free (conn_error);
            }
          return conn;
        }
      else if (error)
        {
          /// Either initial lookup failed, or else the caller cancelled us.
          if (conn_error)
            g_error_free (conn_error);
          return NULL;
        }
      else
        {
          g_error_propagate (error, conn_error);
          return NULL;
        }
    }
    ]}

    The class built on this module is in {!Ocgio.Socket_connectable}. *)
and Socket_connectable : sig
  type t = [ `socket_connectable ] Gobject.obj

  external gtype : unit -> Gobject.Type.t = "ml_gio_socket_connectable_get_type"

  external from_gobject : 'a Gobject.obj -> t
    = "ml_gio_socket_connectable_from_gobject"

  (* Methods *)

  external to_string : t -> string = "ml_g_socket_connectable_to_string"
  (** Format a [GSocketConnectable] as a string. This is a human-readable format
      for use in debugging output, and is not a stable serialization format. It
      is not suitable for use in user interfaces as it exposes too much
      information for a user.

      If the [GSocketConnectable] implementation does not support string
      formatting, the implementation’s type name will be returned as a fallback.
  *)

  external proxy_enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_proxy_enumerate"
  (** Creates a [GSocketAddressEnumerator] for [connectable] that will return a
      [GProxyAddress] for each of its addresses that you must connect to via a
      proxy.

      If [connectable] does not implement
      g_socket_connectable_proxy_enumerate(), this will fall back to calling
      g_socket_connectable_enumerate(). *)

  external enumerate : t -> Socket_address_enumerator.t
    = "ml_g_socket_connectable_enumerate"
  (** Creates a [GSocketAddressEnumerator] for [connectable]. *)
end
