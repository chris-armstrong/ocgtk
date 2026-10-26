class type crossing_event_t = object
  inherit GApp_launch_context_cycle_de440b34.event_t
  method get_detail : unit -> Gdk_enums.notifytype
  method get_focus : unit -> bool
  method get_mode : unit -> Gdk_enums.crossingmode
  method as_crossing_event : Crossing_event.t
end

(* High-level class for CrossingEvent *)
class crossing_event (obj : Crossing_event.t) : crossing_event_t =
  object (self)
    inherit
      GApp_launch_context_cycle_de440b34.event
        (obj :> App_launch_context_cycle_de440b34.Event.t)

    method get_detail : unit -> Gdk_enums.notifytype =
      fun () -> Crossing_event.get_detail obj

    method get_focus : unit -> bool = fun () -> Crossing_event.get_focus obj

    method get_mode : unit -> Gdk_enums.crossingmode =
      fun () -> Crossing_event.get_mode obj

    method as_crossing_event = obj
  end
