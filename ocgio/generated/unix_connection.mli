(** This is the subclass of
    {{!Ocgio.Socket_connection.class-type-socket_connection_t}[Gio.SocketConnection]}
    that is created for UNIX domain sockets.

    Its methods, signals and properties are on {!class-type-unix_connection_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Unix_connection}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [UnixConnection].}

    Inherits from:
    {{!Ocgio.Socket_connection.class-type-socket_connection_t}Ocgio.Socket_connection}

    This is the subclass of
    {{!Ocgio.Socket_connection.class-type-socket_connection_t}[Gio.SocketConnection]}
    that is created for UNIX domain sockets.

    It contains functions to do some of the UNIX socket specific functionality
    like passing file descriptors.

    Since GLib 2.72, [GUnixConnection] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixconnection.h>] belonged to the UNIX-specific
    GIO interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file
    when using it. This is no longer necessary since GLib 2.72. *)
class type unix_connection_t = object
  inherit Socket_connection.socket_connection_t

  (** {2:methods Methods} *)

  method receive_credentials :
    Cancellable.cancellable_t option ->
    (Credentials.credentials_t, GError.t) result
  (** Receives credentials from the sending end of the connection. The sending
      end has to call [g_unix_connection_send_credentials ()] (or similar) for
      this to work.

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
      [GUnixCredentialsMessage] type and [g_socket_get_credentials ()] function.
  *)

  method receive_credentials_finish :
    Async_result.async_result_t -> (Credentials.credentials_t, GError.t) result
  (** Finishes an asynchronous receive credentials operation started with
      [g_unix_connection_receive_credentials_async ()]. *)

  method receive_fd : Cancellable.cancellable_t option -> (int, GError.t) result
  (** Receives a file descriptor from the sending end of the connection. The
      sending end has to call [g_unix_connection_send_fd ()] for this to work.

      As well as reading the fd this also reads a single byte from the stream,
      as this is required for fd passing to work on some implementations. *)

  method send_credentials :
    Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Passes the credentials of the current user the receiving side of the
      connection. The receiving end has to call
      [g_unix_connection_receive_credentials ()] (or similar) to accept the
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
      [GUnixCredentialsMessage] type and [g_socket_get_credentials ()] function.
  *)

  method send_credentials_finish :
    Async_result.async_result_t -> (bool, GError.t) result
  (** Finishes an asynchronous send credentials operation started with
      [g_unix_connection_send_credentials_async ()]. *)

  method send_fd :
    int -> Cancellable.cancellable_t option -> (bool, GError.t) result
  (** Passes a file descriptor to the receiving side of the connection. The
      receiving end has to call [g_unix_connection_receive_fd ()] to accept the
      file descriptor.

      As well as sending the fd this also writes a single byte to the stream, as
      this is required for fd passing to work on some implementations. *)

  (** {2:conversions Conversions} *)

  method as_unix_connection : Raw.Unix_connection.t
end

class unix_connection : Raw.Unix_connection.t -> unix_connection_t
(** Wraps a raw handle of {!Ocgio.Raw.Unix_connection.t}. *)

(** {1:description Description}

    This is the subclass of
    {{!Ocgio.Socket_connection.class-type-socket_connection_t}[Gio.SocketConnection]}
    that is created for UNIX domain sockets.

    It contains functions to do some of the UNIX socket specific functionality
    like passing file descriptors.

    Since GLib 2.72, [GUnixConnection] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixconnection.h>] belonged to the UNIX-specific
    GIO interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file
    when using it. This is no longer necessary since GLib 2.72. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
