(** An event related to a keyboard focus change.

    Its methods, signals and properties are on {!class-type-focus_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Focus_event}. *)

(** The methods, signals and properties of a [FocusEvent]. *)
class type focus_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t

  method get_in : unit -> bool
  (** Extracts whether this event is about focus entering or leaving the
      surface. *)

  method as_focus_event : Raw.Focus_event.t
end

class focus_event : Raw.Focus_event.t -> focus_event_t
(** Wraps a raw handle of {!Ocgdk.Raw.Focus_event.t}. *)
