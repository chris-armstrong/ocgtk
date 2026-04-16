class type action_map_t = object
  method add_action : GAction.action_t -> unit
  method lookup_action : string -> GAction.action_t option
  method remove_action : string -> unit
  method remove_action_entries : Action_entry.t array -> int -> unit
  method as_action_map : Action_map.t
end

(* High-level class for ActionMap *)
class action_map (obj : Action_map.t) : action_map_t =
  object (self)
    method add_action : GAction.action_t -> unit =
      fun action ->
        let action = action#as_action in
        Action_map.add_action obj action

    method lookup_action : string -> GAction.action_t option =
      fun action_name ->
        Option.map
          (fun ret -> new GAction.action ret)
          (Action_map.lookup_action obj action_name)

    method remove_action : string -> unit =
      fun action_name -> Action_map.remove_action obj action_name

    method remove_action_entries : Action_entry.t array -> int -> unit =
      fun entries n_entries ->
        Action_map.remove_action_entries obj entries n_entries

    method as_action_map = obj
  end
