(** A [GUnixFDList] contains a list of file descriptors. It owns the file
    descriptors that it contains, closing them when finalized.

    It may be wrapped in a [GUnixFDMessage] and sent over a [Gio.Socket] in the
    [G_SOCKET_FAMILY_UNIX] family by using [Gio.Socket.send_message] and
    received using [Gio.Socket.receive_message].

    Before 2.74, [<gio/gunixfdlist.h>] belonged to the UNIX-specific GIO
    interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file when
    using it.

    Since 2.74, the API is available for Windows.

    Its methods, signals and properties are on {!class-type-unix_fd_list_t}. The
    functions it is built on are in {!Ocgio.Raw.Unix_fd_list}. *)

(** The methods, signals and properties of a [GUnixFDList]. *)
class type unix_fd_list_t = object
  method append : int -> (int, GError.t) result
  method get : int -> (int, GError.t) result
  method get_length : unit -> int
  method as_unix_fd_list : Raw.Unix_fd_list.t
end

class unix_fd_list : Raw.Unix_fd_list.t -> unix_fd_list_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.Unix_fd_list.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GUnixFDList], give one already wrapped. *)

val new_ : unit -> unix_fd_list_t
val new_from_array : int array -> int -> unix_fd_list_t
