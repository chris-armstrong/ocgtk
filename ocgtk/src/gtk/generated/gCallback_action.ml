class type callback_action_t = object
    method as_callback_action : Callback_action.t
end

(* High-level class for CallbackAction *)
class callback_action (obj : Callback_action.t) : callback_action_t = object (self)

    method as_callback_action = obj
end

