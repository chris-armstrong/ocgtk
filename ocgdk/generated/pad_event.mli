(** An event related to a pad-based device.

    Its methods, signals and properties are on {!class-type-pad_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Pad_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [PadEvent].}

    Inherits from: {{!Ocgdk.Event.class-type-event_t}Ocgdk.Event}

    An event related to a pad-based device. *)
class type pad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_button : unit -> int
  (** Extracts information about the pressed button from a pad event. *)

  (** {2:conversions Conversions} *)

  method as_pad_event : Raw.Pad_event.t
end

class pad_event : Raw.Pad_event.t -> pad_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Pad_event.t}. *)
