(* High-level class for KeyvalTrigger *)
class keyval_trigger (obj : Keyval_trigger.t) = object (self)

  method keyval = Keyval_trigger.get_keyval obj

  method get_modifiers : unit -> Gdk.modifiertype = fun () -> (Keyval_trigger.get_modifiers obj )

    method as_keyval_trigger = obj
end

