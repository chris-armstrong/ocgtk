class type scroll_event_t = object
    method get_direction : unit -> Gdk_enums.scrolldirection
    method get_unit : unit -> Gdk_enums.scrollunit
    method is_stop : unit -> bool
    method as_scroll_event : Scroll_event.t
end

(* High-level class for ScrollEvent *)
class scroll_event (obj : Scroll_event.t) : scroll_event_t = object (self)

  method get_direction : unit -> Gdk_enums.scrolldirection =
    fun () ->
      (Scroll_event.get_direction obj)

  method get_unit : unit -> Gdk_enums.scrollunit =
    fun () ->
      (Scroll_event.get_unit obj)

  method is_stop : unit -> bool =
    fun () ->
      (Scroll_event.is_stop obj)

    method as_scroll_event = obj
end

