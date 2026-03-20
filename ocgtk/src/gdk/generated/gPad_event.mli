class type pad_event_t = object
    method get_button : unit -> int
    method as_pad_event : Pad_event.t
end

class pad_event : Pad_event.t -> pad_event_t

