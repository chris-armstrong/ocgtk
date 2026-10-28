class type pad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Extracts information about the pressed button from a pad event. *)

  (** {2:conversions Conversions} *)

  method as_pad_event : Raw.Pad_event.t
end

(* High-level class for PadEvent *)
class pad_event (obj : Raw.Pad_event.t) : pad_event_t =
  object (self)
    inherit App_launch_context_cycle_de440b34.event (obj :> Raw.Event.t)
    method get_button : unit -> int = fun () -> Raw.Pad_event.get_button obj
    method as_pad_event = obj
  end
