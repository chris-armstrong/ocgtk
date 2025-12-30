(* High-level class for UnixFDList *)
class unix_fd_list (obj : Unix_fd_list.t) = object (self)

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

