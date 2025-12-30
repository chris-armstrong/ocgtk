(* Signal class defined in gsocket_service_signals.ml *)

(* High-level class for SocketService *)
class socket_service (obj : Socket_service.t) = object (self)
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

