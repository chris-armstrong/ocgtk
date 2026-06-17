class type button_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_button_event : Button_event.t
end

(* High-level class for ButtonEvent *)
class button_event (obj : Button_event.t) : button_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_button : unit -> int = fun () -> Button_event.get_button obj
    method as_button_event = obj
  end
