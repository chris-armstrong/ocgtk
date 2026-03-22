class type unix_input_stream_t = object
    inherit GInput_stream.input_stream_t
    method get_close_fd : unit -> bool
    method get_fd : unit -> int
    method set_close_fd : bool -> unit
    method as_unix_input_stream : Unix_input_stream.t
end

(* High-level class for UnixInputStream *)
class unix_input_stream (obj : Unix_input_stream.t) : unix_input_stream_t = object (self)
  inherit GInput_stream.input_stream (Obj.magic obj : Input_stream.t)

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

