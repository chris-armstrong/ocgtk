class type mnemonic_action_t = object
  inherit GShortcut_action.shortcut_action_t
  method as_mnemonic_action : Mnemonic_action.t
end

class mnemonic_action : Mnemonic_action.t -> mnemonic_action_t
