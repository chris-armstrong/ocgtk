class threaded_socket_service : Threaded_socket_service.t ->
  object
    inherit Gthreaded_socket_service_signals.threaded_socket_service_signals
    method max_threads : int
    method as_threaded_socket_service : Threaded_socket_service.t
  end

