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
    {!class-type-unix_socket_address_t}. The functions it is built on are in
    {!Ocgio.Raw.Unix_socket_address}. *)

(** The methods, signals and properties of a [GUnixSocketAddress]. *)
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
(** Wraps a layer 1 handle, {!Ocgio.Raw.Unix_socket_address.t}. Apply it
    directly only to convert a handle obtained from layer 1: constructors, and
    methods that return a [GUnixSocketAddress], give one already wrapped. *)

val new_ : string -> unix_socket_address_t
val new_abstract : int array -> int -> unix_socket_address_t

val new_with_type :
  int array -> int -> Enums.unixsocketaddresstype -> unix_socket_address_t
