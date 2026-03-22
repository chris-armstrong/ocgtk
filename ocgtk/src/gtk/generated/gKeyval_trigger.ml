class type keyval_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method get_keyval : unit -> int
    method get_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method as_keyval_trigger : Keyval_trigger.t
end

(* High-level class for KeyvalTrigger *)
class keyval_trigger (obj : Keyval_trigger.t) : keyval_trigger_t = object (self)
  inherit GShortcut_trigger.shortcut_trigger (Obj.magic obj : Shortcut_trigger.t)

  method get_keyval : unit -> int =
    fun () ->
      (Keyval_trigger.get_keyval obj)

  method get_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype =
    fun () ->
      (Keyval_trigger.get_modifiers obj)

    method as_keyval_trigger = obj
end

