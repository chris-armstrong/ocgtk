(* High-level class for BufferedOutputStream *)
class buffered_output_stream (obj : Buffered_output_stream.t) = object (self)

  method get_auto_grow : unit -> bool =
    fun () ->
      (Buffered_output_stream.get_auto_grow obj)

  method set_auto_grow : bool -> unit =
    fun auto_grow ->
      (Buffered_output_stream.set_auto_grow obj auto_grow)

    method as_buffered_output_stream = obj
end

