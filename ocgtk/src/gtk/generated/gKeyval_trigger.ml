(* High-level class for KeyvalTrigger *)
class keyval_trigger (obj : Keyval_trigger.t) = object (self)

  method get_keyval : unit -> int =
    fun () ->
      (Keyval_trigger.get_keyval obj)

    method as_keyval_trigger = obj
end

