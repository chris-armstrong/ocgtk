class type motion_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method as_motion_event : Raw.Motion_event.t
end

(* High-level class for MotionEvent *)
class motion_event (obj : Raw.Motion_event.t) : motion_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)
    method as_motion_event = obj
  end
