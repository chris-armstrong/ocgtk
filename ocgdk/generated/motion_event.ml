class type motion_event_t = object
  inherit Event.event_t

  (** {2:conversions Conversions} *)

  method as_motion_event : Raw.Motion_event.t
end

(* High-level class for MotionEvent *)
class motion_event (obj : Raw.Motion_event.t) : motion_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)
    method as_motion_event = obj
  end
