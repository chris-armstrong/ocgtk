class type scroll_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_direction : unit -> Enums.scrolldirection
  method get_unit : unit -> Enums.scrollunit
  method is_stop : unit -> bool
  method as_scroll_event : Raw.Scroll_event.t
end

class scroll_event : Raw.Scroll_event.t -> scroll_event_t
