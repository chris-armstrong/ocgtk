class type touch_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_emulating_pointer : unit -> bool
  method as_touch_event : Touch_event.t
end

(* High-level class for TouchEvent *)
class touch_event (obj : Touch_event.t) : touch_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_emulating_pointer : unit -> bool =
      fun () -> Touch_event.get_emulating_pointer obj

    method as_touch_event = obj
  end
