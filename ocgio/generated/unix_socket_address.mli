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
    when using it. This is no longer necessary since GLib 2.72.

    Its methods, signals and properties are on
    {!class-type-unix_socket_address_t}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Unix_socket_address}. *)

(** The methods, signals and properties of a [UnixSocketAddress]. *)
class type unix_socket_address_t = object
  inherit
    Socket_address_and__socket_address_enumerator_and__socket_connectable
    .socket_address_t

  method get_address_type : unit -> Enums.unixsocketaddresstype
  (** Gets [address]'s type. *)

  method get_is_abstract : unit -> bool
  (** Tests if [address] is abstract. *)

  method get_path : unit -> string
  [@@ocaml.doc
    "Gets [address]'s path, or for abstract sockets the \"name\".\n\n\
     Guaranteed to be zero-terminated, but an abstract socket\n\
     may contain embedded zeros, and thus you should use\n\
     g_unix_socket_address_get_path_len() to get the true length\n\
     of this string."]

  method get_path_len : unit -> Gsize.t
  (** Gets the length of [address]'s path.

      For details, see g_unix_socket_address_get_path(). *)

  method abstract : bool
  method as_unix_socket_address : Raw.Unix_socket_address.t
end

class unix_socket_address : Raw.Unix_socket_address.t -> unix_socket_address_t
(** Wraps a raw handle of {!Ocgio.Raw.Unix_socket_address.t}. *)

(** {2:constructors Constructors} *)

val new_ : string -> unix_socket_address_t
(** Creates a new [GUnixSocketAddress] for [path].

    To create abstract socket addresses, on systems that support that, use
    g_unix_socket_address_new_abstract(). *)

val new_abstract : int array -> int -> unix_socket_address_t
(** Creates a new [G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED] [GUnixSocketAddress]
    for [path]. *)

val new_with_type :
  int array -> int -> Enums.unixsocketaddresstype -> unix_socket_address_t
[@@ocaml.doc
  "Creates a new [GUnixSocketAddress] of type [type] with name [path].\n\n\
   If [type] is [G_UNIX_SOCKET_ADDRESS_PATH], this is equivalent to\n\
   calling g_unix_socket_address_new().\n\n\
   If [type] is [G_UNIX_SOCKET_ADDRESS_ANONYMOUS], [path] and [path_len] will be\n\
   ignored.\n\n\
   If [path_type] is [G_UNIX_SOCKET_ADDRESS_ABSTRACT], then [path_len]\n\
   bytes of [path] will be copied to the socket's path, and only those\n\
   bytes will be considered part of the name. (If [path_len] is -1,\n\
   then [path] is assumed to be NUL-terminated.) For example, if [path]\n\
   was \"test\", then calling g_socket_address_get_native_size() on the\n\
   returned socket would return 7 (2 bytes of overhead, 1 byte for the\n\
   abstract-socket indicator byte, and 4 bytes for the name \"test\").\n\n\
   If [path_type] is [G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED], then\n\
   [path_len] bytes of [path] will be copied to the socket's path, the\n\
   rest of the path will be padded with 0 bytes, and the entire\n\
   zero-padded buffer will be considered the name. (As above, if\n\
   [path_len] is -1, then [path] is assumed to be NUL-terminated.) In\n\
   this case, g_socket_address_get_native_size() will always return\n\
   the full size of a [struct sockaddr_un], although\n\
   g_unix_socket_address_get_path_len() will still return just the\n\
   length of [path].\n\n\
   [G_UNIX_SOCKET_ADDRESS_ABSTRACT] is preferred over\n\
   [G_UNIX_SOCKET_ADDRESS_ABSTRACT_PADDED] for new programs. Of course,\n\
   when connecting to a server created by another process, you must\n\
   use the appropriate type corresponding to how that process created\n\
   its listening socket."]
