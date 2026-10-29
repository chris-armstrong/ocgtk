(* GENERATED CODE - DO NOT EDIT *)
(* UnixCredentialsMessage: UnixCredentialsMessage *)

(** This {{!Ocgio.Raw.Socket_control_message}[Gio.SocketControlMessage]}
    contains a {{!Ocgio.Raw.Credentials}[Gio.Credentials]} instance. It may be
    sent using {{!Ocgio.Raw.Socket.val-send_message}[Gio.Socket.send_message]}
    and received using [Gio.Socket.receive_message] over UNIX sockets (ie:
    sockets in the [G_SOCKET_FAMILY_UNIX] family).

    For an easier way to send and receive credentials over stream-oriented UNIX
    sockets, see
    {{!Ocgio.Raw.Unix_connection.val-send_credentials}[Gio.UnixConnection.send_credentials]}
    and
    {{!Ocgio.Raw.Unix_connection.val-receive_credentials}[Gio.UnixConnection.receive_credentials]}.
    To receive credentials of a foreign process connected to a socket, use
    {{!Ocgio.Raw.Socket.val-get_credentials}[Gio.Socket.get_credentials]}.

    Since GLib 2.72, [GUnixCredentialMessage] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixcredentialsmessage.h>] belonged to the
    UNIX-specific GIO interfaces, thus you had to use the [gio-unix-2.0.pc]
    pkg-config file when using it. This is no longer necessary since GLib 2.72.

    The class built on this module is in {!Ocgio.Unix_credentials_message}. *)

type t =
  [ `unix_credentials_message | `socket_control_message | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t
  = "ml_gio_unix_credentials_message_get_type"

external new_ : unit -> t = "ml_g_unix_credentials_message_new"
(** Creates a new
    {{!Ocgio.Raw.Unix_credentials_message}[GUnixCredentialsMessage]} with
    credentials matching the current processes. *)

external new_with_credentials : Credentials.t -> t
  = "ml_g_unix_credentials_message_new_with_credentials"
(** Creates a new
    {{!Ocgio.Raw.Unix_credentials_message}[GUnixCredentialsMessage]} holding
    [credentials]. *)

(* Methods *)

external get_credentials : t -> Credentials.t
  = "ml_g_unix_credentials_message_get_credentials"
(** Gets the credentials stored in [message]. *)

(* Properties *)
