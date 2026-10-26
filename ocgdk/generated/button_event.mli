class type button_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_button_event : Raw.Button_event.t
end

class button_event : Raw.Button_event.t -> button_event_t
