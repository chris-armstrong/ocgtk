class pollable_output_stream : Pollable_output_stream.t ->
  object
    method can_poll : unit -> bool
    method is_writable : unit -> bool
    method as_pollable_output_stream : Pollable_output_stream.t
  end

