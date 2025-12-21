(* High-level class for UnixInputStream *)
class unix_input_stream (obj : Unix_input_stream.t) = object (self)

  method get_close_fd : unit -> bool =
    fun () ->
      (Unix_input_stream.get_close_fd obj)

  method get_fd : unit -> int =
    fun () ->
      (Unix_input_stream.get_fd obj)

  method set_close_fd : bool -> unit =
    fun close_fd ->
      (Unix_input_stream.set_close_fd obj close_fd)

    method as_unix_input_stream = obj
end

