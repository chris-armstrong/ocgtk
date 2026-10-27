(** A [GSocketListener] is an object that keeps track of a set of server sockets
    and helps you accept sockets from any of the socket, either sync or async.

    Add addresses and ports to listen on using [Gio.SocketListener.add_address]
    and [Gio.SocketListener.add_inet_port]. These will be listened on until
    [Gio.SocketListener.close] is called. Dropping your final reference to the
    [GSocketListener] will not cause [Gio.SocketListener.close] to be called
    implicitly, as some references to the [GSocketListener] may be held
    internally.

    If you want to implement a network server, also look at [Gio.SocketService]
    and [Gio.ThreadedSocketService] which are subclasses of [GSocketListener]
    that make this even easier.

    Its methods, signals and properties are on {!class-type-socket_listener_t}.
    The functions it is built on are in {!Ocgio.Raw.Socket_listener}. *)

(** The methods, signals and properties of a [GSocketListener]. *)
class type socket_listener_t = object
  method on_event :
    ?after:bool ->
    callback:
      (event:Enums.socketlistenerevent ->
      socket:Socket_and__socket_connection.socket_t ->
      unit) ->
    unit ->
    Gobject.Signal.handler_id

  method add_any_inet_port :
    [ `object_ ] Gobject.obj option -> (UInt16.t, GError.t) result

  method add_inet_port :
    UInt16.t -> [ `object_ ] Gobject.obj option -> (bool, GError.t) result

  method add_socket :
    Socket_and__socket_connection.socket_t ->
    [ `object_ ] Gobject.obj option ->
    (bool, GError.t) result

  method close : unit -> unit
  method set_backlog : int -> unit
  method listen_backlog : int
  method set_listen_backlog : int -> unit
  method as_socket_listener : Raw.Socket_listener.t
end

class socket_listener : Raw.Socket_listener.t -> socket_listener_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Socket_listener.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GSocketListener], give one already wrapped. *)

val new_ : unit -> socket_listener_t
