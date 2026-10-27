class type action_map_t = object
  method add_action : Action.action_t -> unit
  method lookup_action : string -> Action.action_t option
  method remove_action : string -> unit
  method remove_action_entries : Raw.Action_entry.t array -> int -> unit
  method as_action_map : Raw.Action_map.t
end

(* High-level class for ActionMap *)
class action_map (obj : Raw.Action_map.t) : action_map_t =
  object (self)
    method add_action : Action.action_t -> unit =
      fun action ->
        let action = action#as_action in
        Raw.Action_map.add_action obj action

    method lookup_action : string -> Action.action_t option =
      fun action_name ->
        Option.map
          (fun ret -> new Action.action ret)
          (Raw.Action_map.lookup_action obj action_name)

    method remove_action : string -> unit =
      fun action_name -> Raw.Action_map.remove_action obj action_name

    method remove_action_entries : Raw.Action_entry.t array -> int -> unit =
      fun entries n_entries ->
        Raw.Action_map.remove_action_entries obj entries n_entries

    method as_action_map = obj
  end
