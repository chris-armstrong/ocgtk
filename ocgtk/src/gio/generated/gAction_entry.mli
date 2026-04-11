class type action_entry_t = object
  method as_action_entry : Action_entry.t
end

class action_entry : Action_entry.t -> action_entry_t
