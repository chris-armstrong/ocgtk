class keyval_trigger : Keyval_trigger.t ->
  object
    method get_keyval : unit -> int
    method as_keyval_trigger : Keyval_trigger.t
  end

