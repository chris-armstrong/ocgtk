class type callback_action_t = object
    inherit GShortcut_action.shortcut_action_t
    method as_callback_action : Callback_action.t
end

(* High-level class for CallbackAction *)
class callback_action (obj : Callback_action.t) : callback_action_t = object (self)
  inherit GShortcut_action.shortcut_action (obj :> Shortcut_action.t)

    method as_callback_action = obj
end

