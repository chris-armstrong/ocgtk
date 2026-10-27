class type touch_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_emulating_pointer : unit -> bool
  method as_touch_event : Raw.Touch_event.t
end

class touch_event : Raw.Touch_event.t -> touch_event_t
