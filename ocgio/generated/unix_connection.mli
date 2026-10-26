class type unix_connection_t = object
  inherit Socket_and__socket_connection.socket_connection_t

  method receive_credentials :
    Cancellable.cancellable_t option ->
    (Credentials.credentials_t, GError.t) result

  method receive_credentials_finish :
    Async_result.async_result_t -> (Credentials.credentials_t, GError.t) result

  method receive_fd : Cancellable.cancellable_t option -> (int, GError.t) result

  method send_credentials :
    Cancellable.cancellable_t option -> (bool, GError.t) result

  method send_credentials_finish :
    Async_result.async_result_t -> (bool, GError.t) result

  method send_fd :
    int -> Cancellable.cancellable_t option -> (bool, GError.t) result

  method as_unix_connection : Raw.Unix_connection.t
end

class unix_connection : Raw.Unix_connection.t -> unix_connection_t
