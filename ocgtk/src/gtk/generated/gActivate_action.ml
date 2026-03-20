class type activate_action_t = object
    method as_activate_action : Activate_action.t
end

(* High-level class for ActivateAction *)
class activate_action (obj : Activate_action.t) : activate_action_t = object (self)

    method as_activate_action = obj
end

