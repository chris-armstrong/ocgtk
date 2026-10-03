(* GENERATED CODE - DO NOT EDIT *)
(* Credentials: Credentials *)

(** The [GCredentials] type is a reference-counted wrapper for native
    credentials.

    The information in [GCredentials] is typically used for identifying,
    authenticating and authorizing other processes.

    Some operating systems supports looking up the credentials of the remote
    peer of a communication endpoint - see e.g. [Gio.Socket.get_credentials].

    Some operating systems supports securely sending and receiving credentials
    over a Unix Domain Socket, see [Gio.UnixCredentialsMessage],
    [Gio.UnixConnection.send_credentials] and
    [Gio.UnixConnection.receive_credentials] for details.

    On Linux, the native credential type is a [struct ucred] - see the man
    page[unix(7)]) for details. This corresponds to
    [G_CREDENTIALS_TYPE_LINUX_UCRED].

    On Apple operating systems (including iOS, tvOS, and macOS), the native
    credential type is a [struct xucred]. This corresponds to
    [G_CREDENTIALS_TYPE_APPLE_XUCRED].

    On FreeBSD, Debian GNU/kFreeBSD, and GNU/Hurd, the native credential type is
    a [struct cmsgcred]. This corresponds to
    [G_CREDENTIALS_TYPE_FREEBSD_CMSGCRED].

    On NetBSD, the native credential type is a [struct unpcbid]. This
    corresponds to [G_CREDENTIALS_TYPE_NETBSD_UNPCBID].

    On OpenBSD, the native credential type is a [struct sockpeercred]. This
    corresponds to [G_CREDENTIALS_TYPE_OPENBSD_SOCKPEERCRED].

    On Solaris (including OpenSolaris and its derivatives), the native
    credential type is a [ucred_t]. This corresponds to
    [G_CREDENTIALS_TYPE_SOLARIS_UCRED].

    Since GLib 2.72, on Windows, the native credentials may contain the PID of a
    process. This corresponds to [G_CREDENTIALS_TYPE_WIN32_PID]. *)

type t = [ `credentials | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_g_credentials_new"
(** Create a new Credentials *)

(* Methods *)

external to_string : t -> string = "ml_g_credentials_to_string"
(** Creates a human-readable textual representation of [credentials] that can be
    used in logging and debug messages. The format of the returned string may
    change in future GLib release. *)

external is_same_user : t -> t -> (bool, GError.t) result
  = "ml_g_credentials_is_same_user"
(** Checks if [credentials] and [other_credentials] is the same user.

    This operation can fail if [GCredentials] is not supported on the the OS. *)
