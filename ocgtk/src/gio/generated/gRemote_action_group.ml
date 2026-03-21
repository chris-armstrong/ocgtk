class type remote_action_group_t = object
    method as_remote_action_group : Remote_action_group.t
end

(* High-level class for RemoteActionGroup *)
class remote_action_group (obj : Remote_action_group.t) : remote_action_group_t = object (self)

    method as_remote_action_group = obj
end

