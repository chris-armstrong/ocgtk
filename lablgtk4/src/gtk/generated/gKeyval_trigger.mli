class keyval_trigger : Keyval_trigger.t ->
  object
    method keyval : int
    method get_modifiers : unit -> Gdk.modifiertype
    method as_keyval_trigger : Keyval_trigger.t
  end

