class type io_stream_t = object
    method clear_pending : unit -> unit
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method close_finish : GAsync_result.async_result_t -> (bool, GError.t) result
    method get_input_stream : unit -> GInput_stream.input_stream_t
    method get_output_stream : unit -> GOutput_stream.output_stream_t
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method closed : bool
    method as_io_stream : Io_stream.t
end

class io_stream : Io_stream.t -> io_stream_t

