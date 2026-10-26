class type simple_action_group_t = object
  inherit Action_group.action_group_t
  inherit Action_map.action_map_t
  method insert : Action.action_t -> unit
  method lookup : string -> Action.action_t
  method remove : string -> unit
  method as_simple_action_group : Raw.Simple_action_group.t
end

(* High-level class for SimpleActionGroup *)
class simple_action_group (obj : Raw.Simple_action_group.t) :
  simple_action_group_t =
  object (self)
    inherit Action_group.action_group (Raw.Action_group.from_gobject obj)
    inherit Action_map.action_map (Raw.Action_map.from_gobject obj)

    method insert : Action.action_t -> unit =
      fun action ->
        let action = action#as_action in
        Raw.Simple_action_group.insert obj action

    method lookup : string -> Action.action_t =
      fun action_name ->
        new Action.action (Raw.Simple_action_group.lookup obj action_name)

    method remove : string -> unit =
      fun action_name -> Raw.Simple_action_group.remove obj action_name

    method as_simple_action_group = obj
  end

let new_ () : simple_action_group_t =
  new simple_action_group (Raw.Simple_action_group.new_ ())
