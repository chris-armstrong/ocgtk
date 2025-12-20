(* High-level class for FilterOutputStream *)
class filter_output_stream (obj : Filter_output_stream.t) = object (self)

  method get_base_stream : unit -> GOutput_stream.output_stream =
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

