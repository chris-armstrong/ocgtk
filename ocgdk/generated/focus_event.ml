class type focus_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_in : unit -> bool
  (** Extracts whether this event is about focus entering or leaving the
      surface. *)

  (** {2:conversions Conversions} *)

  method as_focus_event : Raw.Focus_event.t
end

(* High-level class for FocusEvent *)
class focus_event (obj : Raw.Focus_event.t) : focus_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)
    method get_in : unit -> bool = fun () -> Raw.Focus_event.get_in obj
    method as_focus_event = obj
  end
