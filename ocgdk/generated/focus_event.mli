(** An event related to a keyboard focus change.

    Its methods, signals and properties are on {!class-type-focus_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Focus_event}. *)

(** The methods, signals and properties of a [GdkFocusEvent]. *)
class type focus_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_in : unit -> bool
  method as_focus_event : Raw.Focus_event.t
end

class focus_event : Raw.Focus_event.t -> focus_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Focus_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkFocusEvent], give one already wrapped. *)
