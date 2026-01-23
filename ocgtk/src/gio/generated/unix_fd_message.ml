(* GENERATED CODE - DO NOT EDIT *)
(* UnixFDMessage: UnixFDMessage *)

type t = [`unix_fd_message | `socket_control_message | `object_] Gobject.obj

(** Create a new UnixFDMessage *)
external new_ : unit -> t = "ml_g_unix_fd_message_new"

(** Create a new UnixFDMessage *)
external new_with_fd_list : Unix_fd_list.t -> t = "ml_g_unix_fd_message_new_with_fd_list"

(* Methods *)
(** Returns the array of file descriptors that is contained in this
object.

After this call, the descriptors are no longer contained in
@message. Further calls will return an empty list (unless more
descriptors have been added).

The return result of this function must be freed with g_free().
The caller is also responsible for closing all of the file
descriptors.

If @length is non-%NULL then it is set to the number of file
descriptors in the returned array. The returned array is also
terminated with -1.

This function never returns %NULL. In case there are no file
descriptors contained in @message, an empty array is returned. *)
external steal_fds : t -> int array * int = "ml_g_unix_fd_message_steal_fds"

(** Gets the #GUnixFDList contained in @message.  This function does not
return a reference to the caller, but the returned list is valid for
the lifetime of @message. *)
external get_fd_list : t -> Unix_fd_list.t = "ml_g_unix_fd_message_get_fd_list"

(** Adds a file descriptor to @message.

The file descriptor is duplicated using dup(). You keep your copy
of the descriptor and the copy contained in @message will be closed
when @message is finalized.

A possible cause of failure is exceeding the per-process or
system-wide file descriptor limit. *)
external append_fd : t -> int -> (bool, GError.t) result = "ml_g_unix_fd_message_append_fd"

(* Properties *)

