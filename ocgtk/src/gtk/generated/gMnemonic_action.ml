class type mnemonic_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method as_mnemonic_action : Mnemonic_action.t
end

(* High-level class for MnemonicAction *)
class mnemonic_action (obj : Mnemonic_action.t) : mnemonic_action_t = object (self)
  inherit GShortcut_action.shortcut_action (Obj.magic obj : Shortcut_action.t)

    method as_mnemonic_action = obj
end

