class type scroll_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_direction : unit -> Enums.scrolldirection
  method get_unit : unit -> Enums.scrollunit
  method is_stop : unit -> bool
  method as_scroll_event : Raw.Scroll_event.t
end

(* High-level class for ScrollEvent *)
class scroll_event (obj : Raw.Scroll_event.t) : scroll_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_direction : unit -> Enums.scrolldirection =
      fun () -> Raw.Scroll_event.get_direction obj

    method get_unit : unit -> Enums.scrollunit =
      fun () -> Raw.Scroll_event.get_unit obj

    method is_stop : unit -> bool = fun () -> Raw.Scroll_event.is_stop obj
    method as_scroll_event = obj
  end
