class type buffered_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t
  method get_auto_grow : unit -> bool
  method get_buffer_size : unit -> Gsize.t
  method set_auto_grow : bool -> unit
  method set_buffer_size : Gsize.t -> unit
  method as_buffered_output_stream : Raw.Buffered_output_stream.t
end

(* High-level class for BufferedOutputStream *)
class buffered_output_stream (obj : Raw.Buffered_output_stream.t) :
  buffered_output_stream_t =
  object (self)
    inherit
      Filter_output_stream.filter_output_stream
        (obj :> Raw.Filter_output_stream.t)

    inherit Seekable.seekable (Raw.Seekable.from_gobject obj)

    method get_auto_grow : unit -> bool =
      fun () -> Raw.Buffered_output_stream.get_auto_grow obj

    method get_buffer_size : unit -> Gsize.t =
      fun () -> Raw.Buffered_output_stream.get_buffer_size obj

    method set_auto_grow : bool -> unit =
      fun auto_grow -> Raw.Buffered_output_stream.set_auto_grow obj auto_grow

    method set_buffer_size : Gsize.t -> unit =
      fun size -> Raw.Buffered_output_stream.set_buffer_size obj size

    method as_buffered_output_stream = obj
  end

let new_ (base_stream : Output_stream.output_stream_t) :
    buffered_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let obj_ = Raw.Buffered_output_stream.new_ base_stream in
  new buffered_output_stream obj_

let new_sized (base_stream : Output_stream.output_stream_t) (size : Gsize.t) :
    buffered_output_stream_t =
  let base_stream = base_stream#as_output_stream in
  let obj_ = Raw.Buffered_output_stream.new_sized base_stream size in
  new buffered_output_stream obj_
