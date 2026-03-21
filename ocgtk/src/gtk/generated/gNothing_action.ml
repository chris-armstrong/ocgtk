class type nothing_action_t = object
    method as_nothing_action : Nothing_action.t
end

(* High-level class for NothingAction *)
class nothing_action (obj : Nothing_action.t) : nothing_action_t = object (self)

    method as_nothing_action = obj
end

