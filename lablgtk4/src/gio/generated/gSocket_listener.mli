class socket_listener : Socket_listener.t ->
  object
    inherit Gsocket_listener_signals.socket_listener_signals
    method close : unit -> unit
    method set_backlog : int -> unit
    method listen_backlog : int
    method set_listen_backlog : int -> unit
    method as_socket_listener : Socket_listener.t
  end

