class keyval_trigger : Keyval_trigger.t ->
  object
    method get_keyval : unit -> int
    method get_modifiers : unit -> Ocgtk_gdk.Gdk.modifiertype
    method as_keyval_trigger : Keyval_trigger.t
  end

