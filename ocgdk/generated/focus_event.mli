(** An event related to a keyboard focus change.

    Its methods, signals and properties are on {!class-type-focus_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Focus_event}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FocusEvent].}

    An event related to a keyboard focus change. *)
class type focus_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  (** {2:methods Methods} *)

  method get_in : unit -> bool
  (** Extracts whether this event is about focus entering or leaving the
      surface. *)

  (** {2:conversions Conversions} *)

  method as_focus_event : Raw.Focus_event.t
end

class focus_event : Raw.Focus_event.t -> focus_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Focus_event.t}. *)
