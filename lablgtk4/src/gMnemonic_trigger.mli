class mnemonic_trigger : Mnemonic_trigger.t ->
  object
    method get_keyval : unit -> int
    method as_mnemonic_trigger : Mnemonic_trigger.t
  end

