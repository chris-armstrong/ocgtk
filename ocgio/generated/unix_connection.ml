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

(* High-level class for UnixConnection *)
class unix_connection (obj : Raw.Unix_connection.t) : unix_connection_t =
  object (self)
    inherit
      Socket_and__socket_connection.socket_connection
        (obj :> Raw.Socket_connection.t)

    method receive_credentials :
        Cancellable.cancellable_t option ->
        (Credentials.credentials_t, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Result.map
          (fun ret -> new Credentials.credentials ret)
          (Raw.Unix_connection.receive_credentials obj cancellable)

    method receive_credentials_finish :
        Async_result.async_result_t ->
        (Credentials.credentials_t, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Result.map
          (fun ret -> new Credentials.credentials ret)
          (Raw.Unix_connection.receive_credentials_finish obj result)

    method receive_fd :
        Cancellable.cancellable_t option -> (int, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Unix_connection.receive_fd obj cancellable

    method send_credentials :
        Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Unix_connection.send_credentials obj cancellable

    method send_credentials_finish :
        Async_result.async_result_t -> (bool, GError.t) result =
      fun result ->
        let result = result#as_async_result in
        Raw.Unix_connection.send_credentials_finish obj result

    method send_fd :
        int -> Cancellable.cancellable_t option -> (bool, GError.t) result =
      fun fd cancellable ->
        let cancellable = Option.map (fun c -> c#as_cancellable) cancellable in
        Raw.Unix_connection.send_fd obj fd cancellable

    method as_unix_connection = obj
  end
