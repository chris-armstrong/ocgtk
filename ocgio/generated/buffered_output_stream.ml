class type buffered_output_stream_t = object
  inherit Filter_output_stream.filter_output_stream_t
  inherit Seekable.seekable_t

  method get_auto_grow : unit -> bool
  (** Checks if the buffer automatically grows as data is added. *)

  method get_buffer_size : unit -> Gsize.t
  (** Gets the size of the buffer in the [stream]. *)

  method set_auto_grow : bool -> unit
  (** Sets whether or not the [stream]'s buffer should automatically grow. If
      [auto_grow] is true, then each write will just make the buffer larger, and
      you must manually flush the buffer to actually write out the data to the
      underlying stream. *)

  method set_buffer_size : Gsize.t -> unit
  (** Sets the size of the internal buffer to [size]. *)

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
