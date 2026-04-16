(* Signal class defined in gthreaded_socket_service_signals.ml *)

class type threaded_socket_service_t = object
  inherit GSocket_service.socket_service_t
  inherit Gthreaded_socket_service_signals.threaded_socket_service_signals
  method max_threads : int
  method as_threaded_socket_service : Threaded_socket_service.t
end

(* High-level class for ThreadedSocketService *)
class threaded_socket_service (obj : Threaded_socket_service.t) :
  threaded_socket_service_t =
  object (self)
    inherit GSocket_service.socket_service (obj :> Socket_service.t)
    inherit Gthreaded_socket_service_signals.threaded_socket_service_signals obj
    method max_threads = Threaded_socket_service.get_max_threads obj
    method as_threaded_socket_service = obj
  end

let new_ (max_threads : int) : threaded_socket_service_t =
  let obj_ = Threaded_socket_service.new_ max_threads in
  new threaded_socket_service obj_
