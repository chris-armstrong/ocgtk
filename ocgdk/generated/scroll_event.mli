(** An event related to a scrolling motion.

    Its methods, signals and properties are on {!class-type-scroll_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Scroll_event}. *)

(** The methods, signals and properties of a [GdkScrollEvent]. *)
class type scroll_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_direction : unit -> Enums.scrolldirection
  method get_unit : unit -> Enums.scrollunit
  method is_stop : unit -> bool
  method as_scroll_event : Raw.Scroll_event.t
end

class scroll_event : Raw.Scroll_event.t -> scroll_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Scroll_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkScrollEvent], give one already wrapped. *)
