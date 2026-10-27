class type scroll_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_direction : unit -> Enums.scrolldirection
  (** Extracts the direction of a scroll event. *)

  method get_unit : unit -> Enums.scrollunit
  (** Extracts the scroll delta unit of a scroll event.

      The unit will always be [GDK_SCROLL_UNIT_WHEEL] if the scroll direction is
      not [GDK_SCROLL_SMOOTH]. *)

  method is_stop : unit -> bool
  (** Check whether a scroll event is a stop scroll event.

      Scroll sequences with smooth scroll information may provide a stop scroll
      event once the interaction with the device finishes, e.g. by lifting a
      finger. This stop scroll event is the signal that a widget may trigger
      kinetic scrolling based on the current velocity.

      Stop scroll events always have a delta of 0/0. *)

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
