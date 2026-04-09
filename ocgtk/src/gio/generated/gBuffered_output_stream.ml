class type buffered_output_stream_t = object
    inherit GFilter_output_stream.filter_output_stream_t
    inherit GSeekable.seekable_t
    method get_auto_grow : unit -> bool
    method set_auto_grow : bool -> unit
    method as_buffered_output_stream : Buffered_output_stream.t
end

(* High-level class for BufferedOutputStream *)
class buffered_output_stream (obj : Buffered_output_stream.t) : buffered_output_stream_t = object (self)
  inherit GFilter_output_stream.filter_output_stream (obj :> Filter_output_stream.t)
  inherit GSeekable.seekable (Seekable.from_gobject obj)

  method get_auto_grow : unit -> bool =
    fun () ->
      (Buffered_output_stream.get_auto_grow obj)

  method set_auto_grow : bool -> unit =
    fun auto_grow ->
      (Buffered_output_stream.set_auto_grow obj auto_grow)

    method as_buffered_output_stream = obj
end

let new_ (base_stream : GOutput_stream.output_stream_t) : buffered_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let obj_ = Buffered_output_stream.new_ base_stream in
  new buffered_output_stream obj_

