class type socket_service_t = object
  inherit Socket_listener.socket_listener_t
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method as_socket_service : Raw.Socket_service.t
end

class socket_service : Raw.Socket_service.t -> socket_service_t

val new_ : unit -> socket_service_t
