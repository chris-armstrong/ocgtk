class unix_connection : Unix_connection.t ->
  object
    method receive_credentials : #GCancellable.cancellable option -> (GCredentials.credentials, GError.t) result
    method receive_fd : #GCancellable.cancellable option -> (int, GError.t) result
    method send_credentials : #GCancellable.cancellable option -> (bool, GError.t) result
    method send_fd : int -> #GCancellable.cancellable option -> (bool, GError.t) result
    method as_unix_connection : Unix_connection.t
  end

