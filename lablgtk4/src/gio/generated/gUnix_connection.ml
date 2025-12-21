(* High-level class for UnixConnection *)
class unix_connection (obj : Unix_connection.t) = object (self)

  method receive_credentials : 'p1. (#GCancellable.cancellable as 'p1) option -> (GCredentials.credentials, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      Result.map (fun ret -> new GCredentials.credentials ret)(Unix_connection.receive_credentials obj cancellable)

  method receive_fd : 'p1. (#GCancellable.cancellable as 'p1) option -> (int, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Unix_connection.receive_fd obj cancellable)

  method send_credentials : 'p1. (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Unix_connection.send_credentials obj cancellable)

  method send_fd : 'p1. int -> (#GCancellable.cancellable as 'p1) option -> (bool, GError.t) result =
    fun fd cancellable ->
      let cancellable = Option.map (fun (c) -> c#as_cancellable) cancellable in
      (Unix_connection.send_fd obj fd cancellable)

    method as_unix_connection = obj
end

