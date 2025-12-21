(* High-level class for UnixOutputStream *)
class unix_output_stream (obj : Unix_output_stream.t) = object (self)

  method get_close_fd : unit -> bool =
    fun () ->
      (Unix_output_stream.get_close_fd obj)

  method get_fd : unit -> int =
    fun () ->
      (Unix_output_stream.get_fd obj)

  method set_close_fd : bool -> unit =
    fun close_fd ->
      (Unix_output_stream.set_close_fd obj close_fd)

    method as_unix_output_stream = obj
end

