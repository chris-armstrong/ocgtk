(** An event related to a pad-based device.

    Its methods, signals and properties are on {!class-type-pad_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Pad_event}. *)

(** The methods, signals and properties of a [GdkPadEvent]. *)
class type pad_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_pad_event : Raw.Pad_event.t
end

class pad_event : Raw.Pad_event.t -> pad_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Pad_event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkPadEvent], give one already wrapped. *)
