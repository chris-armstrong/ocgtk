(* High-level class for Actionable *)
class actionable (obj : Actionable.t) = object (self)

  method get_action_name : unit -> string option =
    fun () ->
      (Actionable.get_action_name obj)

  method set_action_name : string option -> unit =
    fun action_name ->
      (Actionable.set_action_name obj action_name)

  method set_detailed_action_name : string -> unit =
    fun detailed_action_name ->
      (Actionable.set_detailed_action_name obj detailed_action_name)

    method as_actionable = obj
end

