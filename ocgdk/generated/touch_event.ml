class type touch_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_emulating_pointer : unit -> bool
  method as_touch_event : Raw.Touch_event.t
end

(* High-level class for TouchEvent *)
class touch_event (obj : Raw.Touch_event.t) : touch_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_emulating_pointer : unit -> bool =
      fun () -> Raw.Touch_event.get_emulating_pointer obj

    method as_touch_event = obj
  end
