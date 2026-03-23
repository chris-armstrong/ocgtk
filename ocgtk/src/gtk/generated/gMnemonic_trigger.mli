class type mnemonic_trigger_t = object
    inherit GShortcut_trigger.shortcut_trigger_t
    method get_keyval : unit -> int
    method as_mnemonic_trigger : Mnemonic_trigger.t
end

class mnemonic_trigger : Mnemonic_trigger.t -> mnemonic_trigger_t

val new_ : int -> mnemonic_trigger_t
