class type d_bus_action_group_t = object
  inherit Action_group.action_group_t
  inherit Remote_action_group.remote_action_group_t
  method as_d_bus_action_group : Raw.D_bus_action_group.t
end

class d_bus_action_group : Raw.D_bus_action_group.t -> d_bus_action_group_t
