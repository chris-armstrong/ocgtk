(** An event related to a pointer or touch device motion.

    Its methods, signals and properties are on {!class-type-motion_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Motion_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [MotionEvent].}

    An event related to a pointer or touch device motion. *)
class type motion_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:conversions Conversions} *)

  method as_motion_event : Raw.Motion_event.t
end

class motion_event : Raw.Motion_event.t -> motion_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Motion_event.t}. *)
