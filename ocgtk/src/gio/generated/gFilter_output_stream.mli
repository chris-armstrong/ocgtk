class type filter_output_stream_t = object
    inherit GOutput_stream.output_stream_t
    method get_base_stream : unit -> GOutput_stream.output_stream_t
    method get_close_base_stream : unit -> bool
    method set_close_base_stream : bool -> unit
    method as_filter_output_stream : Filter_output_stream.t
end

class filter_output_stream : Filter_output_stream.t -> filter_output_stream_t

