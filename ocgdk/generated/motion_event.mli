(** An event related to a pointer or touch device motion.

    Its methods, signals and properties are on {!class-type-motion_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Motion_event}. *)

(** The methods, signals and properties of a [GdkMotionEvent]. *)
class type motion_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method as_motion_event : Raw.Motion_event.t
end

class motion_event : Raw.Motion_event.t -> motion_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Motion_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkMotionEvent], give one already wrapped. *)
