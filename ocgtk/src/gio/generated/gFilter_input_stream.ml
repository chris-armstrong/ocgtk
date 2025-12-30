(* High-level class for FilterInputStream *)
class filter_input_stream (obj : Filter_input_stream.t) = object (self)

  method get_base_stream : unit -> GInput_stream.input_stream =
    fun () ->
      new  GInput_stream.input_stream(Filter_input_stream.get_base_stream obj)

  method get_close_base_stream : unit -> bool =
    fun () ->
      (Filter_input_stream.get_close_base_stream obj)

  method set_close_base_stream : bool -> unit =
    fun close_base ->
      (Filter_input_stream.set_close_base_stream obj close_base)

    method as_filter_input_stream = obj
end

