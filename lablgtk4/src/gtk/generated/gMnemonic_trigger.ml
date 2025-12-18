(* High-level class for MnemonicTrigger *)
class mnemonic_trigger (obj : Mnemonic_trigger.t) = object (self)

  method keyval = Mnemonic_trigger.get_keyval obj

    method as_mnemonic_trigger = obj
end

