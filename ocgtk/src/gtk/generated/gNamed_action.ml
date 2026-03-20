class type named_action_t = object
    method get_action_name : unit -> string
    method as_named_action : Named_action.t
end

(* High-level class for NamedAction *)
class named_action (obj : Named_action.t) : named_action_t = object (self)

  method get_action_name : unit -> string =
    fun () ->
      (Named_action.get_action_name obj)

    method as_named_action = obj
end

