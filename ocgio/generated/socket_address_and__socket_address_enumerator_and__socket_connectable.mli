(** The classes of {!Ocgio.Socket_address}, {!Ocgio.Socket_address_enumerator},
    {!Ocgio.Socket_connectable}, defined together because they refer to each
    other. Each has a module of its own that re-exports it; use that module
    rather than this one. *)

(** {b The methods, signals and properties of a [SocketAddress].}

    Implements:
    - {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}Ocgio.Socket_connectable}

    [GSocketAddress] is the equivalent of [struct sockaddr]) and its subtypes in
    the BSD sockets API. This is an abstract class; use
    {{!Ocgio.Inet_socket_address.class-type-inet_socket_address_t}[Gio.InetSocketAddress]}
    for internet sockets, or
    {{!Ocgio.Unix_socket_address.class-type-unix_socket_address_t}[Gio.UnixSocketAddress]}
    for UNIX domain sockets. *)
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

(** {b The methods, signals and properties of a [SocketAddressEnumerator].}

    [GSocketAddressEnumerator] is an enumerator type for
    {{!Ocgio.Socket_address.class-type-socket_address_t}[Gio.SocketAddress]}
    instances. It is returned by enumeration functions such as
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t.method-enumerate}
     [Gio.SocketConnectable.enumerate]}, which returns a
    [GSocketAddressEnumerator] to list each
    {{!Ocgio.Socket_address.class-type-socket_address_t}[Gio.SocketAddress]}
    which could be used to connect to that
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t}[Gio.SocketConnectable]}.

    Enumeration is typically a blocking operation, so the asynchronous methods
    [Gio.SocketAddressEnumerator.next_async] and
    {{!Ocgio.Socket_address_enumerator.class-type-socket_address_enumerator_t.method-next_finish}
     [Gio.SocketAddressEnumerator.next_finish]} should be used where possible.

    Each [GSocketAddressEnumerator] can only be enumerated once. Once
    {{!Ocgio.Socket_address_enumerator.class-type-socket_address_enumerator_t.method-next}
     [Gio.SocketAddressEnumerator.next]} has returned [None], further
    enumeration with that [GSocketAddressEnumerator] is not possible, and it can
    be unreffed. *)
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

(** {b The methods, signals and properties of a [SocketConnectable].}

    Objects that describe one or more potential socket endpoints implement
    [GSocketConnectable]. Callers can then use
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t.method-enumerate}
     [Gio.SocketConnectable.enumerate]} to get a
    {{!Ocgio.Socket_address_enumerator.class-type-socket_address_enumerator_t}[Gio.SocketAddressEnumerator]}
    to try out each socket address in turn until one succeeds, as shown in the
    sample code below.

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
    ]} *)
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

(** Wraps a raw handle of {!Ocgio.Raw.Socket_address.t}. *)
class socket_address : Raw.Socket_address.t -> socket_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_address_enumerator.t}. *)

and socket_address_enumerator :
  Raw.Socket_address_enumerator.t ->
  socket_address_enumerator_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_connectable.t}. *)

and socket_connectable : Raw.Socket_connectable.t -> socket_connectable_t
