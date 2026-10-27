(** A [GSocketService] is an object that represents a service that is provided
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
    incoming clients.

    Its methods, signals and properties are on {!class-type-socket_service_t}.
    The functions it is built on are in {!Ocgio.Raw.Socket_service}. *)

(** The methods, signals and properties of a [GSocketService]. *)
class type socket_service_t = object
  inherit Socket_listener.socket_listener_t
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method as_socket_service : Raw.Socket_service.t
end

class socket_service : Raw.Socket_service.t -> socket_service_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_service.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketService], give one already wrapped. *)

val new_ : unit -> socket_service_t
