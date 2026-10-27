(** This [Gio.SocketControlMessage] contains a [Gio.Credentials] instance. It
    may be sent using [Gio.Socket.send_message] and received using
    [Gio.Socket.receive_message] over UNIX sockets (ie: sockets in the
    [G_SOCKET_FAMILY_UNIX] family).

    For an easier way to send and receive credentials over stream-oriented UNIX
    sockets, see [Gio.UnixConnection.send_credentials] and
    [Gio.UnixConnection.receive_credentials]. To receive credentials of a
    foreign process connected to a socket, use [Gio.Socket.get_credentials].

    Since GLib 2.72, [GUnixCredentialMessage] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixcredentialsmessage.h>] belonged to the
    UNIX-specific GIO interfaces, thus you had to use the [gio-unix-2.0.pc]
    pkg-config file when using it. This is no longer necessary since GLib 2.72.

    Its methods, signals and properties are on
    {!class-type-unix_credentials_message_t}. The functions it is built on are
    in {!Ocgio.Raw.Unix_credentials_message}. *)

(** The methods, signals and properties of a [GUnixCredentialsMessage]. *)
class type unix_credentials_message_t = object
  inherit Socket_control_message.socket_control_message_t

  method get_credentials : unit -> Credentials.credentials_t
  (** Gets the credentials stored in [message]. *)

  method as_unix_credentials_message : Raw.Unix_credentials_message.t
end

class unix_credentials_message :
  Raw.Unix_credentials_message.t ->
  unix_credentials_message_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Unix_credentials_message.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GUnixCredentialsMessage], give one already wrapped.
*)

val new_ : unit -> unix_credentials_message_t

val new_with_credentials :
  Credentials.credentials_t -> unix_credentials_message_t
