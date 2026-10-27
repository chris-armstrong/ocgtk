(** An event related to a button on a pointer device.

    Its methods, signals and properties are on {!class-type-button_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Button_event}. *)

(** The methods, signals and properties of a [GdkButtonEvent]. *)
class type button_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_button : unit -> int
  method as_button_event : Raw.Button_event.t
end

class button_event : Raw.Button_event.t -> button_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Button_event.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkButtonEvent], give one already wrapped. *)
