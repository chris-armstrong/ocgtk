(** A [GSocketListener] is an object that keeps track of a set of server sockets
    and helps you accept sockets from any of the socket, either sync or async.

    Its methods, signals and properties are on {!class-type-socket_listener_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Socket_listener}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SocketListener].}

    A [GSocketListener] is an object that keeps track of a set of server sockets
    and helps you accept sockets from any of the socket, either sync or async.

    Add addresses and ports to listen on using [Gio.SocketListener.add_address]
    and [Gio.SocketListener.add_inet_port]. These will be listened on until
    [Gio.SocketListener.close] is called. Dropping your final reference to the
    [GSocketListener] will not cause [Gio.SocketListener.close] to be called
    implicitly, as some references to the [GSocketListener] may be held
    internally.

    If you want to implement a network server, also look at [Gio.SocketService]
    and [Gio.ThreadedSocketService] which are subclasses of [GSocketListener]
    that make this even easier. *)
class type socket_listener_t = object
  (** {2:signals Signals} *)

  method on_event :
    ?after:bool ->
    callback:
      (event:Enums.socketlistenerevent ->
      socket:Socket_and__socket_connection.socket_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when [listener]'s activity on [socket] changes state. Note that
      when [listener] is used to listen on both IPv4 and IPv6, a separate set of
      signals will be emitted for each, and the order they happen in is
      undefined. *)

  (** {2:methods Methods} *)

  method add_any_inet_port :
    [ `object_ ] Gobject.obj option -> (UInt16.t, GError.t) result
  (** Listens for TCP connections on any available port number for both IPv6 and
      IPv4 (if each is available).

      This is useful if you need to have a socket for incoming connections but
      don't care about the specific port number.

      If possible, the [Gio.SocketListener] will listen on both IPv4 and IPv6
      (listening on the same port on both). If listening on one of the socket
      families fails, the [Gio.SocketListener] will only listen on the other. If
      listening on both fails, an error will be returned.

      If you need to distinguish whether listening on IPv4 or IPv6 or both was
      successful, connect to [Gio.SocketListener::event].

      [source_object] will be passed out in the various calls to accept to
      identify this particular source, which is useful if you're listening on
      multiple addresses and do different things depending on what address is
      connected to. *)

  method add_inet_port :
    UInt16.t -> [ `object_ ] Gobject.obj option -> (bool, GError.t) result
  (** Helper function for g_socket_listener_add_address() that creates a TCP/IP
      socket listening on IPv4 and IPv6 (if supported) on the specified port on
      all interfaces.

      If possible, the [Gio.SocketListener] will listen on both IPv4 and IPv6
      (listening on the same port on both). If listening on one of the socket
      families fails, the [Gio.SocketListener] will only listen on the other. If
      listening on both fails, an error will be returned.

      If you need to distinguish whether listening on IPv4 or IPv6 or both was
      successful, connect to [Gio.SocketListener::event].

      [source_object] will be passed out in the various calls to accept to
      identify this particular source, which is useful if you're listening on
      multiple addresses and do different things depending on what address is
      connected to.

      Call g_socket_listener_close() to stop listening on [port]; this will not
      be done automatically when you drop your final reference to [listener], as
      references may be held internally. *)

  method add_socket :
    Socket_and__socket_connection.socket_t ->
    [ `object_ ] Gobject.obj option ->
    (bool, GError.t) result
  (** Adds [socket] to the set of sockets that we try to accept new clients
      from. The socket must be bound to a local address and listened to.

      For parallel calls to [Gio.SocketListener] methods to work, the socket
      must be in non-blocking mode. (See [Gio.Socket:blocking].)

      [source_object] will be passed out in the various calls to accept to
      identify this particular source, which is useful if you're listening on
      multiple addresses and do different things depending on what address is
      connected to.

      The [socket] will not be automatically closed when the [listener] is
      finalized unless the listener held the final reference to the socket.
      Before GLib 2.42, the [socket] was automatically closed on finalization of
      the [listener], even if references to it were held elsewhere. *)

  method close : unit -> unit
  (** Closes all the sockets in the listener. *)

  method set_backlog : int -> unit
  (** Sets the listen backlog on the sockets in the listener. This must be
      called before adding any sockets, addresses or ports to the
      [GSocketListener] (for example, by calling
      g_socket_listener_add_inet_port()) to be effective.

      See g_socket_set_listen_backlog() for details *)

  (** {2:properties Properties} *)

  method listen_backlog : int
  (** The number of outstanding connections in the listen queue. *)

  method set_listen_backlog : int -> unit
  (** The number of outstanding connections in the listen queue. *)

  (** {2:conversions Conversions} *)

  method as_socket_listener : Raw.Socket_listener.t
end

class socket_listener : Raw.Socket_listener.t -> socket_listener_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_listener.t}. *)

(** {1:description Description}

    A [GSocketListener] is an object that keeps track of a set of server sockets
    and helps you accept sockets from any of the socket, either sync or async.

    Add addresses and ports to listen on using [Gio.SocketListener.add_address]
    and [Gio.SocketListener.add_inet_port]. These will be listened on until
    [Gio.SocketListener.close] is called. Dropping your final reference to the
    [GSocketListener] will not cause [Gio.SocketListener.close] to be called
    implicitly, as some references to the [GSocketListener] may be held
    internally.

    If you want to implement a network server, also look at [Gio.SocketService]
    and [Gio.ThreadedSocketService] which are subclasses of [GSocketListener]
    that make this even easier. *)

(** {1:constructors Constructors} *)

val new_ : unit -> socket_listener_t
(** Creates a new [GSocketListener] with no sockets to listen for. New listeners
    can be added with e.g. g_socket_listener_add_address() or
    g_socket_listener_add_inet_port(). *)
