class type mnemonic_action_t = object
    method as_mnemonic_action : Mnemonic_action.t
end

class mnemonic_action : Mnemonic_action.t -> mnemonic_action_t

