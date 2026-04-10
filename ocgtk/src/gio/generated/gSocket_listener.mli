class type socket_listener_t = object
    inherit Gsocket_listener_signals.socket_listener_signals
    method add_any_inet_port : [`object_] Gobject.obj option -> (UInt16.t, GError.t) result
    method add_inet_port : UInt16.t -> [`object_] Gobject.obj option -> (bool, GError.t) result
    method add_socket : GSocket_and__socket_connection.socket_t -> [`object_] Gobject.obj option -> (bool, GError.t) result
    method close : unit -> unit
    method set_backlog : int -> unit
    method listen_backlog : int
    method set_listen_backlog : int -> unit
    method as_socket_listener : Socket_listener.t
end

class socket_listener : Socket_listener.t -> socket_listener_t

val new_ : unit -> socket_listener_t
