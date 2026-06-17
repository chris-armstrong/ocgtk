class type button_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_button_event : Button_event.t
end

class button_event : Button_event.t -> button_event_t
