class type filter_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method get_base_stream : unit -> GOutput_stream.output_stream_t
    method get_close_base_stream : unit -> bool
    method set_close_base_stream : bool -> unit
    method as_filter_output_stream : Filter_output_stream.t
end

(* High-level class for FilterOutputStream *)
class filter_output_stream (obj : Filter_output_stream.t) : filter_output_stream_t = object (self)
  inherit GOutput_stream.output_stream (Obj.magic obj : Output_stream.t)

  method get_base_stream : unit -> GOutput_stream.output_stream_t =
    fun () ->
      new  GOutput_stream.output_stream(Filter_output_stream.get_base_stream obj)

  method get_close_base_stream : unit -> bool =
    fun () ->
      (Filter_output_stream.get_close_base_stream obj)

  method set_close_base_stream : bool -> unit =
    fun close_base ->
      (Filter_output_stream.set_close_base_stream obj close_base)

    method as_filter_output_stream = obj
end

