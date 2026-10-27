(** Triggers when a specific keyval and modifiers are pressed.

    Its methods, signals and properties are on {!class-type-keyval_trigger_t}.
    The functions it is built on are in {!Ocgtk.Raw.Keyval_trigger}. *)

(** The methods, signals and properties of a [GtkKeyvalTrigger]. *)
class type keyval_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method get_keyval : unit -> int
  method get_modifiers : unit -> Ocgdk.Enums.modifiertype
  method as_keyval_trigger : Raw.Keyval_trigger.t
end

class keyval_trigger : Raw.Keyval_trigger.t -> keyval_trigger_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Keyval_trigger.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkKeyvalTrigger], give one already wrapped. *)

val new_ : int -> Ocgdk.Enums.modifiertype -> keyval_trigger_t
