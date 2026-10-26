class type d_bus_action_group_t = object
  inherit Action_group.action_group_t
  inherit Remote_action_group.remote_action_group_t
  method as_d_bus_action_group : Raw.D_bus_action_group.t
end

(* High-level class for DBusActionGroup *)
class d_bus_action_group (obj : Raw.D_bus_action_group.t) : d_bus_action_group_t
  =
  object (self)
    inherit Action_group.action_group (Raw.Action_group.from_gobject obj)

    inherit
      Remote_action_group.remote_action_group
        (Raw.Remote_action_group.from_gobject obj)

    method as_d_bus_action_group = obj
  end
