(** A [GSocketService] is an object that represents a service that is provided
    to the network or over local sockets. When a new connection is made to the
    service the [Gio.SocketService::incoming] signal is emitted.

    Its methods, signals and properties are on {!class-type-socket_service_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Socket_service}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [SocketService].}

    A [GSocketService] is an object that represents a service that is provided
    to the network or over local sockets. When a new connection is made to the
    service the [Gio.SocketService::incoming] signal is emitted.

    A [GSocketService] is a subclass of [Gio.SocketListener] and you need to add
    the addresses you want to accept connections on with the
    [Gio.SocketListener] APIs.

    There are two options for implementing a network service based on
    [GSocketService]. The first is to create the service using
    [Gio.SocketService.new] and to connect to the [Gio.SocketService::incoming]
    signal. The second is to subclass [GSocketService] and override the default
    signal handler implementation.

    In either case, the handler must immediately return, or else it will block
    additional incoming connections from being serviced. If you are interested
    in writing connection handlers that contain blocking code then see
    [Gio.ThreadedSocketService].

    The socket service runs on the main loop of the thread-default context (see
    [GLib.MainContext.push_thread_default]) of the thread it is created in, and
    is not threadsafe in general. However, the calls to start and stop the
    service are thread-safe so these can be used from threads that handle
    incoming clients. *)
class type socket_service_t = object
  inherit Socket_listener.socket_listener_t

  method is_active : unit -> bool
  (** Check whether the service is active or not. An active service will accept
      new clients that connect, while a non-active service will let connecting
      clients queue up until the service is started. *)

  method start : unit -> unit
  (** Restarts the service, i.e. start accepting connections from the added
      sockets when the mainloop runs. This only needs to be called after the
      service has been stopped from g_socket_service_stop().

      This call is thread-safe, so it may be called from a thread handling an
      incoming client request. *)

  method stop : unit -> unit
  (** Stops the service, i.e. stops accepting connections from the added sockets
      when the mainloop runs.

      This call is thread-safe, so it may be called from a thread handling an
      incoming client request.

      Note that this only stops accepting new connections; it does not close the
      listening sockets, and you can call g_socket_service_start() again later
      to begin listening again. To close the listening sockets, call
      g_socket_listener_close(). (This will happen automatically when the
      [GSocketService] is finalized.)

      This must be called before calling g_socket_listener_close() as the socket
      service will start accepting connections immediately when a new socket is
      added. *)

  method as_socket_service : Raw.Socket_service.t
end

class socket_service : Raw.Socket_service.t -> socket_service_t
(** Wraps a raw handle of {!Ocgio.Raw.Socket_service.t}. *)

(** {1:description Description}

    A [GSocketService] is an object that represents a service that is provided
    to the network or over local sockets. When a new connection is made to the
    service the [Gio.SocketService::incoming] signal is emitted.

    A [GSocketService] is a subclass of [Gio.SocketListener] and you need to add
    the addresses you want to accept connections on with the
    [Gio.SocketListener] APIs.

    There are two options for implementing a network service based on
    [GSocketService]. The first is to create the service using
    [Gio.SocketService.new] and to connect to the [Gio.SocketService::incoming]
    signal. The second is to subclass [GSocketService] and override the default
    signal handler implementation.

    In either case, the handler must immediately return, or else it will block
    additional incoming connections from being serviced. If you are interested
    in writing connection handlers that contain blocking code then see
    [Gio.ThreadedSocketService].

    The socket service runs on the main loop of the thread-default context (see
    [GLib.MainContext.push_thread_default]) of the thread it is created in, and
    is not threadsafe in general. However, the calls to start and stop the
    service are thread-safe so these can be used from threads that handle
    incoming clients. *)

(** {1:constructors Constructors} *)

val new_ : unit -> socket_service_t
(** Creates a new [GSocketService] with no sockets to listen for. New listeners
    can be added with e.g. g_socket_listener_add_address() or
    g_socket_listener_add_inet_port().

    New services are created active, there is no need to call
    g_socket_service_start(), unless g_socket_service_stop() has been called
    before. *)
