class type nothing_action_t = object
  inherit GShortcut_action.shortcut_action_t
  method as_nothing_action : Nothing_action.t
end

class nothing_action : Nothing_action.t -> nothing_action_t
