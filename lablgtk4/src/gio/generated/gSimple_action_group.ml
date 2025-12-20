(* High-level class for SimpleActionGroup *)
class simple_action_group (obj : Simple_action_group.t) = object (self)

  method remove : string -> unit =
    fun action_name ->
      (Simple_action_group.remove obj action_name)

    method as_simple_action_group = obj
end

