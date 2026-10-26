class type callback_action_t = object
  inherit GShortcut_action.shortcut_action_t
  method as_callback_action : Callback_action.t
end

class callback_action : Callback_action.t -> callback_action_t
