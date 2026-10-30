class type threaded_socket_service_t = object
  inherit Socket_service.socket_service_t

  (** {2:properties Properties} *)

  method max_threads : int
  (** The maximum number of threads handling clients for this service. *)

  (** {2:conversions Conversions} *)

  method as_threaded_socket_service : Raw.Threaded_socket_service.t
end

(* High-level class for ThreadedSocketService *)
class threaded_socket_service (obj : Raw.Threaded_socket_service.t) :
  threaded_socket_service_t =
  object (self)
    inherit Socket_service.socket_service (obj :> Raw.Socket_service.t)
    method max_threads = Raw.Threaded_socket_service.get_max_threads obj
    method as_threaded_socket_service = obj
  end

let new_ (max_threads : int) : threaded_socket_service_t =
  let obj_ = Raw.Threaded_socket_service.new_ max_threads in
  new threaded_socket_service obj_
