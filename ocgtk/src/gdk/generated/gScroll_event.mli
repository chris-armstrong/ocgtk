class type scroll_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_direction : unit -> Gdk_enums.scrolldirection
  method get_unit : unit -> Gdk_enums.scrollunit
  method is_stop : unit -> bool
  method as_scroll_event : Scroll_event.t
end

class scroll_event : Scroll_event.t -> scroll_event_t
