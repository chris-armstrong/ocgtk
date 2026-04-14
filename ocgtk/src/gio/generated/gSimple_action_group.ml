class type simple_action_group_t = object
    inherit GAction_group.action_group_t
    inherit GAction_map.action_map_t
    method insert : GAction.action_t -> unit
    method lookup : string -> GAction.action_t
    method remove : string -> unit
    method as_simple_action_group : Simple_action_group.t
end

(* High-level class for SimpleActionGroup *)
class simple_action_group (obj : Simple_action_group.t) : simple_action_group_t = object (self)
  inherit GAction_group.action_group (Action_group.from_gobject obj)
  inherit GAction_map.action_map (Action_map.from_gobject obj)

  method insert : GAction.action_t -> unit =
    fun action ->
      let action = action#as_action in
      (Simple_action_group.insert obj action)

  method lookup : string -> GAction.action_t =
    fun action_name ->
      new  GAction.action(Simple_action_group.lookup obj action_name)

  method remove : string -> unit =
    fun action_name ->
      (Simple_action_group.remove obj action_name)

    method as_simple_action_group = obj
end

let new_ () : simple_action_group_t =
  new simple_action_group (Simple_action_group.new_ ())

