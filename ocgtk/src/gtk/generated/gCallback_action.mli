class type callback_action_t = object
    method as_callback_action : Callback_action.t
end

class callback_action : Callback_action.t -> callback_action_t

