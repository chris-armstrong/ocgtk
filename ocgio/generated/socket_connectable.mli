(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for SocketConnectable from cyclic group Socket_address_and__socket_address_enumerator_and__socket_connectable *)

(** Objects that describe one or more potential socket endpoints implement
    [GSocketConnectable]. Callers can then use
    {{!Ocgio.Socket_connectable.class-type-socket_connectable_t.method-enumerate}
     [Gio.SocketConnectable.enumerate]} to get a
    {{!Ocgio.Socket_address_enumerator.class-type-socket_address_enumerator_t}[Gio.SocketAddressEnumerator]}
    to try out each socket address in turn until one succeeds, as shown in the
    sample code below.

    Its methods, signals and properties are on
    {!class-type-socket_connectable_t}. Its full description is under
    {!section-description}. Its constructors are under {!section-constructors}.
    The functions it is built on are in {!Ocgio.Raw.Socket_connectable}. *)

(** {1:class Class} *)

class type socket_connectable_t =
  Socket_address_and__socket_address_enumerator_and__socket_connectable
  .socket_connectable_t
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

class socket_connectable : Raw.Socket_connectable.t -> socket_connectable_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_connectable.t}. *)

(** {1:description Description}

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

(** {1:constructors Constructors} *)

(** This is an interface which can't be instantiated directly, but which may be
    returned from a method or function. *)
