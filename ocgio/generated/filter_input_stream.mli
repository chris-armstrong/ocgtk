class type filter_input_stream_t = object
  inherit Input_stream.input_stream_t
  method get_base_stream : unit -> Input_stream.input_stream_t
  method get_close_base_stream : unit -> bool
  method set_close_base_stream : bool -> unit
  method as_filter_input_stream : Raw.Filter_input_stream.t
end

class filter_input_stream : Raw.Filter_input_stream.t -> filter_input_stream_t
