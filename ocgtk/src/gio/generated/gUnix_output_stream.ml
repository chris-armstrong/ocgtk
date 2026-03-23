class type unix_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method get_close_fd : unit -> bool
    method get_fd : unit -> int
    method set_close_fd : bool -> unit
    method as_unix_output_stream : Unix_output_stream.t
end

(* High-level class for UnixOutputStream *)
class unix_output_stream (obj : Unix_output_stream.t) : unix_output_stream_t = object (self)
  inherit GOutput_stream.output_stream (Obj.magic obj : Output_stream.t)

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

let new_ (fd : int) (close_fd : bool) : unix_output_stream_t =
  new unix_output_stream (Unix_output_stream.new_ fd close_fd)

