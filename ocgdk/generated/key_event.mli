(** An event related to a key-based device.

    Its methods, signals and properties are on {!class-type-key_event_t}. The
    functions it is built on are in {!Ocgdk.Raw.Key_event}. *)

(** The methods, signals and properties of a [GdkKeyEvent]. *)
class type key_event_t = object
  inherit App_launch_context_cycle_de440b34.event_t
  method get_consumed_modifiers : unit -> Enums.modifiertype
  method get_keycode : unit -> int
  method get_keyval : unit -> int
  method get_layout : unit -> int
  method get_level : unit -> int
  method is_modifier : unit -> bool
  method matches : int -> Enums.modifiertype -> Enums.keymatch
  method as_key_event : Raw.Key_event.t
end

class key_event : Raw.Key_event.t -> key_event_t
(** Wraps a layer 1 handle, {!Ocgdk.Raw.Key_event.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GdkKeyEvent], give one already wrapped. *)
