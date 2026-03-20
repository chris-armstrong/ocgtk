class type remote_action_group_t = object
    method as_remote_action_group : Remote_action_group.t
end

class remote_action_group : Remote_action_group.t -> remote_action_group_t

