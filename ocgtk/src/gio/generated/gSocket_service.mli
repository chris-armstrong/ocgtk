class socket_service : Socket_service.t ->
  object
    inherit Gsocket_service_signals.socket_service_signals
    method is_active : unit -> bool
    method start : unit -> unit
    method stop : unit -> unit
    method active : bool
    method set_active : bool -> unit
    method as_socket_service : Socket_service.t
  end

