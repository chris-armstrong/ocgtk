class type mnemonic_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_mnemonic_action : Raw.Mnemonic_action.t
end

(* High-level class for MnemonicAction *)
class mnemonic_action (obj : Raw.Mnemonic_action.t) : mnemonic_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)
    method as_mnemonic_action = obj
  end
