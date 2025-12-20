(* High-level class for ActionMap *)
class action_map (obj : Action_map.t) = object (self)

  method remove_action : string -> unit =
    fun action_name ->
      (Action_map.remove_action obj action_name)

    method as_action_map = obj
end

