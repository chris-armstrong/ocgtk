class type delete_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method as_delete_event : Delete_event.t
end

(* High-level class for DeleteEvent *)
class delete_event (obj : Delete_event.t) : delete_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method as_delete_event = obj
  end
