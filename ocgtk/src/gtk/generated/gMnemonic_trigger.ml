class type mnemonic_trigger_t = object
    method get_keyval : unit -> int
    method as_mnemonic_trigger : Mnemonic_trigger.t
end

(* High-level class for MnemonicTrigger *)
class mnemonic_trigger (obj : Mnemonic_trigger.t) : mnemonic_trigger_t = object (self)

  method get_keyval : unit -> int =
    fun () ->
      (Mnemonic_trigger.get_keyval obj)

    method as_mnemonic_trigger = obj
end

