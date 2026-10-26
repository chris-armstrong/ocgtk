class type activate_action_t = object
  inherit Shortcut_action.shortcut_action_t
  method as_activate_action : Raw.Activate_action.t
end

(* High-level class for ActivateAction *)
class activate_action (obj : Raw.Activate_action.t) : activate_action_t =
  object (self)
    inherit Shortcut_action.shortcut_action (obj :> Raw.Shortcut_action.t)
    method as_activate_action = obj
  end
