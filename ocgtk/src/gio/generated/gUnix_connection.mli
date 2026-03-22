class type unix_connection_t = object
    inherit GSocket_and__socket_connection.socket_connection_t
    method receive_credentials : GCancellable.cancellable_t option -> (GCredentials.credentials_t, GError.t) result
    method receive_fd : GCancellable.cancellable_t option -> (int, GError.t) result
    method send_credentials : GCancellable.cancellable_t option -> (bool, GError.t) result
    method send_fd : int -> GCancellable.cancellable_t option -> (bool, GError.t) result
    method as_unix_connection : Unix_connection.t
end

class unix_connection : Unix_connection.t -> unix_connection_t

