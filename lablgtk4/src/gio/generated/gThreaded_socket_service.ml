(* Signal class defined in gthreaded_socket_service_signals.ml *)

(* High-level class for ThreadedSocketService *)
class threaded_socket_service (obj : Threaded_socket_service.t) = object (self)
  inherit Gthreaded_socket_service_signals.threaded_socket_service_signals obj

  method max_threads = Threaded_socket_service.get_max_threads obj

    method as_threaded_socket_service = obj
end

