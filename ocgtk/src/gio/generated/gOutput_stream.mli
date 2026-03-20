class type output_stream_t = object
    method clear_pending : unit -> unit
    method close : GCancellable.cancellable_t option -> (bool, GError.t) result
    method flush : GCancellable.cancellable_t option -> (bool, GError.t) result
    method has_pending : unit -> bool
    method is_closed : unit -> bool
    method is_closing : unit -> bool
    method set_pending : unit -> (bool, GError.t) result
    method as_output_stream : Output_stream.t
end

class output_stream : Output_stream.t -> output_stream_t

