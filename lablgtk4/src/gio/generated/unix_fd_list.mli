(* GENERATED CODE - DO NOT EDIT *)
(* UnixFDList: UnixFDList *)

type t = [`unix_fd_list | `object_] Gobject.obj

(** Create a new UnixFDList *)
external new_ : unit -> t = "ml_g_unix_fd_list_new"

(** Create a new UnixFDList *)
external new_from_array : unit -> int -> t = "ml_g_unix_fd_list_new_from_array"

(* Methods *)
(** Gets the length of @list (ie: the number of file descriptors
contained within). *)
external get_length : t -> int = "ml_g_unix_fd_list_get_length"

(** Gets a file descriptor out of @list.

@index_ specifies the index of the file descriptor to get.  It is a
programmer error for @index_ to be out of range; see
g_unix_fd_list_get_length().

The file descriptor is duplicated using dup() and set as
close-on-exec before being returned.  You must call close() on it
when you are done.

A possible cause of failure is exceeding the per-process or
system-wide file descriptor limit. *)
external get : t -> int -> (int, GError.t) result = "ml_g_unix_fd_list_get"

(** Adds a file descriptor to @list.

The file descriptor is duplicated using dup(). You keep your copy
of the descriptor and the copy contained in @list will be closed
when @list is finalized.

A possible cause of failure is exceeding the per-process or
system-wide file descriptor limit.

The index of the file descriptor in the list is returned.  If you use
this index with g_unix_fd_list_get() then you will receive back a
duplicated copy of the same file descriptor. *)
external append : t -> int -> (int, GError.t) result = "ml_g_unix_fd_list_append"

