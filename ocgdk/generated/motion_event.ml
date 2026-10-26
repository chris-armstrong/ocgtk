class type motion_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_motion_event : Motion_event.t
end

(* High-level class for MotionEvent *)
class motion_event (obj : Motion_event.t) : motion_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method as_motion_event = obj
  end
