class type actionable_t = object
    method get_action_name : unit -> string option
    method get_action_target_value : unit -> Gvariant.t option
    method set_action_name : string option -> unit
    method set_action_target_value : Gvariant.t option -> unit
    method set_detailed_action_name : string -> unit
    method as_actionable : Actionable.t
end

(* High-level class for Actionable *)
class actionable (obj : Actionable.t) : actionable_t = object (self)

  method get_action_name : unit -> string option =
    fun () ->
      (Actionable.get_action_name obj)

  method get_action_target_value : unit -> Gvariant.t option =
    fun () ->
      (Actionable.get_action_target_value obj)

  method set_action_name : string option -> unit =
    fun action_name ->
      (Actionable.set_action_name obj action_name)

  method set_action_target_value : Gvariant.t option -> unit =
    fun target_value ->
      (Actionable.set_action_target_value obj target_value)

  method set_detailed_action_name : string -> unit =
    fun detailed_action_name ->
      (Actionable.set_detailed_action_name obj detailed_action_name)

    method as_actionable = obj
end

