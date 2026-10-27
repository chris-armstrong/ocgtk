class type threaded_socket_service_t = object
  inherit Socket_service.socket_service_t
  method max_threads : int
  method as_threaded_socket_service : Raw.Threaded_socket_service.t
end

class threaded_socket_service :
  Raw.Threaded_socket_service.t ->
  threaded_socket_service_t

val new_ : int -> threaded_socket_service_t
