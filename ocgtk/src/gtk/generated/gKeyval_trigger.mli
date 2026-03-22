class type keyval_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method get_keyval : unit -> int
    method get_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method as_keyval_trigger : Keyval_trigger.t
end

class keyval_trigger : Keyval_trigger.t -> keyval_trigger_t

