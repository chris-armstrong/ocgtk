class type output_stream_t = object
  method clear_pending : unit -> unit
  method close : Cancellable.cancellable_t option -> (bool, GError.t) result
  method close_finish : Async_result.async_result_t -> (bool, GError.t) result
  method flush : Cancellable.cancellable_t option -> (bool, GError.t) result
  method flush_finish : Async_result.async_result_t -> (bool, GError.t) result
  method has_pending : unit -> bool
  method is_closed : unit -> bool
  method is_closing : unit -> bool
  method set_pending : unit -> (bool, GError.t) result

  method splice :
    Input_stream.input_stream_t ->
    Enums.outputstreamspliceflags ->
    Cancellable.cancellable_t option ->
    (int, GError.t) result

  method splice_finish : Async_result.async_result_t -> (int, GError.t) result

  method write_bytes :
    Glib_bytes.t -> Cancellable.cancellable_t option -> (int, GError.t) result

  method write_bytes_finish :
    Async_result.async_result_t -> (int, GError.t) result

  method write_finish : Async_result.async_result_t -> (int, GError.t) result
  method as_output_stream : Raw.Output_stream.t
end

class output_stream : Raw.Output_stream.t -> output_stream_t
