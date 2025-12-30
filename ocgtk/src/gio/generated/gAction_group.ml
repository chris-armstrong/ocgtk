(* Signal class defined in gaction_group_signals.ml *)

(* High-level class for ActionGroup *)
class action_group (obj : Action_group.t) = object (self)
  inherit Gaction_group_signals.action_group_signals obj

  method action_added : string -> unit =
    fun action_name ->
      (Action_group.action_added obj action_name)

  method action_enabled_changed : string -> bool -> unit =
    fun action_name enabled ->
      (Action_group.action_enabled_changed obj action_name enabled)

  method action_removed : string -> unit =
    fun action_name ->
      (Action_group.action_removed obj action_name)

  method get_action_enabled : string -> bool =
    fun action_name ->
      (Action_group.get_action_enabled obj action_name)

  method has_action : string -> bool =
    fun action_name ->
      (Action_group.has_action obj action_name)

    method as_action_group = obj
end

