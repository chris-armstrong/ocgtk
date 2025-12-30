(* High-level class for MnemonicTrigger *)
class mnemonic_trigger (obj : Mnemonic_trigger.t) = object (self)

  method get_keyval : unit -> int =
    fun () ->
      (Mnemonic_trigger.get_keyval obj)

    method as_mnemonic_trigger = obj
end

