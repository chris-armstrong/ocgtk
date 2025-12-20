class pollable_input_stream : Pollable_input_stream.t ->
  object
    method can_poll : unit -> bool
    method is_readable : unit -> bool
    method as_pollable_input_stream : Pollable_input_stream.t
  end

