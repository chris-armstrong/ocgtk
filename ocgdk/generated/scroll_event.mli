(** An event related to a scrolling motion.

    Its methods, signals and properties are on {!class-type-scroll_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Scroll_event}. *)

(** The methods, signals and properties of a [GdkScrollEvent]. *)
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

class scroll_event : Raw.Scroll_event.t -> scroll_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Scroll_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkScrollEvent], give one already wrapped. *)
