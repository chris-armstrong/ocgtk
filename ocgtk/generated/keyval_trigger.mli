class type keyval_trigger_t = object
  inherit Shortcut_trigger.shortcut_trigger_t
  method get_keyval : unit -> int
  method get_modifiers : unit -> Ocgdk.Enums.modifiertype
  method as_keyval_trigger : Raw.Keyval_trigger.t
end

class keyval_trigger : Raw.Keyval_trigger.t -> keyval_trigger_t

val new_ : int -> Ocgdk.Enums.modifiertype -> keyval_trigger_t
