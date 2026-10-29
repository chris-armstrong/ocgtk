class type button_event_t = object
  inherit Event.event_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Extract the button number from a button event. *)

  (** {2:conversions Conversions} *)

  method as_button_event : Raw.Button_event.t
end

(* High-level class for ButtonEvent *)
class button_event (obj : Raw.Button_event.t) : button_event_t =
  object (self)
    inherit Event.event (obj :> Raw.Event.t)
    method get_button : unit -> int = fun () -> Raw.Button_event.get_button obj
    method as_button_event = obj
  end
