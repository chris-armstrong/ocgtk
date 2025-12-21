class input_stream : Input_stream.t ->
  object
    method clear_pending : unit -> unit
    method close : #GCancellable.cancellable option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method as_input_stream : Input_stream.t
  end

