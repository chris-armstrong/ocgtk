class type focus_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_in : unit -> bool
  method as_focus_event : Focus_event.t
end

(* High-level class for FocusEvent *)
class focus_event (obj : Focus_event.t) : focus_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_in : unit -> bool = fun () -> Focus_event.get_in obj
    method as_focus_event = obj
  end
