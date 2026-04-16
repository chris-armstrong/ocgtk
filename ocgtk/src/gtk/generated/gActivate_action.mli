class type activate_action_t = object
  inherit GShortcut_action.shortcut_action_t
  method as_activate_action : Activate_action.t
end

class activate_action : Activate_action.t -> activate_action_t
