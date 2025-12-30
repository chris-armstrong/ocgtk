(* High-level class for ActionMap *)
class action_map (obj : Action_map.t) = object (self)

  method lookup_action : string -> GAction.action option =
    fun action_name ->
      Option.map (fun ret -> new GAction.action ret) (Action_map.lookup_action obj action_name)

  method remove_action : string -> unit =
    fun action_name ->
      (Action_map.remove_action obj action_name)

    method as_action_map = obj
end

