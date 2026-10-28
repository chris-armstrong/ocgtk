class type unix_connection_t = object
  inherit Socket_and__socket_connection.socket_connection_t

  method receive_credentials :
    Cancellable.cancellable_t option ->
    (Credentials.credentials_t, GError.t) result
  (** Receives credentials from the sending end of the connection. The sending
      end has to call g_unix_connection_send_credentials() (or similar) for this
      to work.

      As well as reading the credentials this also reads (and discards) a single
      byte from the stream, as this is required for credentials passing to work
      on some implementations.

      This method can be expected to be available on the following platforms:

      - Linux since GLib 2.26
      - FreeBSD since GLib 2.26
      - GNU/kFreeBSD since GLib 2.36
      - Solaris, Illumos and OpenSolaris since GLib 2.40
      - GNU/Hurd since GLib 2.40

      Other ways to exchange credentials with a foreign peer includes the
      [GUnixCredentialsMessage] type and g_socket_get_credentials() function. *)

  method receive_credentials_finish :
    Async_result.async_result_t -> (Credentials.credentials_t, GError.t) result
  (** Finishes an asynchronous receive credentials operation started with
      g_unix_connection_receive_credentials_async(). *)

  method receive_fd : Cancellable.cancellable_t option -> (int, GError.t) result
  (** Receives a file descriptor from the sending end of the connection. The
      sending end has to call g_unix_connection_send_fd() for this to work.

      As well as reading the fd this also reads a single byte from the stream,
      as this is required for fd passing to work on some implementations. *)

  method send_credentials :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Passes the credentials of the current user the receiving side of the
      connection. The receiving end has to call
      g_unix_connection_receive_credentials() (or similar) to accept the
      credentials.

      As well as sending the credentials this also writes a single NUL byte to
      the stream, as this is required for credentials passing to work on some
      implementations.

      This method can be expected to be available on the following platforms:

      - Linux since GLib 2.26
      - FreeBSD since GLib 2.26
      - GNU/kFreeBSD since GLib 2.36
      - Solaris, Illumos and OpenSolaris since GLib 2.40
      - GNU/Hurd since GLib 2.40

      Other ways to exchange credentials with a foreign peer includes the
      [GUnixCredentialsMessage] type and g_socket_get_credentials() function. *)

  method send_credentials_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous send credentials operation started with
      g_unix_connection_send_credentials_async(). *)

  method send_fd :
    int -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Passes a file descriptor to the receiving side of the connection. The
      receiving end has to call g_unix_connection_receive_fd() to accept the
      file descriptor.

      As well as sending the fd this also writes a single byte to the stream, as
      this is required for fd passing to work on some implementations. *)

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
