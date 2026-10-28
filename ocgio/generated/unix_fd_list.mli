(** A [GUnixFDList] contains a list of file descriptors. It owns the file
    descriptors that it contains, closing them when finalized.

    Its methods, signals and properties are on {!class-type-unix_fd_list_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.Unix_fd_list}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [UnixFDList].}

    A [GUnixFDList] contains a list of file descriptors. It owns the file
    descriptors that it contains, closing them when finalized.

    It may be wrapped in a [GUnixFDMessage] and sent over a [Gio.Socket] in the
    [G_SOCKET_FAMILY_UNIX] family by using [Gio.Socket.send_message] and
    received using [Gio.Socket.receive_message].

    Before 2.74, [<gio/gunixfdlist.h>] belonged to the UNIX-specific GIO
    interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file when
    using it.

    Since 2.74, the API is available for Windows. *)
class type unix_fd_list_t = object
  (** {2:methods Methods} *)

  method append : int -> (int, GError.t) result
  (** Adds a file descriptor to [list].

      The file descriptor is duplicated using dup(). You keep your copy of the
      descriptor and the copy contained in [list] will be closed when [list] is
      finalized.

      A possible cause of failure is exceeding the per-process or system-wide
      file descriptor limit.

      The index of the file descriptor in the list is returned. If you use this
      index with g_unix_fd_list_get() then you will receive back a duplicated
      copy of the same file descriptor. *)

  method get : int -> (int, GError.t) result
  (** Gets a file descriptor out of [list].

      [index_] specifies the index of the file descriptor to get. It is a
      programmer error for [index_] to be out of range; see
      g_unix_fd_list_get_length().

      The file descriptor is duplicated using dup() and set as close-on-exec
      before being returned. You must call close() on it when you are done.

      A possible cause of failure is exceeding the per-process or system-wide
      file descriptor limit. *)

  method get_length : unit -> int
  (** Gets the length of [list] (ie: the number of file descriptors contained
      within). *)

  (** {2:conversions Conversions} *)

  method as_unix_fd_list : Raw.Unix_fd_list.t
end

class unix_fd_list : Raw.Unix_fd_list.t -> unix_fd_list_t
(** Wraps a raw handle of {!Ocgio.Raw.Unix_fd_list.t}. *)

(** {1:description Description}

    A [GUnixFDList] contains a list of file descriptors. It owns the file
    descriptors that it contains, closing them when finalized.

    It may be wrapped in a [GUnixFDMessage] and sent over a [Gio.Socket] in the
    [G_SOCKET_FAMILY_UNIX] family by using [Gio.Socket.send_message] and
    received using [Gio.Socket.receive_message].

    Before 2.74, [<gio/gunixfdlist.h>] belonged to the UNIX-specific GIO
    interfaces, thus you had to use the [gio-unix-2.0.pc] pkg-config file when
    using it.

    Since 2.74, the API is available for Windows. *)

(** {1:constructors Constructors} *)

val new_ : unit -> unix_fd_list_t
(** Creates a new [GUnixFDList] containing no file descriptors. *)

val new_from_array : int array -> int -> unix_fd_list_t
(** Creates a new [GUnixFDList] containing the file descriptors given in [fds].
    The file descriptors become the property of the new list and may no longer
    be used by the caller. The array itself is owned by the caller.

    Each file descriptor in the array should be set to close-on-exec.

    If [n_fds] is -1 then [fds] must be terminated with -1. *)
