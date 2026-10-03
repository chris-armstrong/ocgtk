(* GENERATED CODE - DO NOT EDIT *)
(* UnixCredentialsMessage: UnixCredentialsMessage *)

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
*)

type t =
  [ `unix_credentials_message | `socket_control_message | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_g_unix_credentials_message_new"
(** Create a new UnixCredentialsMessage *)

external new_with_credentials : Credentials.t -> t
  = "ml_g_unix_credentials_message_new_with_credentials"
(** Create a new UnixCredentialsMessage *)

(* Methods *)

external get_credentials : t -> Credentials.t
  = "ml_g_unix_credentials_message_get_credentials"
(** Gets the credentials stored in [message]. *)

(* Properties *)
