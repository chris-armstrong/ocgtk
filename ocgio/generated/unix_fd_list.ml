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

(* High-level class for UnixFDList *)
class unix_fd_list (obj : Raw.Unix_fd_list.t) : unix_fd_list_t =
  object (self)
    method append : int -> (int, GError.t) result =
      fun fd -> Raw.Unix_fd_list.append obj fd

    method get : int -> (int, GError.t) result =
      fun index_ -> Raw.Unix_fd_list.get obj index_

    method get_length : unit -> int = fun () -> Raw.Unix_fd_list.get_length obj
    method as_unix_fd_list = obj
  end

let new_ () : unix_fd_list_t = new unix_fd_list (Raw.Unix_fd_list.new_ ())

let new_from_array (fds : int array) (n_fds : int) : unix_fd_list_t =
  let obj_ = Raw.Unix_fd_list.new_from_array fds n_fds in
  new unix_fd_list obj_
