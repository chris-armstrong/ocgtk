class type crossing_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_detail : unit -> Enums.notifytype
  (** Extracts the notify detail from a crossing event. *)

  method get_focus : unit -> bool
  (** Checks if the [event] surface is the focus surface. *)

  method get_mode : unit -> Enums.crossingmode
  (** Extracts the crossing mode from a crossing event. *)

  (** {2:conversions Conversions} *)

  method as_crossing_event : Raw.Crossing_event.t
end

(* High-level class for CrossingEvent *)
class crossing_event (obj : Raw.Crossing_event.t) : crossing_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)

    method get_detail : unit -> Enums.notifytype =
      fun () -> Raw.Crossing_event.get_detail obj

    method get_focus : unit -> bool = fun () -> Raw.Crossing_event.get_focus obj

    method get_mode : unit -> Enums.crossingmode =
      fun () -> Raw.Crossing_event.get_mode obj

    method as_crossing_event = obj
  end
