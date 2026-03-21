class type d_bus_action_group_t = object
    method as_d_bus_action_group : D_bus_action_group.t
end

(* High-level class for DBusActionGroup *)
class d_bus_action_group (obj : D_bus_action_group.t) : d_bus_action_group_t = object (self)

    method as_d_bus_action_group = obj
end

