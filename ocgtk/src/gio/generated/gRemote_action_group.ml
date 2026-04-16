class type remote_action_group_t = object
    method activate_action_full : string -> Gvariant.t option -> Gvariant.t -> unit
    method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit
    method as_remote_action_group : Remote_action_group.t
end

(* High-level class for RemoteActionGroup *)
class remote_action_group (obj : Remote_action_group.t) : remote_action_group_t = object (self)

  method activate_action_full : string -> Gvariant.t option -> Gvariant.t -> unit =
    fun action_name parameter platform_data ->
      (Remote_action_group.activate_action_full obj action_name parameter platform_data)

  method change_action_state_full : string -> Gvariant.t -> Gvariant.t -> unit =
    fun action_name value platform_data ->
      (Remote_action_group.change_action_state_full obj action_name value platform_data)

    method as_remote_action_group = obj
end

