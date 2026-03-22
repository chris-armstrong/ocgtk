class type unix_fd_list_t = object
    method append : int -> (int, GError.t) result
    method get : int -> (int, GError.t) result
    method get_length : unit -> int
    method as_unix_fd_list : Unix_fd_list.t
end

(* High-level class for UnixFDList *)
class unix_fd_list (obj : Unix_fd_list.t) : unix_fd_list_t = object (self)

  method append : int -> (int, GError.t) result =
    fun fd ->
      (Unix_fd_list.append obj fd)

  method get : int -> (int, GError.t) result =
    fun index_ ->
      (Unix_fd_list.get obj index_)

  method get_length : unit -> int =
    fun () ->
      (Unix_fd_list.get_length obj)

    method as_unix_fd_list = obj
end

let new_ () : unix_fd_list_t =
  new unix_fd_list (Unix_fd_list.new_ ())

let new_from_array (fds : int array) (n_fds : int) : unix_fd_list_t =
  new unix_fd_list (Unix_fd_list.new_from_array fds n_fds)

