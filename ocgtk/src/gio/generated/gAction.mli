class type action_t = object
    method get_enabled : unit -> bool
    method get_name : unit -> string
    method as_action : Action.t
end

class action : Action.t -> action_t

