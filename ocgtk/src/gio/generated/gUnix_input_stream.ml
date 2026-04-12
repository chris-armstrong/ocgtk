class type unix_input_stream_t = object
    inherit GInput_stream.input_stream_t
    inherit GFile_descriptor_based.file_descriptor_based_t
    inherit GPollable_input_stream.pollable_input_stream_t
    method get_close_fd : unit -> bool
    method set_close_fd : bool -> unit
    method as_unix_input_stream : Unix_input_stream.t
end

(* High-level class for UnixInputStream *)
class unix_input_stream (obj : Unix_input_stream.t) : unix_input_stream_t = object (self)
  inherit GInput_stream.input_stream (obj :> Input_stream.t)
  inherit GFile_descriptor_based.file_descriptor_based (File_descriptor_based.from_gobject obj)
  inherit GPollable_input_stream.pollable_input_stream (Pollable_input_stream.from_gobject obj)

  method get_close_fd : unit -> bool =
    fun () ->
      (Unix_input_stream.get_close_fd obj)

  method set_close_fd : bool -> unit =
    fun close_fd ->
      (Unix_input_stream.set_close_fd obj close_fd)

    method as_unix_input_stream = obj
end

let new_ (fd : int) (close_fd : bool) : unix_input_stream_t =
  let obj_ = Unix_input_stream.new_ fd close_fd in
  new unix_input_stream obj_

