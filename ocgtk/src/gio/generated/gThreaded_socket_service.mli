class type threaded_socket_service_t = object
    inherit GSocket_service.socket_service_t
    inherit Gthreaded_socket_service_signals.threaded_socket_service_signals
    method max_threads : int
    method as_threaded_socket_service : Threaded_socket_service.t
end

class threaded_socket_service : Threaded_socket_service.t -> threaded_socket_service_t

val new_ : int -> threaded_socket_service_t
