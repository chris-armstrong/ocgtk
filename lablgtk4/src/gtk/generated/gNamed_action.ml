(* High-level class for NamedAction *)
class named_action (obj : Named_action.t) = object (self)

  method action_name = Named_action.get_action_name obj

    method as_named_action = obj
end

