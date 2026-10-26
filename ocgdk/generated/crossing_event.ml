class type crossing_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_detail : unit -> Enums.notifytype
  method get_focus : unit -> bool
  method get_mode : unit -> Enums.crossingmode
  method as_crossing_event : Raw.Crossing_event.t
end

(* High-level class for CrossingEvent *)
class crossing_event (obj : Raw.Crossing_event.t) : crossing_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)

    method get_detail : unit -> Enums.notifytype =
      fun () -> Raw.Crossing_event.get_detail obj

    method get_focus : unit -> bool = fun () -> Raw.Crossing_event.get_focus obj

    method get_mode : unit -> Enums.crossingmode =
      fun () -> Raw.Crossing_event.get_mode obj

    method as_crossing_event = obj
  end
