class type mnemonic_action_t = object
    method as_mnemonic_action : Mnemonic_action.t
end

(* High-level class for MnemonicAction *)
class mnemonic_action (obj : Mnemonic_action.t) : mnemonic_action_t = object (self)

    method as_mnemonic_action = obj
end

