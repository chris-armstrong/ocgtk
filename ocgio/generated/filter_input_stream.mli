class type filter_input_stream_t = object
  inherit GInput_stream.input_stream_t
  method get_base_stream : unit -> GInput_stream.input_stream_t
  method get_close_base_stream : unit -> bool
  method set_close_base_stream : bool -> unit
  method as_filter_input_stream : Filter_input_stream.t
end

class filter_input_stream : Filter_input_stream.t -> filter_input_stream_t
