(** This is the subclass of [Gio.SocketConnection] that is created for UNIX
    domain sockets.

    It contains functions to do some of the UNIX socket specific functionality
    like passing file descriptors.

    Since GLib 2.72, [GUnixConnection] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixconnection.h>] belonged to the UNIX-specific
    GIO interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file
    when using it. This is no longer necessary since GLib 2.72.

    Its methods, signals and properties are on {!class-type-unix_connection_t}.
    The functions it is built on are in {!Ocgio.Raw.Unix_connection}. *)

(** The methods, signals and properties of a [GUnixConnection]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Unix_connection.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GUnixConnection], give one already wrapped. *)
