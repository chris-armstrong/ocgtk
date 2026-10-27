(** [GDBusActionGroup] is an implementation of the [Gio.ActionGroup] interface.

    [GDBusActionGroup] can be used as a proxy for an action group that is
    exported over D-Bus with [Gio.DBusConnection.export_action_group].

    Its methods, signals and properties are on
    {!class-type-d_bus_action_group_t}. The functions it is built on are in
    {!Ocgio.Raw.D_bus_action_group}. *)

(** The methods, signals and properties of a [GDBusActionGroup]. *)
class type d_bus_action_group_t = object
  inherit Action_group.action_group_t
  inherit Remote_action_group.remote_action_group_t
  method as_d_bus_action_group : Raw.D_bus_action_group.t
end

class d_bus_action_group : Raw.D_bus_action_group.t -> d_bus_action_group_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.D_bus_action_group.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GDBusActionGroup], give one already wrapped. *)
