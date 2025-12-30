class io_stream : Io_stream.t ->
  object
    method clear_pending : unit -> unit
    method close : #GCancellable.cancellable option -> (bool, GError.t) result
    method get_input_stream : unit -> GInput_stream.input_stream
    method get_output_stream : unit -> GOutput_stream.output_stream
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method closed : bool
    method as_io_stream : Io_stream.t
  end

