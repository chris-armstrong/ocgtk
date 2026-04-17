class type activate_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method as_activate_action : Activate_action.t
end

(* High-level class for ActivateAction *)
class activate_action (obj : Activate_action.t) : activate_action_t = object (self)
  inherit GShortcut_action.shortcut_action (obj :> Shortcut_action.t)

    method as_activate_action = obj
end

