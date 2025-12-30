class socket_address_enumerator : Socket_address_enumerator.t ->
  object
    method next : #GCancellable.cancellable option -> (GSocket_address.socket_address option, GError.t) result
    method as_socket_address_enumerator : Socket_address_enumerator.t
  end

