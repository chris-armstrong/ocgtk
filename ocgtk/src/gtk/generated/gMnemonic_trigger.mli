class type mnemonic_trigger_t = object
    method get_keyval : unit -> int
    method as_mnemonic_trigger : Mnemonic_trigger.t
end

class mnemonic_trigger : Mnemonic_trigger.t -> mnemonic_trigger_t

