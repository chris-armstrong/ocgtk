class type named_action_t = object
    method get_action_name : unit -> string
    method as_named_action : Named_action.t
end

class named_action : Named_action.t -> named_action_t

