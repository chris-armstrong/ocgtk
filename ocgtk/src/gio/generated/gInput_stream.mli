class type input_stream_t = object
    method clear_pending : unit -> unit
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method as_input_stream : Input_stream.t
end

class input_stream : Input_stream.t -> input_stream_t

