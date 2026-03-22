class type simple_action_group_t = object
    method lookup : string -> GAction.action_t
    method remove : string -> unit
    method as_simple_action_group : Simple_action_group.t
end

(* High-level class for SimpleActionGroup *)
class simple_action_group (obj : Simple_action_group.t) : simple_action_group_t = object (self)

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

