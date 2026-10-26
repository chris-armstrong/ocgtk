class type socket_service_t = object
  inherit GSocket_listener.socket_listener_t
  method is_active : unit -> bool
  method start : unit -> unit
  method stop : unit -> unit
  method as_socket_service : Socket_service.t
end

(* High-level class for SocketService *)
class socket_service (obj : Socket_service.t) : socket_service_t =
  object (self)
    inherit GSocket_listener.socket_listener (obj :> Socket_listener.t)
    method is_active : unit -> bool = fun () -> Socket_service.is_active obj
    method start : unit -> unit = fun () -> Socket_service.start obj
    method stop : unit -> unit = fun () -> Socket_service.stop obj
    method as_socket_service = obj
  end

let new_ () : socket_service_t = new socket_service (Socket_service.new_ ())
