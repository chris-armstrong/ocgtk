(* High-level class for Action *)
class action (obj : Action.t) = object (self)

  method get_enabled : unit -> bool =
    fun () ->
      (Action.get_enabled obj)

  method get_name : unit -> string =
    fun () ->
      (Action.get_name obj)

    method as_action = obj
end

