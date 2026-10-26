class type d_bus_action_group_t = object
  inherit GAction_group.action_group_t
  inherit GRemote_action_group.remote_action_group_t
  method as_d_bus_action_group : D_bus_action_group.t
end

class d_bus_action_group : D_bus_action_group.t -> d_bus_action_group_t
