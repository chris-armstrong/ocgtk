class type nothing_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method as_nothing_action : Nothing_action.t
end

(* High-level class for NothingAction *)
class nothing_action (obj : Nothing_action.t) : nothing_action_t = object (self)
  inherit GShortcut_action.shortcut_action (obj :> Shortcut_action.t)

    method as_nothing_action = obj
end

