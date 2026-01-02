class scroll_event : Scroll_event.t ->
  object
    method get_direction : unit -> Gdk_enums.scrolldirection
    method get_unit : unit -> Gdk_enums.scrollunit
    method is_stop : unit -> bool
    method as_scroll_event : Scroll_event.t
  end

