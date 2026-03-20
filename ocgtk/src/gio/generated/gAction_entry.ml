class type action_entry_t = object
    method as_action_entry : Action_entry.t
end

(* High-level class for ActionEntry *)
class action_entry (obj : Action_entry.t) : action_entry_t = object (self)

    method as_action_entry = obj
end

