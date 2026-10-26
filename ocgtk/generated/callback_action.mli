class type callback_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_callback_action : Raw.Callback_action.t
end

class callback_action : Raw.Callback_action.t -> callback_action_t
