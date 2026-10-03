(* GENERATED CODE - DO NOT EDIT *)
(* UnixSocketAddress: UnixSocketAddress *)

type t = [ `unix_socket_address | `socket_address | `object_ ] Gobject.obj
(** Support for UNIX-domain (also known as local) sockets, corresponding to
    [struct sockaddr_un].

    UNIX domain sockets are generally visible in the filesystem. However, some
    systems support abstract socket names which are not visible in the
    filesystem and not affected by the filesystem permissions, visibility, etc.
    Currently this is only supported under Linux. If you attempt to use abstract
    sockets on other systems, function calls may return
    [G_IO_ERROR_NOT_SUPPORTED] errors. You can use
    [Gio.UnixSocketAddress.abstract_names_supported] to see if abstract names
    are supported.

    Since GLib 2.72, [GUnixSocketAddress] is available on all platforms. It
    requires underlying system support (such as Windows 10 with [AF_UNIX]) at
    run time.

    Before GLib 2.72, [<gio/gunixsocketaddress.h>] belonged to the UNIX-specific
    GIO interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file
    when using it. This is no longer necessary since GLib 2.72. *)

external new_ : string -> t = "ml_g_unix_socket_address_new"
(** Create a new UnixSocketAddress *)

external new_abstract : int array -> int -> t
  = "ml_g_unix_socket_address_new_abstract"
(** Create a new UnixSocketAddress *)

external new_with_type :
  int array -> int -> Gio_enums.unixsocketaddresstype -> t
  = "ml_g_unix_socket_address_new_with_type"
(** Create a new UnixSocketAddress *)

(* Methods *)

external get_path_len : t -> Gsize.t = "ml_g_unix_socket_address_get_path_len"
(** Gets the length of [address]'s path.

    For details, see g_unix_socket_address_get_path(). *)

external get_path : t -> string = "ml_g_unix_socket_address_get_path"
(** Gets [address]'s path, or for abstract sockets the “name”.

    Guaranteed to be zero-terminated, but an abstract socket may contain
    embedded zeros, and thus you should use g_unix_socket_address_get_path_len()
    to get the true length of this string. *)

external get_is_abstract : t -> bool
  = "ml_g_unix_socket_address_get_is_abstract"
(** Tests if [address] is abstract. *)

external get_address_type : t -> Gio_enums.unixsocketaddresstype
  = "ml_g_unix_socket_address_get_address_type"
(** Gets [address]'s type. *)

(* Properties *)

external get_abstract : t -> bool = "ml_g_unix_socket_address_get_abstract"
(** Get property: abstract *)
