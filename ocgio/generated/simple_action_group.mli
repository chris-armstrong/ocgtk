class type simple_action_group_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t
  method insert : Action.action_t -> unit
  method lookup : string -> Action.action_t
  method remove : string -> unit
  method as_simple_action_group : Raw.Simple_action_group.t
end

class simple_action_group : Raw.Simple_action_group.t -> simple_action_group_t

val new_ : unit -> simple_action_group_t
