class type d_bus_action_group_t = object
  inherit GAction_group.action_group_t
  inherit GRemote_action_group.remote_action_group_t
  method as_d_bus_action_group : D_bus_action_group.t
end

(* High-level class for DBusActionGroup *)
class d_bus_action_group (obj : D_bus_action_group.t) : d_bus_action_group_t =
  object (self)
    inherit GAction_group.action_group (Action_group.from_gobject obj)

    inherit
      GRemote_action_group.remote_action_group
        (Remote_action_group.from_gobject obj)

    method as_d_bus_action_group = obj
  end
