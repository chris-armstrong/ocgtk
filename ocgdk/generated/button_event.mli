(** An event related to a button on a pointer device.

    Its methods, signals and properties are on {!class-type-button_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Button_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [ButtonEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a button on a pointer device. *)
class type button_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Extract the button number from a button event. *)

  (** {2:conversions Conversions} *)

  method as_button_event : Raw.Button_event.t
end

class button_event : Raw.Button_event.t -> button_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Button_event.t}. *)
