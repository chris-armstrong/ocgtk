class pad_event : Pad_event.t ->
  object
    method get_button : unit -> int
    method as_pad_event : Pad_event.t
  end

