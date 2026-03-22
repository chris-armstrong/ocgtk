(* Signal class defined in gsocket_service_signals.ml *)

class type socket_service_t = object
    inherit GSocket_listener.socket_listener_t
    inherit Gsocket_service_signals.socket_service_signals
    method is_active : unit -> bool
    method start : unit -> unit
    method stop : unit -> unit
    method active : bool
    method set_active : bool -> unit
    method as_socket_service : Socket_service.t
end

(* High-level class for SocketService *)
class socket_service (obj : Socket_service.t) : socket_service_t = object (self)
  inherit GSocket_listener.socket_listener (Obj.magic obj : Socket_listener.t)
  inherit Gsocket_service_signals.socket_service_signals obj

  method is_active : unit -> bool =
    fun () ->
      (Socket_service.is_active obj)

  method start : unit -> unit =
    fun () ->
      (Socket_service.start obj)

  method stop : unit -> unit =
    fun () ->
      (Socket_service.stop obj)

  method active = Socket_service.get_active obj
  method set_active v =  Socket_service.set_active obj v

    method as_socket_service = obj
end

let new_ () : socket_service_t =
  new socket_service (Socket_service.new_ ())

